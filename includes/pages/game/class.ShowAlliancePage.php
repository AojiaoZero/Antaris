<?php

/**
 *  2Moons
 *  Copyright (C) 2012 Jan Kröpke
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 * @package 2Moons
 * @author Jan Kröpke <info@2moons.cc>
 * @copyright 2012 Jan Kröpke <info@2moons.cc>
 * @license http://www.gnu.org/licenses/gpl.html GNU GPLv3 License
 * @version 1.7.3 (2013-05-19)
 * @info $Id: class.ShowAlliancePage.php 2640 2013-03-23 19:23:26Z slaver7 $
 * @link http://2moons.cc/
 */

class ShowAlliancePage extends AbstractPage
{
	public static $requireModule = MODULE_ALLIANCE;

	private $allianceData;
	private $ranks;
	private $rights;
	private $hasAlliance = false;
	private $hasApply = false;
	public $avalibleRanks	= array(
		'MEMBERLIST',
		//'ONLINESTATE',
		//'TRANSFER',
		//'SEEAPPLY',
		'MANAGEAPPLY',
		'ROUNDMAIL',
		'ADMIN',
		//'KICK',
		'DIPLOMATIC',
		'RANKS',
		'MANAGEUSERS'
		
	);
	
	function __construct() 
	{
		global $USER;
		parent::__construct();
		$this->hasAlliance	= $USER['ally_id'] != 0;
		$this->hasApply		= $this->isApply();
		if($this->hasAlliance && !$this->hasApply) {
			$this->setAllianceData($USER['ally_id']);
		}
	}
	
	private function setAllianceData($allianceID)
	{
		global $USER;
		$this->allianceData	= $GLOBALS['DATABASE']->getFirstRow("SELECT * FROM ".ALLIANCE." WHERE id = ".$allianceID.";");
		
		if($USER['ally_id'] == $allianceID)
		{
			if ($this->allianceData['ally_owner'] == $USER['id']) {
				$this->rights	= array_combine($this->avalibleRanks, array_fill(0, count($this->avalibleRanks), true));
			} elseif($USER['ally_rank_id'] != 0) {
				$this->rights	= $GLOBALS['DATABASE']->getFirstRow("SELECT ".implode(", ", $this->avalibleRanks)." FROM ".ALLIANCE_RANK." WHERE allianceID = ".$allianceID." AND rankID = ".$USER['ally_rank_id'].";");
			}
			
			if(!isset($this->rights)) {
				$this->rights	= array_combine($this->avalibleRanks, array_fill(0, count($this->avalibleRanks), false));
			}
		
			if(isset($this->tplObj))
			{
				$this->tplObj->assign_vars(array(
					'rights'		=> $this->rights,
					'AllianceOwner'	=> $this->allianceData['ally_owner'] == $USER['id'],
				));
			}
		}
	}
	
	private function isApply()
	{
		global $USER;
		return $GLOBALS['DATABASE']->getFirstCell("SELECT COUNT(*) FROM ".ALLIANCE_REQUEST." WHERE userID = ".$USER['id'].";");
	}
	
	function info() 
	{
		global $LNG, $USER, $PLANET;
		
		$allianceID = HTTP::_GP('id', 0);
		
		$this->setAllianceData($allianceID);

		if(!isset($this->allianceData))
		{
			$this->printMessage('<span class="rouge">'.$LNG['al_not_exists'].'</span>');
		}
		
		require_once('includes/functions/BBCode.php');
		
		if ($this->allianceData['ally_diplo'] == 1)
		{
			$this->tplObj->assign_vars(array(
				'DiploInfo'			=> $this->getDiplomatic(),
			));
		}
		
		if ($this->allianceData['ally_stats'] == 1)
		{
			$StatsData 					= $GLOBALS['DATABASE']->getFirstRow("SELECT SUM(wons) as wons, SUM(loos) as loos, SUM(draws) as draws, SUM(kbmetal) as kbmetal, SUM(kbcrystal) as kbcrystal, SUM(lostunits) as lostunits, SUM(desunits) as desunits FROM ".USERS." WHERE ally_id='" . $this->allianceData['id'] . "';");

			$this->tplObj->assign_vars(array(
				'totalfight'	=> $StatsData['wons'] + $StatsData['loos'] + $StatsData['draws'],
				'fightwon'		=> $StatsData['wons'],
				'fightlose'		=> $StatsData['loos'],
				'fightdraw'		=> $StatsData['draws'],
				'unitsshot'		=> pretty_number($StatsData['desunits']),
				'unitslose'		=> pretty_number($StatsData['lostunits']),
				'dermetal'		=> pretty_number($StatsData['kbmetal']),
				'dercrystal'	=> pretty_number($StatsData['kbcrystal']),
			));
		}
		
		$StatsisData 					= $GLOBALS['DATABASE']->getFirstRow("SELECT total_points FROM ".STATPOINTS." WHERE id_ally='" . $this->allianceData['id'] . "';");
		
		$this->tplObj->assign_vars(array(
			'total_points' 				=> pretty_number($StatsisData['total_points']),
			'average' 				=> pretty_number($StatsisData['total_points'] / $this->allianceData['ally_members']),
			'ally_description' 				=> bbcode($this->allianceData['ally_description']),
			'ally_id'	 					=> $this->allianceData['id'],
			'founder'	 					=> $this->getUsername($this->allianceData['ally_owner']),
			'founderid'	 					=> $this->allianceData['ally_owner'],
			'ally_image' 					=> $this->allianceData['ally_image'],
			'creation_date' 					=> date('d-m-Y',$this->allianceData['ally_register_time']),
			'ally_web'						=> $this->allianceData['ally_web'],
			'recrutement'						=> $this->allianceData['ally_request_notallow'],
			'ally_member_scount' 			=> $this->allianceData['ally_members'],
			'ally_max_members' 				=> $this->allianceData['ally_max_members'],
			'ally_name' 					=> $this->allianceData['ally_name'],
			'ally_tag' 						=> $this->allianceData['ally_tag'],
			'ally_stats' 					=> $this->allianceData['ally_stats'],
			'ally_diplo' 					=> $this->allianceData['ally_diplo'],
			'ally_request'              	=> !$this->hasAlliance && !$this->hasApply && $this->allianceData['ally_request_notallow'] == 0 && $this->allianceData['ally_max_members'] > $this->allianceData['ally_members'],
			'ally_request_min_points'		=> $USER['total_points'] >= $this->allianceData['ally_request_min_points'],
			'ally_request_min_points_info'  => sprintf($LNG['al_requests_min_points'], pretty_number($this->allianceData['ally_request_min_points']))
		));
		
		$this->display('page.alliance.info.tpl');
	}
	
	function leaveAlly() {
	global $LNG, $USER, $PLANET;
	
	if (!empty($_POST))
	{
		if ($this->allianceData['ally_owner'] == $USER['id']) {
			$GLOBALS['DATABASE']->multi_query("UPDATE ".USERS." SET next_ally_register = ".(TIMESTAMP + 24*3600).", ally_id = '0' WHERE ally_id = ".$this->allianceData['id'].";
			UPDATE ".STATPOINTS." SET id_ally = '0' WHERE id_ally = ".$this->allianceData['id'].";
			DELETE FROM ".STATPOINTS." WHERE id_owner = ".$this->allianceData['id']." AND stat_type = 2;
			DELETE FROM ".ALLIANCE." WHERE id = ".$this->allianceData['id'].";
			DELETE FROM ".ALLIANCE_REQUEST." WHERE allianceID = ".$this->allianceData['id'].";
			DELETE FROM ".DIPLO." WHERE owner_1 = ".$this->allianceData['id']." OR owner_2 = ".$this->allianceData['id'].";");
		}
		$this->redirectToHome();
	}
		
		if ($this->allianceData['ally_owner'] != $USER['id']) {
		$this->redirectToHome();
		}
		
		$transferUserResult	= $GLOBALS['DATABASE']->query("SELECT u.id, u.username 
											  FROM ".USERS." u 
											  
											  WHERE u.ally_id = ".$this->allianceData['id']."
											  AND id != ".$this->allianceData['ally_owner'].";");
		$transferUserList	= array();

		while ($trasferUserRow = $GLOBALS['DATABASE']->fetch_array($transferUserResult))
		{
		$transferUserList[$trasferUserRow['id']]	= $trasferUserRow['username'];
		}
			
		$GLOBALS['DATABASE']->free_result($transferUserResult);

			

	$this->tplObj->assign_vars(array(
	
	'transferUserList'	=> $transferUserList,
	));
	$this->display('page.alliance.leave.tpl');
	}
	
	function recruitAlly() 
	{
		global $LNG, $USER, $PLANET;
		$action = HTTP::_GP('action', '');
		if(!empty($action)){
		
		$iddd = HTTP::_GP('idd', '');
		switch($_GET['action'])
	{
		case 'yes':
			$GLOBALS['DATABASE']->query("UPDATE ".ALLIANCE." SET  ally_request_notallow  = '0' WHERE id = ".$iddd.";");
			HTTP::redirectTo("game.php?page=alliance&mode=recruitAlly");
		break;
		case 'no':
			$GLOBALS['DATABASE']->query("UPDATE ".ALLIANCE." SET  ally_request_notallow  = '1' WHERE id = ".$iddd.";");
			HTTP::redirectTo("game.php?page=alliance&mode=recruitAlly");
		break;
	}
		}

		$ApplyCount					= $GLOBALS['DATABASE']->getFirstCell("SELECT COUNT(*) FROM ".ALLIANCE_REQUEST." WHERE allianceID = '".$this->allianceData['id']."';");
		$messageList = '';
		$GetAll = $GLOBALS['DATABASE']->query("SELECT s.total_rank, s.total_points, r.applyID, r.text, u.username, u.avatar, u.onlinetime, r.time FROM ".ALLIANCE_REQUEST." r INNER JOIN ".USERS." u ON r.userID = u.id LEFT JOIN uni1_statpoints s ON r.userID = s.id_owner WHERE r.allianceID = '".$this->allianceData['id']."';");
		if($GLOBALS['DATABASE']->numRows($GetAll)>0){
		while($messageRow = $GLOBALS['DATABASE']->fetch_array($GetAll))
		{
		$messageList[$messageRow['applyID']]	= array(
			'total_points'		=> pretty_number($messageRow['total_points']),
			'total_rank'		=> $messageRow['total_rank'],
			'applyID'		=> $messageRow['applyID'],
			'avatar'		=> $messageRow['avatar'],
			'text'		=> $messageRow['text'],
			'username'		=> $messageRow['username'],
			'onlinetime'		=> str_replace(' ', '&nbsp;', _date($LNG['php_tdformat'], $messageRow['onlinetime']), $USER['timezone']),
			'onlinetimet'		=> floor((TIMESTAMP - $messageRow['onlinetime']) / 60),
			'appy_time'		=> str_replace(' ', '&nbsp;', _date($LNG['php_tdformat'], $messageRow['time']), $USER['timezone']),
		);
		}	
		}
			
			
		$this->tplObj->assign_vars(array(
			'ally_request_notallow' => $this->allianceData['ally_request_notallow'],
			'ally_idd' => $this->allianceData['id'],
			'ApplyCount' => $ApplyCount,
			'messageList' => $messageList,
		));
		
		$this->display('page.alliance.recruit.tpl');
	}
	
	function pactes() 
	{
		global $LNG, $USER, $PLANET, $UNI;
		
		if(!empty($_POST)){
		$allianceID	= HTTP::_GP('tag_pacte', '', UTF8_SUPPORT);

		$allianceResult = $GLOBALS['DATABASE']->getFirstRow("SELECT ally_tag, ally_name, ally_members, defcon, ally_request, id, ally_owner, ally_request_notallow FROM ".ALLIANCE." WHERE ally_tag = '".$allianceID."' AND ally_universe = ".$UNI.";");
		
		if(!isset($allianceResult)){
		$this->printMessage('<span class="rouge">No alliance exist with this tag</span>');
		}
		
		$targetAlliance	= $GLOBALS['DATABASE']->getFirstRow("SELECT id, ally_name, ally_owner, ally_tag, (SELECT level FROM ".DIPLO." WHERE (owner_1 = ".$allianceResult['id']." AND owner_2 = ".$USER['ally_id'].") OR (owner_2 = ".$allianceResult['id']." AND owner_1 = ".$USER['ally_id'].")) as diplo FROM ".ALLIANCE." WHERE ally_universe = ".$UNI." AND id = '".$allianceResult['id']."';");
	
		
		if(!empty($targetAlliance['diplo'])) {
			$this->printMessage('<span class="rouge">You have already a pact with this alliance</span>');
		}
	
		if (!isset($allianceResult)) {
			$this->redirectToHome();
		}
		
		if (isset($allianceResult)) 
		{
			$GLOBALS['DATABASE']->query("INSERT INTO ".DIPLO." SET 
			owner_1		= ".$this->allianceData['id'].",
			owner_2		= ".$allianceResult['id'].", 
			level		= 1,
			accept		= 0, 
			accept_text	= '', 
			time	= ".TIMESTAMP.", 
			universe	= ".$UNI.";");
			
			
			SendSimpleMessage($allianceResult['ally_owner'], '', TIMESTAMP, 2, 'System', 'Request pact between ['.$this->allianceData['ally_tag'].'] and ['.$allianceResult['ally_tag'].']', '<span class="bbcode">Hello,<br>
<br>
The alliance "'.$this->allianceData['ally_name'].'" <span class="orange">['.$this->allianceData['ally_tag'].']</span> wants to make a pact with your alliance "'.$allianceResult['ally_name'].'" <span class="orange">['.$allianceResult['ally_tag'].']</span>.<br>
<i>Members who have rights can accept or reject the pact through the page "Alliance" Then go to the tab Pact".</i><br>
<br>
Best Regards</span>');
}
		}
		
		$diploList	= array(
			0 => array(
				1 => array(),
				
			),
			1 => array(
				1 => array(),
				
			),
			2 => array(
				1 => array(),
				
			)
		);
		
		$diploResult	= $GLOBALS['DATABASE']->query("SELECT d.id, d.level, d.time, d.accept, d.owner_1, d.owner_2, a.ally_name, a.ally_tag, ally_members FROM ".DIPLO." d
		INNER JOIN ".ALLIANCE." a ON IF(".$this->allianceData['id']." = d.owner_1, a.id = d.owner_2, a.id = d.owner_1)
		WHERE owner_1 = ".$this->allianceData['id']." OR owner_2 = ".$this->allianceData['id'].";");
	
		while($diploRow = $GLOBALS['DATABASE']->fetch_array($diploResult)) {
			$own	= $diploRow['owner_1'] == $this->allianceData['id'];
			
			
			
			
			
			$timingsend = str_replace(' ', '&nbsp;', _date($LNG['php_tdformat'], $diploRow['time']), $USER['timezone']);
			if($diploRow['accept'] == 1) {
				$diploList[0][$diploRow['level']][$diploRow['id']] = '<tr>			<td style="width : 35%; text-align : left;">
										<b>Name :</b> '.$diploRow['ally_name'].' <span class="couleur_alliance">['.$diploRow['ally_tag'].']</span>			</td>			<td style="width : 28%; text-align : left;">
										<b>Number of members :</b> <span class="couleur_theme">'.$diploRow['ally_members'].'</span><br>
										<b>Points :</b> <span class="couleur_theme">11 206 302 652</span> pts
									</td>			<td style="width : 27%; text-align : left;">		<b>Pact signed on</b>				<br>'.$timingsend.'			</td>			
									<td style="width : 10%; text-align : left;"><a href="game.php?page=alliance&amp;mode=admin&amp;action=diplomacyDelete&id='.$diploRow['id'].'"  class="rouge">Delete</a>			</td>		</tr>';
			} elseif($own) {
				$diploList[2][$diploRow['level']][$diploRow['id']] = '<tr>			<td style="width : 35%; text-align : left;">
										<b>Name :</b> '.$diploRow['ally_name'].' <span class="couleur_alliance">['.$diploRow['ally_tag'].']</span>			</td>			<td style="width : 28%; text-align : left;">
										<b>Number of members :</b> <span class="couleur_theme">'.$diploRow['ally_members'].'</span><br>
										<b>Points :</b> <span class="couleur_theme">11 206 302 652</span> pts
									</td>			<td style="width : 27%; text-align : left;">		<b>Covenant sent</b>				<br>'.$timingsend.'			</td>			
									<td style="width : 10%; text-align : left;"><span class="orange">Pending</span>			</td>	</tr>';
			} else {
				$diploList[1][$diploRow['level']][$diploRow['id']] = '<tr>			<td style="width : 35%; text-align : left;">
										<b>Name :</b> '.$diploRow['ally_name'].' <span class="couleur_alliance">['.$diploRow['ally_tag'].']</span>			</td>			<td style="width : 28%; text-align : left;">
										<b>Number of members :</b> <span class="couleur_theme">'.$diploRow['ally_members'].'</span><br>
										<b>Points :</b> <span class="couleur_theme">11 206 302 652</span> pts
									</td>			<td style="width : 27%; text-align : left;">		<b>Covenant sent</b>				<br>'.$timingsend.'			</td>		
<td style="width : 10%; text-align : left;"><a href="game.php?page=alliance&amp;mode=admin&amp;action=diplomacyAccept&id='.$diploRow['id'].'" class="vert">Accept</a><br><a href="game.php?page=alliance&amp;mode=admin&amp;action=diplomacyRefuse&id='.$diploRow['id'].'"  class="rouge">Deny</a>			</td>									
											</tr>';
			}
		}
		
		
		$this->tplObj->assign_vars(array(
		'diploList' => $diploList,
		));	
		
		$this->display('page.alliance.pact.tpl');
	}
	
	function show() 
	{
		global $LNG, $USER, $PLANET;
		if($USER['next_ally_register'] > TIMESTAMP) {
			$this->waitNextApply();
		}elseif($this->hasAlliance) {
			$this->homeAlliance();
		} elseif($this->hasApply) {		
			$this->applyWaitScreen();
		} else {		
			$this->createSelection();
		}
	}
	private function waitNextApply()
	{
		global $USER, $LNG;
		
		$this->tplObj->assign_vars(array(
		'nextdate' => str_replace(' ', '&nbsp;', _date($LNG['php_tdformat'], $USER['next_ally_register']), $USER['timezone']),
		
			));     
		$this->display('page.alliance.waitnext.tpl');		
	}
	
	 function changerank()
	{
		global $USER, $LNG;
		
		if(!$this->rights['RANKS']) {
			$this->redirectToHome();
		}
		$memberID	= HTTP::_GP('memberID', '');
		
		if($this->allianceData['ally_owner'] == $memberID )
		{
			$this->printMessage('<span class="rouge">You can not change your rank or rank of a founder.</span>');
		}
		
		$rankResult	= $GLOBALS['DATABASE']->query("SELECT * FROM ".ALLIANCE_RANK." WHERE allianceID = ".$this->allianceData['id'].";");
		$rankList	= array();
		
		while($rankRow = $GLOBALS['DATABASE']->fetch_array($rankResult))
			$rankList[$rankRow['rankID']]	= $rankRow;
		
		$GLOBALS['DATABASE']->free_result($rankResult);
		
	if (!empty($_POST))
	{
	$memberID	= HTTP::_GP('memberID', '');
	$rankID	= HTTP::_GP('nouveau_rang', '');
	$userResult	= $GLOBALS['DATABASE']->query("SELECT ally_id FROM ".USERS." WHERE id = ".$memberID.";");	
	$userResult = $GLOBALS['DATABASE']->fetch_array($userResult);
	$userResult = $userResult['ally_id'];
	
		if($this->allianceData['id'] != $userResult || !isset($userResult) )
		{
			$this->printMessage('<span class="rouge">This is not one of your alliance members.</span>');
		}else{
			
			$GLOBALS['DATABASE']->query("UPDATE ".USERS." set ally_rank_id = '".$rankID."' WHERE id = '".$memberID."';");
			HTTP::redirectTo("game.php?page=alliance&mode=memberList");
			
		}
	
		
	}
		
		$this->tplObj->assign_vars(array(
			'usernames'		=> $this->getUsername($memberID),
			'memberID'		=> $memberID,
			'rankList'		=> $rankList,
			'ownRights'		=> $this->rights,
			'avalibleRanks'	=> $this->avalibleRanks,
		));	
	

		$this->display('page.alliance.changerank.tpl');		
	}
	
	
	private function redirectToHome()
	{
		$this->redirectTo('game.php?page=alliance');
	}
	
	private function getAction()
	{
		return HTTP::_GP('action', '');
	}
	
	private function applyWaitScreen()
	{
		global $USER, $LNG;
		
		$allianceResult = $GLOBALS['DATABASE']->getFirstRow("SELECT a.ally_tag, a.ally_name, r.time FROM ".ALLIANCE_REQUEST." r INNER JOIN ".ALLIANCE." a ON a.id = r.allianceID WHERE r.userID = ".$USER['id'].";");
		$this->tplObj->assign_vars(array(
		'ally_tag' => $allianceResult['ally_tag'],	
		'ally_name' => $allianceResult['ally_name'],	
		'datess'		=> str_replace(' ', '&nbsp;', _date($LNG['php_tdformat'], $allianceResult['time']), $USER['timezone']),
			));     

		$this->display('page.alliance.applyWait.tpl');		
	}
	
	private function createSelection()
	{
		$this->display('page.alliance.createSelection.tpl');		
	}

	function search() 
	{
		global $UNI;
		if($this->hasApply) {
			$this->redirectToHome();
		}
		
		$searchText	= HTTP::_GP('searchtext', '', UTF8_SUPPORT);
		$searchList	= array();

		if (!empty($searchText))
		{
			$searchResult = $GLOBALS['DATABASE']->query("SELECT 
			id, ally_name, ally_tag, ally_members
			FROM ".ALLIANCE."
			WHERE ally_universe = ".$UNI." AND ally_name LIKE '%".$GLOBALS['DATABASE']->sql_escape($searchText, true)."%'
			ORDER BY (
			  IF(ally_name = '".$GLOBALS['DATABASE']->sql_escape($searchText, true)."', 1, 0)
			  + IF(ally_name LIKE '".$GLOBALS['DATABASE']->sql_escape($searchText, true)."%', 1, 0)
			) DESC,ally_name ASC LIMIT 25;");
			
			while($searchRow = $GLOBALS['DATABASE']->fetch_array($searchResult))
			{
				$searchList[]	= array(
					'id'		=> $searchRow['id'],
					'tag'		=> $searchRow['ally_tag'],
					'members'	=> $searchRow['ally_members'],
					'name'		=> $searchRow['ally_name'],
				);
			}
			
			$GLOBALS['DATABASE']->free_result($searchResult);
		}
		
		$this->tplObj->assign_vars(array(
			'searchText'	=> $searchText,
			'searchList'	=> $searchList,
		));	
		
		$this->display('page.alliance.search.tpl');	
	}
	
	function apply()
	{
		global $UNI, $LNG, $USER;
		
		if($this->hasApply) {
			$this->redirectToHome();
		}
		
		$text		= HTTP::_GP('texte' , '', true);
		$allianceID	= HTTP::_GP('tag', '', UTF8_SUPPORT);
			
		$allianceResult = $GLOBALS['DATABASE']->getFirstRow("SELECT ally_tag, ally_request, id, ally_owner, ally_request_notallow FROM ".ALLIANCE." WHERE ally_tag = '".$allianceID."' AND ally_universe = ".$UNI.";");

		if (!isset($allianceResult)) {
			$this->redirectToHome();
		}
		
		if($allianceResult['ally_request_notallow'] == 1)
		{
			$this->printMessage('<span class="rouge">'.$LNG['al_alliance_closed'].'</span>');
		}
		
		if (!empty($text))
		{
			$GLOBALS['DATABASE']->query("INSERT INTO ".ALLIANCE_REQUEST." SET 
			allianceID = '".$allianceResult['id']."', 
			text = '".$GLOBALS['DATABASE']->sql_escape($text)."', 
			time = ".TIMESTAMP.", 
			userID = ".$USER['id'].";");
			
			SendSimpleMessage($allianceResult['ally_owner'], '', TIMESTAMP, 2, 'System', ''.$USER['username'].' want to be recruited', 'Hello,<br>
<br>
The player <span class="jaune">'.$USER['username'].'</span> just apply for recruitment to integrate your alliance.<br>
<i>To accept or reject this request, go to the next page</i> : <a href="?page=alliance" title="Click the link to open the page" onclick="window.open(this.href, \'_PARENT\');return false;">?page=alliance</a> then go to the tab "Recruitement".<br>
<br>
Best regards.');

			$this->printMessage('<span class="vert">'.$LNG['al_request_confirmation_message'].'</span>');
		}
		
		$this->tplObj->assign_vars(array(
			'allyid'			=> $allianceID,
			'applytext'			=> $allianceResult['ally_request'],
			'al_write_request'	=> sprintf($LNG['al_write_request'], $allianceResult['ally_tag']),
		));	
		
		$this->display('page.alliance.apply.tpl');
	}
	
	function cancelApply()
	{
		global $UNI, $LNG, $USER;
		
		if(!$this->hasApply) {
			$this->redirectToHome();
		}
		
		$allyquery 	= $GLOBALS['DATABASE']->getFirstRow("SELECT a.ally_tag FROM ".ALLIANCE_REQUEST." r INNER JOIN ".ALLIANCE." a ON a.id = r.allianceID WHERE r.userID = ".$USER['id'].";");
		$GLOBALS['DATABASE']->query("DELETE FROM ".ALLIANCE_REQUEST." WHERE userID = ".$USER['id'].";");
		
		$this->printMessage('<span class="vert">'.sprintf($LNG['al_request_deleted'].'</span>', $allyquery['ally_tag']));
	}
	
	function create()
	{
		if($this->hasApply) {
			$this->redirectToHome();
		}
		
		$user_points = $GLOBALS['USER']['total_points'];
		$min_points = $GLOBALS['CONF']['alliance_create_min_points'];
		
		if($user_points >= $min_points)
		{
			$action    = $this->getAction();
		if($action == "send") {
			$this->createAlliance();
		} else {
			$this->display('page.alliance.create.tpl');
		}
	}
		else
		{
			$diff_points = $min_points - $user_points;
			$this->printMessage('<span class="rouge">'.sprintf($GLOBALS['LNG']['al_make_ally_insufficient_points'], pretty_number($min_points), pretty_number($diff_points)).'</span>');
		}
	}
	
	private function createAlliance()
	{
		$action	= $this->getAction();
		if($action == "send") {
			$this->createAllianceProcessor();
		} else {
			$this->display('page.alliance.create.tpl');
		}
	}
		
	private function createAllianceProcessor() 
	{
		global $USER, $UNI, $LNG;
		$atag	= HTTP::_GP('atag' , '', UTF8_SUPPORT);
		$aname	= HTTP::_GP('aname', '', UTF8_SUPPORT);
		
		if (empty($atag)) {
			$this->printMessage('<span class="rouge">'.$LNG['al_tag_required'].'</span>', true, array("?page=alliance&mode=create", 3));
		}
		
		if (empty($aname)) {
			$this->printMessage('<span class="rouge">'.$LNG['al_name_required'].'</span>', true, array("?page=alliance&mode=create", 3));
		}
		
		if (!CheckName($aname) || !CheckName($atag)) {
			$this->printMessage('<span class="rouge">'.$LNG['al_newname_specialchar'].'</span>', true, array("?page=alliance&mode=create", 3));
		}
		
		$allianceCount = $GLOBALS['DATABASE']->getFirstCell("SELECT COUNT(*) FROM ".ALLIANCE." WHERE ally_universe = ".$UNI." AND (ally_tag = '".$GLOBALS['DATABASE']->sql_escape($atag)."' OR ally_name = '".$GLOBALS['DATABASE']->sql_escape($aname)."');");

		if ($allianceCount != 0) {
			$this->printMessage('<span class="rouge">'.sprintf($LNG['al_already_exists'], $aname).'</span>', true, array("?page=alliance&mode=create", 3));
		}
		
		$GLOBALS['DATABASE']->multi_query("INSERT INTO ".ALLIANCE." SET
						ally_name				= '".$GLOBALS['DATABASE']->sql_escape($aname)."',
						ally_tag				= '".$GLOBALS['DATABASE']->sql_escape($atag)."' ,
						ally_owner				= ".$USER['id'].",
						ally_owner_range		= '".$LNG['al_default_leader_name']."',
						ally_members			= 1,
						ally_register_time		= ".TIMESTAMP.",
						ally_universe 			= ".$UNI.";
						SET @allianceID = LAST_INSERT_ID();
						UPDATE ".USERS." SET
						ally_id					= @allianceID,
						ally_rank_id			= 0,
						ally_register_time 		= ".TIMESTAMP."
						WHERE id = ".$USER['id'].";
						UPDATE ".STATPOINTS." SET
						id_ally 				= @allianceID
						WHERE id_owner = ".$USER['id'].";");
						
		$this->printMessage('<span class="vert">'.sprintf($LNG['al_created'], $aname.' ['.$atag.']').'</span>', true, array('?page=alliance', 3));

	}
	
	private function getDiplomatic()
	{
		$Return	= array();
		$Diplos	= $GLOBALS['DATABASE']->query("SELECT d.level, d.accept, d.accept_text, d.id, a.id as ally_id, a.ally_name, a.ally_tag, d.owner_1, d.owner_2 FROM ".DIPLO." as d INNER JOIN ".ALLIANCE." as a ON IF(".$this->allianceData['id']." = d.owner_1, a.id = d.owner_2, a.id = d.owner_1) WHERE ".$this->allianceData['id']." = d.owner_1 OR ".$this->allianceData['id']." = d.owner_2");
		while($CurDiplo = $GLOBALS['DATABASE']->fetch_array($Diplos))
		{
			if($CurDiplo['accept'] == 0 && $CurDiplo['owner_2'] == $this->allianceData['id'])
				$Return[5][$CurDiplo['id']] = array($CurDiplo['ally_name'], $CurDiplo['ally_id'], $CurDiplo['level'], $CurDiplo['accept_text'], $CurDiplo['ally_tag']);
			elseif($CurDiplo['accept'] == 0 && $CurDiplo['owner_1'] == $this->allianceData['id'])
				$Return[6][$CurDiplo['id']] = array($CurDiplo['ally_name'], $CurDiplo['ally_id'], $CurDiplo['level'], $CurDiplo['accept_text'], $CurDiplo['ally_tag']);
			else
				$Return[$CurDiplo['level']][$CurDiplo['id']] = array($CurDiplo['ally_name'], $CurDiplo['ally_id'], $CurDiplo['owner_1'], $CurDiplo['ally_tag']);				
		}
		return $Return;
	}

	private function homeAlliance()
	{
		global $USER, $UNI, $LNG;
		require_once('includes/functions/BBCode.php');
		
		if ($this->allianceData['ally_owner'] == $USER['id']) {
			$rankName	= ($this->allianceData['ally_owner_range'] != '') ? $this->allianceData['ally_owner_range'] : $LNG['al_founder_rank_text'];
		} elseif ($USER['ally_rank_id'] != 0) {
			$rankName	= $GLOBALS['DATABASE']->getFirstCell("SELECT rankName FROM ".ALLIANCE_RANK." WHERE rankID = ".$USER['ally_rank_id'].";");	
		}
		
		if (empty($rankName)) {
			$rankName	= $LNG['al_new_member_rank_text'];
		}
		
		$StatsData 					= $GLOBALS['DATABASE']->getFirstRow("SELECT SUM(wons) as wons, SUM(loos) as loos, SUM(draws) as draws, 
														SUM(kbmetal) as kbmetal, SUM(kbcrystal) as kbcrystal, 
														SUM(lostunits) as lostunits, SUM(desunits) as desunits 
														FROM ".USERS." WHERE ally_id = ".$this->allianceData['id'].";");
														
		$StatsDataBis 					= $GLOBALS['DATABASE']->getFirstRow("SELECT total_rank, total_points FROM uni1_statpoints WHERE id_owner = ".$this->allianceData['id']." AND stat_type = '2';");	

		$allyCount 					= $GLOBALS['DATABASE']->getFirstCell("SELECT COUNT(*) FROM uni1_alliance WHERE id > '0';");	
														
		$ApplyCount					= $GLOBALS['DATABASE']->getFirstCell("SELECT COUNT(*) FROM ".ALLIANCE_REQUEST." WHERE allianceID = ".$this->allianceData['id'].";");
		
		
		
		$ally_events = array();
		
		if(!empty($this->allianceData['ally_events']))
		{
			$sql = "
			SELECT
				`id`,
				`username`
			FROM
				`". USERS ."`
			WHERE
				`ally_id` = ". $this->allianceData['id'] .";";
			
			$result = $GLOBALS['DATABASE']->query($sql);

			require_once('includes/classes/class.FlyingFleetsTable.php');
			$FlyingFleetsTable = new FlyingFleetsTable;
			
			$this->tplObj->loadscript('overview.js');
			
			while($row = $result->fetch_assoc())
			{
				$FlyingFleetsTable->setUser($row['id']);
				$FlyingFleetsTable->setMissions($this->allianceData['ally_events']);
				$ally_events[$row['username']] = $FlyingFleetsTable->renderTable();
			}
			
			$ally_events = array_filter($ally_events);
		}
		
		$defcontext = '';
		if($this->allianceData['defcon'] == 5){
		$defcontext = 'Normal preparation in peacetime';
		}elseif($this->allianceData['defcon'] == 4){
		$defcontext = 'Normal preparation, but increased and enhanced information security measures'; //vert
		}elseif($this->allianceData['defcon'] == 3){
		$defcontext = 'Increased preparation of forces beyond the normal preparation'; //jaune
		}elseif($this->allianceData['defcon'] == 2){
		$defcontext = 'Further increase in the preparation of forces, but less than the maximum preparation'; //oramnge
		}elseif($this->allianceData['defcon'] == 1){
		$defcontext = 'State of War: Maximum forces Preparation'; //rouge
		}
		$this->tplObj->assign_vars(array(
			'DiploInfo'					=> $this->getDiplomatic(),
			'ally_web'					=> $this->allianceData['ally_web'],
			'ally_tag'	 				=> $this->allianceData['ally_tag'],
			'ally_members'	 			=> $this->allianceData['ally_members'],
			'defcon'	 			=> $this->allianceData['defcon'],
			'ally_max_members'	 		=> $this->allianceData['ally_members'],
			'ally_name'					=> $this->allianceData['ally_name'],
			'ally_image'				=> $this->allianceData['ally_image'],
			'ally_description'			=> bbcode($this->allianceData['ally_description']),
			'ally_text' 				=> bbcode($this->allianceData['ally_text']),
			'rankName'					=> $rankName,
			'defcontext'					=> $defcontext,
			'requests'					=> sprintf($LNG['al_new_requests'], $ApplyCount),
			'applyCount'				=> $ApplyCount,
			'allyCount'				=> $allyCount,
			'total_rank'				=> $StatsDataBis['total_rank'],
			'total_points'				=> pretty_number($StatsDataBis['total_points']),
			'total_points_average'				=> pretty_number(round($StatsDataBis['total_points'] / $this->allianceData['ally_members'])),
			'totalfight'				=> $StatsData['wons'] + $StatsData['loos'] + $StatsData['draws'],
			'fightwon'					=> $StatsData['wons'],
			'fightlose'					=> $StatsData['loos'],
			'fightdraw'					=> $StatsData['draws'],
			'unitsshot'					=> pretty_number($StatsData['desunits']),
			'unitslose'					=> pretty_number($StatsData['lostunits']),
			'dermetal'					=> pretty_number($StatsData['kbmetal']),
			'dercrystal'				=> pretty_number($StatsData['kbcrystal']),
			'isOwner'					=> $this->allianceData['ally_owner'] == $USER['id'],
			'ally_owner'					=> $this->getUsername($this->allianceData['ally_owner']),
			'ally_owner2'					=> $this->allianceData['ally_owner'],
			'ally_events'				=> $ally_events,
			'recruit_on'				=> (($this->allianceData['ally_request_notallow'] == 1) ? '<span class="rouge">No</span>' :'<span class="vert">Yes</span>' ),
			'ally_register_time'				=> str_replace(' ', '&nbsp;', _date($LNG['php_tdformat'], $this->allianceData['ally_register_time']), $USER['timezone'])
		));
		
		$this->display('page.alliance.home.tpl');
	}
	
	function memberList()
	{
		global $USER, $LNG, $CONF;
		if (!$this->rights['MEMBERLIST']) {
			$this->redirectToHome();
		}
		
		$rankResult	= $GLOBALS['DATABASE']->query("SELECT rankID, rankName FROM ".ALLIANCE_RANK." WHERE allianceID = ".$this->allianceData['id'].";");
		$rankList	= array();
		
		while($rankRow = $GLOBALS['DATABASE']->fetch_array($rankResult))
			$rankList[$rankRow['rankID']]	= $rankRow['rankName'];
		
		$GLOBALS['DATABASE']->free_result($rankResult);
		
		$memberListResult = $GLOBALS['DATABASE']->query("SELECT DISTINCT u.id, u.avatar, u.username,u.galaxy, u.system, u.planet, u.ally_register_time, u.onlinetime, u.ally_rank_id, s.total_points, s.total_rank 
										FROM ".USERS." u
										LEFT JOIN ".STATPOINTS." as s ON s.stat_type = '1' AND s.id_owner = u.id 
										WHERE ally_id = ".$this->allianceData['id'].";");

		$memberList	= array();
							 			
		while ($memberListRow = $GLOBALS['DATABASE']->fetch_array($memberListResult))
		{
			if ($this->allianceData['ally_owner'] == $memberListRow['id'])
				$memberListRow['ally_rankName'] = empty($this->allianceData['ally_owner_range']) ? $LNG['al_founder_rank_text'] : $this->allianceData['ally_owner_range'];
			elseif ($memberListRow['ally_rank_id'] != 0 && isset($rankList[$memberListRow['ally_rank_id']]))
				$memberListRow['ally_rankName'] = $rankList[$memberListRow['ally_rank_id']];
			else
				$memberListRow['ally_rankName'] = $LNG['al_new_member_rank_text'];
			
			$memberList[$memberListRow['id']]	= array(
				'username'		=> $memberListRow['username'],
				'avatar'		=> $memberListRow['avatar'],
				'galaxy'		=> $memberListRow['galaxy'],
				'system'		=> $memberListRow['system'],
				'planet'		=> $memberListRow['planet'],
				'register_time'	=> _date($LNG['php_tdformat'], $memberListRow['ally_register_time'], $USER['timezone']),
				'points'		=> pretty_number($memberListRow['total_points']),
				'total_rank'		=> pretty_number($memberListRow['total_rank']),
				'rankName'		=> $memberListRow['ally_rankName'],
				'onlinetime'	=> floor((TIMESTAMP - $memberListRow['onlinetime']) / 60),
				'onlinetimebis'	=> str_replace(' ', '&nbsp;', _date($LNG['php_tdformat'], $memberListRow['onlinetime']), $USER['timezone']),
			);
		}		
		
		$GLOBALS['DATABASE']->free_result($memberListResult);
		
		$this->tplObj->assign_vars(array(
			'memberList'		=> $memberList,
			'al_users_list'		=> sprintf($LNG['al_users_list'], count($memberList)),
			'ally_tag'		=> $this->allianceData['ally_tag'],
			'total_usr'		=> $CONF['users_amount'],
			'canKick'		=> $this->rights['ADMIN'],
		));
		
		$this->display('page.alliance.memberList.tpl');
	}
	
	function wars()
	{
	global $USER, $LNG;

	$this->tplObj->assign_vars(array(
	));
	$this->display('page.alliance.war.tpl');
	
	}
	
	function ranksissue()
	{
	global $USER, $LNG;

	$rankResult	= $GLOBALS['DATABASE']->query("SELECT * FROM ".ALLIANCE_RANK." WHERE allianceID = ".$this->allianceData['id'].";");
		$rankList	= array();
		
		while($rankRow = $GLOBALS['DATABASE']->fetch_array($rankResult))
			$rankList[$rankRow['rankID']]	= $rankRow;
		
		$GLOBALS['DATABASE']->free_result($rankResult);
		$CountHowMuch = $GLOBALS['DATABASE']->getFirstCell("SELECT COUNT(*) FROM ".ALLIANCE_RANK." WHERE allianceID = ".$this->allianceData['id'].";");
		$this->tplObj->assign_vars(array(
			'CountHowMuch'		=> $CountHowMuch,
			'rankList'		=> $rankList,
			'ownRights'		=> $this->rights,
			'avalibleRanks'	=> $this->avalibleRanks,
		));	
		
	$this->display('page.alliance.ranks.tpl');
	
	}
	
	
	function close()
	{
		global $USER, $LNG;
		
		if (!empty($_POST))
	{
		$GLOBALS['DATABASE']->multi_query("
		UPDATE ".USERS." SET ally_id = 0, ally_register_time = 0, next_ally_register = '".(TIMESTAMP + 24 * 60 * 60)."' WHERE id = ".$USER['id'].";
		UPDATE ".STATPOINTS." SET id_ally = 0 WHERE id_owner = ".$USER['id']." AND stat_type = 1;
		UPDATE ".ALLIANCE." SET ally_members = (SELECT COUNT(*) FROM ".USERS." WHERE ally_id = ".$this->allianceData['id'].") WHERE id = ".$this->allianceData['id'].";");
		
		$this->redirectTo('game.php?page=alliance');
		
	}

	$this->tplObj->assign_vars(array(
	));
	$this->display('page.alliance.close.tpl');
	
	}
	
	function circular() 
	{
		global $LNG, $USER;

		if (!$this->rights['ROUNDMAIL'])
			$this->redirectToHome();
		
		$action	= HTTP::_GP('action', '');

		if ($action == "send")
		{
			$rankID		= HTTP::_GP('rankID', 0);
			$subject 	= HTTP::_GP('subject', '', true);
			$text 		= HTTP::_GP('text', $LNG['mg_no_subject'], true);
			
			if(empty($text)) {
				$this->sendJSON(array('message' => $LNG['mg_empty_text'], 'error' => true));
			}
			
			if($rankID == 0) {
				$sendUsersResult	= $GLOBALS['DATABASE']->query("SELECT id, username FROM ".USERS." WHERE ally_id = ".$this->allianceData['id'].";");
			} else {
				$sendUsersResult	= $GLOBALS['DATABASE']->query("SELECT id, username FROM ".USERS." WHERE ally_id = ".$this->allianceData['id']." AND ally_rank_id = ".$rankID.";");
			}
			
			$sendList 	= $LNG['al_circular_sended'];
			$title		= $LNG['al_circular_alliance'].$this->allianceData['ally_tag'];
			$text		= sprintf($LNG['al_circular_front_text'], $USER['username'])."\r\n".$text;
			
			while ($sendUsersRow = $GLOBALS['DATABASE']->fetch_array($sendUsersResult))
			{
				SendSimpleMessage($sendUsersRow['id'], $USER['id'], TIMESTAMP, 2, $title, $subject, makebr($text));
				$sendList	.= "\n".$sendUsersRow['username'];
			}
				
			$this->sendJSON(array('message' => $sendList, 'error' => false));
		}

		
		$RangeList[]	= $LNG['al_all_players'];

		if (is_array($this->ranks))
		{
			foreach($this->ranks as $id => $array)
			{
				$RangeList[$id + 1]	= $array['name'];
			}
		}
		
		$this->tplObj->assign_vars(array(
			'RangeList'						=> $RangeList,
			'ally_name'						=> $this->allianceData['ally_name'],
			'ally_tag'						=> $this->allianceData['ally_tag'],
		));
		
		$this->display('page.alliance.circular.tpl');
	}
	
	function admin() 
	{
		global $LNG;
		
		$action		= HTTP::_GP('action', 'overview');
		$methodName	= 'admin'.ucwords($action);
		
		if(!is_callable(array($this, $methodName))) {
			ShowErrorPage::printError($LNG['page_doesnt_exist']);
		}

		$this->{$methodName}();
	}
	
	private function adminOverview() 
	{
		global $LNG, $UNI;
		$send 		= HTTP::_GP('send', 0);
		$textMode  	= HTTP::_GP('textMode', 'external');
		
		if ($send == 1)
		{
			$this->allianceData['ally_web'] 				= filter_var(HTTP::_GP('web', ''), FILTER_VALIDATE_URL);
			$this->allianceData['ally_image'] 				= filter_var(HTTP::_GP('image', ''), FILTER_VALIDATE_URL);
			$new_ally_tag 	= HTTP::_GP('ally_tag', '', UTF8_SUPPORT);
			$new_ally_name	= HTTP::_GP('ally_name', '', UTF8_SUPPORT);
			$this->allianceData['defcon']	= HTTP::_GP('defcon', 5);
		
			if(!empty($new_ally_tag) && $this->allianceData['ally_tag'] != $new_ally_tag)
			{
				$allianceCount = $GLOBALS['DATABASE']->getFirstCell("SELECT COUNT(*) FROM ".ALLIANCE." WHERE ally_universe = ".$UNI." AND ally_tag = '".$GLOBALS['DATABASE']->sql_escape($new_ally_tag)."';");

				if($allianceCount != 0) 
				{
					$this->printMessage('<span class="rouge">'.sprintf($LNG['al_already_exists'], $new_ally_tag).'</span>');
				}
				else
				{
					$this->allianceData['ally_tag'] = $new_ally_tag;
				}
			}
			
			if(!empty($new_ally_name) && $this->allianceData['ally_name'] != $new_ally_name)
			{
				$allianceCount = $GLOBALS['DATABASE']->getFirstCell("SELECT COUNT(*) FROM ".ALLIANCE." WHERE ally_universe = ".$UNI." AND ally_tag = '".$GLOBALS['DATABASE']->sql_escape($new_ally_name)."';");

				if($allianceCount != 0)
				{
					$this->printMessage('<span class="rouge">'.sprintf($LNG['al_already_exists'], $new_ally_name).'</span>');
				}
				else
				{
					$this->allianceData['ally_name'] = $new_ally_name;
				}
			}
			
			$GLOBALS['DATABASE']->query("UPDATE ".ALLIANCE." SET
			ally_tag = '".$GLOBALS['DATABASE']->sql_escape($this->allianceData['ally_tag'])."',
			ally_name = '".$GLOBALS['DATABASE']->sql_escape($this->allianceData['ally_name'])."',
			ally_image = '".$GLOBALS['DATABASE']->sql_escape($this->allianceData['ally_image'])."',
			ally_web = '".$GLOBALS['DATABASE']->sql_escape($this->allianceData['ally_web'])."',
			defcon = '".$GLOBALS['DATABASE']->sql_escape($this->allianceData['defcon'])."'
			WHERE id = ".$this->allianceData['id'].";");
			
			$this->printMessage("<span class='vert'>Alliance settings saved!</span>", true, array('game.php?page=alliance&mode=admin', 2));
		}elseif ($send == 2)
		{

			$text 		= HTTP::_GP('text', '', true);
			$textMode  	= HTTP::_GP('textMode', 'external');
			
			switch($textMode)
			{
				case 'external':
					$textSQL	= "ally_description = '".$GLOBALS['DATABASE']->sql_escape($text)."' ";
				break;
				case 'internal':
					$textSQL	= "ally_text = '".$GLOBALS['DATABASE']->sql_escape($text)."' ";
				break;
				case 'apply':
					$textSQL	= "ally_request = '".$GLOBALS['DATABASE']->sql_escape($text)."' ";
				break;
			}
			
			
			$GLOBALS['DATABASE']->query("UPDATE ".ALLIANCE." SET
			".$textSQL."
			WHERE id = ".$this->allianceData['id'].";");
			
			$this->printMessage("<span class='vert'>Alliance settings saved!</span>", true, array('game.php?page=alliance&mode=admin', 2));
		}elseif ($send == 3)
		{

			$text 		= HTTP::_GP('text', '', true);
			$textMode  	= HTTP::_GP('textMode', 'external');
			
			switch($textMode)
			{
				case 'external':
					$textSQL	= "ally_description = '".$GLOBALS['DATABASE']->sql_escape($text)."' ";
				break;
				case 'internal':
					$textSQL	= "ally_text = '".$GLOBALS['DATABASE']->sql_escape($text)."' ";
				break;
				case 'apply':
					$textSQL	= "ally_request = '".$GLOBALS['DATABASE']->sql_escape($text)."' ";
				break;
			}
			
			
			$GLOBALS['DATABASE']->query("UPDATE ".ALLIANCE." SET
			".$textSQL."
			WHERE id = ".$this->allianceData['id'].";");
			
			$this->printMessage("<span class='vert'>Alliance settings saved!</span>", true, array('game.php?page=alliance&mode=admin', 2));
		} else {
			switch($textMode)
			{
				case 'internal':
					$text	= $this->allianceData['ally_text'];
				break;
				case 'apply':
					$text	= $this->allianceData['ally_request'];
				break;
				default:
					$text	= $this->allianceData['ally_description'];
				break;
			}
		}
		
		$this->tplObj->assign_vars(array(
			'RequestSelector'			=> array(0 => $LNG['al_requests_allowed'], 1 => $LNG['al_requests_not_allowed']),
			'YesNoSelector'				=> array(1 => $LNG['al_go_out_yes'], 0 => $LNG['al_go_out_no']),
			'textMode' 					=> $textMode,
			'ally_text' 						=> $this->allianceData['ally_text'],
			'text' 						=> $this->allianceData['ally_request'],
			'ally_description' 						=> $this->allianceData['ally_description'],
			'ally_tag' 					=> $this->allianceData['ally_tag'],
			'ally_name'					=> $this->allianceData['ally_name'],
			'ally_web' 					=> $this->allianceData['ally_web'],
			'ally_image'				=> $this->allianceData['ally_image'],
			'ally_request_notallow' 	=> $this->allianceData['ally_request_notallow'],
			'ally_members' 				=> $this->allianceData['ally_members'],
			'ally_max_members' 			=> $this->allianceData['ally_max_members'],
			'ally_request_min_points'   => $this->allianceData['ally_request_min_points'],
			'ally_owner_range'			=> $this->allianceData['ally_owner_range'],
			'ally_stats_data'			=> $this->allianceData['ally_stats'],
			'ally_diplo_data'			=> $this->allianceData['ally_diplo'],
			'ally_events'				=> explode(',', $this->allianceData['ally_events']),
			'aviable_events'			=> $LNG['type_mission']
		));
		
		$this->display('page.alliance.admin.overview.tpl');
	}
	
	private function adminClose() {
		global $USER;
		if ($this->allianceData['ally_owner'] == $USER['id']) {
			$GLOBALS['DATABASE']->multi_query("UPDATE ".USERS." SET ally_id = '0' WHERE ally_id = ".$this->allianceData['id'].";
			UPDATE ".STATPOINTS." SET id_ally = '0' WHERE id_ally = ".$this->allianceData['id'].";
			DELETE FROM ".STATPOINTS." WHERE id_owner = ".$this->allianceData['id']." AND stat_type = 2;
			DELETE FROM ".ALLIANCE." WHERE id = ".$this->allianceData['id'].";
			DELETE FROM ".ALLIANCE_REQUEST." WHERE allianceID = ".$this->allianceData['id'].";
			DELETE FROM ".DIPLO." WHERE owner_1 = ".$this->allianceData['id']." OR owner_2 = ".$this->allianceData['id'].";");
		}
		
		$this->redirectToHome();
	}
	
	private function adminTransfer()
	{
		global $LNG, $USER;

		if($this->allianceData['ally_owner'] != $USER['id'])
			$this->redirectToHome();
			
		$postleader = HTTP::_GP('newleader', 0);
		if (!empty($postleader))
		{
			$Rank = $GLOBALS['DATABASE']->getFirstRow("SELECT ally_rank_id FROM ".USERS." WHERE id = ".$postleader.";");
			$GLOBALS['DATABASE']->multi_query("UPDATE ".USERS." SET ally_rank_id = '".$Rank['ally_rank_id']."' WHERE id = '".$USER['id']."';
			UPDATE ".USERS." SET ally_rank_id = 0 WHERE id = ".$postleader.";UPDATE ".ALLIANCE." SET ally_owner = ".$postleader." WHERE id = ".$this->allianceData['id'].";");
			$this->redirectToHome();
		}
		else
		{
			$transferUserResult	= $GLOBALS['DATABASE']->query("SELECT u.id, r.rankName, u.username 
											  FROM ".USERS." u 
											  INNER JOIN ".ALLIANCE_RANK." r ON r.rankID = u.ally_rank_id AND r.TRANSFER = 1
											  WHERE u.ally_id = ".$this->allianceData['id']."
											  AND id != ".$this->allianceData['ally_owner'].";");
			$transferUserList	= array();

			while ($trasferUserRow = $GLOBALS['DATABASE']->fetch_array($transferUserResult))
			{
				$transferUserList[$trasferUserRow['id']]	= $trasferUserRow['username']." [".$trasferUserRow['rankName']."]";
			}
			
			$GLOBALS['DATABASE']->free_result($transferUserResult);

			$this->tplObj->assign_vars(array(
				'transferUserList'	=> $transferUserList,
			));	
			
			$this->display('page.alliance.leave.tpl');
		}
	}
	
	private function adminMangeApply()
	{
		global $LNG, $USER;
		if(!$this->rights['MANAGEAPPLY']) {
			$this->redirectToHome();
		}

		$applyResult	= $GLOBALS['DATABASE']->query("SELECT applyID, u.username, r.time FROM ".ALLIANCE_REQUEST." r INNER JOIN ".USERS." u ON r.userID = u.id WHERE r.allianceID = ".$this->allianceData['id'].";");
		$applyList		= array();
		
		while ($applyRow = $GLOBALS['DATABASE']->fetch_array($applyResult))
		{
			$applyList[]	= array(
				'username'	=> $applyRow['username'],
				'id'		=> $applyRow['applyID'],
				'time' 		=> _date($LNG['php_tdformat'], $applyRow['time'], $USER['timezone']),
			);
		}
		
		$GLOBALS['DATABASE']->free_result($applyResult);
		
		$this->tplObj->assign_vars(array(
			'applyList'		=> $applyList,
		));
		
		$this->display('page.alliance.admin.mangeApply.tpl');
	}
	
	private function adminDetailApply()
	{
		global $LNG, $USER;
		if(!$this->rights['MANAGEAPPLY']) {
			$this->redirectToHome();
		}

		$id    = HTTP::_GP('id', 0);

		$sql = "
		SELECT
			r.`applyID`, 
			r.`time`, 
			r.`text`, 
			u.`username`, 
			u.`register_time`, 
			u.`onlinetime`,
			u.`galaxy`,
			u.`system`,
			u.`planet`,
			CONCAT_WS(':', u.`galaxy`, u.`system`, u.`planet`) AS `coordinates`,
			@total_fights := u.`wons` + u.`loos` + u.`draws`,
			@total_fights_percentage := @total_fights / 100,
			@total_fights AS `total_fights`,
			u.`wons`,
			ROUND(u.`wons` / @total_fights_percentage, 2) AS `wons_percentage`,
			u.`loos`,
			ROUND(u.`loos` / @total_fights_percentage, 2) AS `loos_percentage`,
			u.`draws`,
			ROUND(u.`draws` / @total_fights_percentage, 2) AS `draws_percentage`,
			u.`kbmetal`,
			u.`kbcrystal`,
			u.`lostunits`,
			u.`desunits`,
			stat.`tech_rank`, 
			stat.`tech_points`,
			stat.`build_rank`, 
			stat.`build_points`, 
			stat.`defs_rank`, 
			stat.`defs_points`, 
			stat.`fleet_rank`, 
			stat.`fleet_points`,
			stat.`popu_rank`, 
			stat.`popu_points`,
			stat.`total_rank`,
			stat.`total_points`,
			p.`name`
		FROM 
			". ALLIANCE_REQUEST ." AS r 
		LEFT JOIN 
			". USERS ." AS u ON r.userID = u.id 
		INNER JOIN 
			". STATPOINTS ." AS stat 
		LEFT JOIN 
			". PLANETS ." AS p ON p.id = u.id_planet
		WHERE 
			applyID = ". $id .";";

		$applyDetail = $GLOBALS['DATABASE']->uniquequery($sql);

		if(empty($applyDetail)) {
			$this->printMessage('<span class="vert">'.$LNG['al_apply_not_exists'].'</span>');
		}
		
		require_once('includes/functions/BBCode.php');
		$applyDetail['text']    	= bbcode($applyDetail['text']);
		$applyDetail['kbmetal']    	= pretty_number($applyDetail['kbmetal']);
		$applyDetail['kbcrystal']   = pretty_number($applyDetail['kbcrystal']);
		$applyDetail['lostunits']   = pretty_number($applyDetail['lostunits']);
		$applyDetail['desunits']    = pretty_number($applyDetail['desunits']);
		
		$this->tplObj->assign_vars(array(
			'applyDetail'	=> $applyDetail,
			'apply_time'    => _date($LNG['php_tdformat'], $applyDetail['time'], $USER['timezone']),
			'register_time' => _date($LNG['php_tdformat'], $applyDetail['register_time'], $USER['timezone']),
			'onlinetime'    => _date($LNG['php_tdformat'], $applyDetail['onlinetime'], $USER['timezone']),
		));
		
		$this->display('page.alliance.admin.detailApply.tpl');
	}
	
	private function adminSendAnswerToApply()
	{
		global $LNG, $USER;
		if(!$this->rights['MANAGEAPPLY']) {
			$this->redirectToHome();
		}

		$text  		= makebr(HTTP::_GP('text', '', true));
		$answer		= HTTP::_GP('answer', '');
		
		$applyID	= HTTP::_GP('id', 0);
		$userID 	= $GLOBALS['DATABASE']->getFirstCell("SELECT id FROM ".ALLIANCE_REQUEST." LEFT JOIN ".USERS." ON userID = id WHERE applyID = ".$applyID.";");

		if ($answer == 'yes')
		{
			$GLOBALS['DATABASE']->multi_query("
				DELETE FROM ".ALLIANCE_REQUEST." WHERE applyID = ".$applyID.";
				UPDATE ".USERS." SET ally_id = ".$this->allianceData['id'].", ally_register_time = ".TIMESTAMP.", ally_rank_id = 0 WHERE id = ".$userID.";
				UPDATE ".STATPOINTS." SET id_ally = ".$this->allianceData['id']." WHERE id_owner = ".$userID." AND stat_type = 1;
				UPDATE ".ALLIANCE." SET ally_members = (SELECT COUNT(*) FROM ".USERS." WHERE ally_id = ".$this->allianceData['id'].") WHERE id = ".$this->allianceData['id'].";");

			$Message = 'Hello,<br><br>
Your recruitment demand to integrate the alliance <span class="orange">['.$this->allianceData['ally_tag'].']</span> was accepted.<br>
Welcome to "'.$this->allianceData['ally_name'].'" with the TAG: <span class="orange">['.$this->allianceData['ally_tag'].']</span>.<br><br>
Best Regards';
			
			SendSimpleMessage($userID, $USER['id'], TIMESTAMP, 2, $this->allianceData['ally_tag'], $LNG['al_you_was_acceted'] . $this->allianceData['ally_name'], $Message);
		}
		elseif($answer == 'no')
		{
			
			$Message = 'Hello,<br><br>
Your recruitment demand to integrate the alliance <span class="orange">['.$this->allianceData['ally_tag'].']</span> was denied.<br>
You can now apply again in another alliance.<br><br>
Best Regards';
			
			$GLOBALS['DATABASE']->query("DELETE FROM ".ALLIANCE_REQUEST." WHERE applyID = ".$applyID.";");
			SendSimpleMessage($userID, $USER['id'], TIMESTAMP, 2, $this->allianceData['ally_tag'], $LNG['al_you_was_declined'] . $this->allianceData['ally_name'], $Message);

		}

		$this->redirectTo('game.php?page=alliance&mode=recruitAlly');
	}
	
	private function adminPermissions()
	{	
		if(!$this->rights['RANKS']) {
			$this->redirectToHome();
		}
		
		$rankResult	= $GLOBALS['DATABASE']->query("SELECT * FROM ".ALLIANCE_RANK." WHERE allianceID = ".$this->allianceData['id'].";");
		$rankList	= array();
		
		while($rankRow = $GLOBALS['DATABASE']->fetch_array($rankResult))
			$rankList[$rankRow['rankID']]	= $rankRow;
		
		$GLOBALS['DATABASE']->free_result($rankResult);

		$this->tplObj->assign_vars(array(
			'rankList'		=> $rankList,
			'ownRights'		=> $this->rights,
			'avalibleRanks'	=> $this->avalibleRanks,
		));	

		$this->display('page.alliance.admin.permissions.tpl');
	}
	
	private function adminPermissionsSend()
	{	
		if(!$this->rights['RANKS']) {
			$this->redirectToHome();
		}
		
		$newrank	= HTTP::_GP('newrank', array(), true);
		$delete		= HTTP::_GP('deleteRank', 0);
		$rankData	= HTTP::_GP('rank', array());
		
		if(!empty($newrank['rankName'])) 
		{
			$validationID	= $GLOBALS['DATABASE']->GetInsertID();
			$sql = "INSERT INTO `".ALLIANCE_RANK."` (
`rankID` ,`rankName` ,`allianceID` ,`MEMBERLIST` ,`MANAGEAPPLY` ,`ROUNDMAIL` ,`ADMIN` ,`DIPLOMATIC` ,`RANKS` , `MANAGEUSERS`)VALUES (".$validationID.", '".$newrank['rankName']."', '".$this->allianceData['id']."', '0', '0', '0', '0', '0', '0', '0');";
			$GLOBALS['DATABASE']->query($sql);
		} else {
			if(!empty($delete)) 
			{
				$GLOBALS['DATABASE']->query("DELETE FROM ".ALLIANCE_RANK." WHERE rankID = ".$delete." AND allianceID = ".$this->allianceData['id'].";");
				$GLOBALS['DATABASE']->query("UPDATE ".USERS." SET ally_rank_id = 0 WHERE ally_rank_id = ".$delete." AND ally_id = ".$this->allianceData['id'].";");
			}
			else
			{
				$Query = '';
				foreach ($rankData as $k => $rankRow)
				{
					$SQL	= array();
					foreach($this->avalibleRanks as $rankName) 
					{
						if(!$this->rights[$rankName])
							continue;
						
						$SQL[]	= $rankName." = ".(isset($rankRow[$rankName]) ? 1 : 0);
					}
					$SQL[]	= "rankName = '".$GLOBALS['DATABASE']->sql_escape($rankRow['name'])."'";
					$Query .= "UPDATE ".ALLIANCE_RANK." SET ".implode(", ", $SQL)." WHERE rankID = ".((int) $GLOBALS['DATABASE']->sql_escape($k))." AND allianceID = ".$this->allianceData['id'].";";
				}
				$GLOBALS['DATABASE']->multi_query($Query);
			}
		}
		
		$this->redirectTo('game.php?page=alliance&mode=ranksissue');
	}
	
	private function adminMembers()
	{
		global $USER, $LNG;
		if (!$this->rights['MANAGEUSERS']) {
			$this->redirectToHome();
		}
		
		$rankResult		= $GLOBALS['DATABASE']->query("SELECT rankID, rankName FROM ".ALLIANCE_RANK." WHERE allianceID = ".$this->allianceData['id'].";");
		$rankList		= array();
		$rankList[0]	= $LNG['al_new_member_rank_text'];
		
		while($rankRow = $GLOBALS['DATABASE']->fetch_array($rankResult))
			$rankList[$rankRow['rankID']]	= $rankRow['rankName'];
		
		$GLOBALS['DATABASE']->free_result($rankResult);
		
		$memberListResult = $GLOBALS['DATABASE']->query("SELECT DISTINCT u.id, u.username,u.galaxy, u.system, u.planet, u.ally_register_time, u.onlinetime, u.ally_rank_id, s.total_points 
										FROM ".USERS." u
										LEFT JOIN ".STATPOINTS." as s ON s.stat_type = '1' AND s.id_owner = u.id 
										WHERE ally_id = ".$this->allianceData['id'].";");

		$memberList	= array();
										
		while ($memberListRow = $GLOBALS['DATABASE']->fetch_array($memberListResult))
		{
			if ($this->allianceData['ally_owner'] == $memberListRow['id'])
				$memberListRow['ally_rank_id'] = -1;
			elseif ($memberListRow['ally_rank_id'] != 0)
				$memberListRow['ally_rank_id'] = $memberListRow['ally_rank_id'];
			else
				$memberListRow['ally_rank_id'] = 0;
			
			$memberList[$memberListRow['id']]	= array(
				'username'		=> $memberListRow['username'],
				'galaxy'		=> $memberListRow['galaxy'],
				'system'		=> $memberListRow['system'],
				'planet'		=> $memberListRow['planet'],
				'register_time'	=> _date($LNG['php_tdformat'], $memberListRow['ally_register_time'], $USER['timezone']),
				'points'		=> $memberListRow['total_points'],
				'rankID'		=> $memberListRow['ally_rank_id'],
				'onlinetime'	=> floor((TIMESTAMP - $memberListRow['onlinetime']) / 60),
				'kickQuestion'	=> sprintf($LNG['al_kick_player'], $memberListRow['username'])
			);
		}
		
		$GLOBALS['DATABASE']->free_result($memberListResult);
			
		$this->tplObj->assign_vars(array(
			'memberList'	=> $memberList,
			'rankList'		=> $rankList,
			'founder'		=> empty($this->allianceData['ally_owner_range']) ? $LNG['al_founder_rank_text'] : $this->allianceData['ally_owner_range'],
			'al_users_list'	=> sprintf($LNG['al_users_list'], count($memberList)),
			'canKick'		=> $this->rights['ADMIN'],
		));
		
		$this->display('page.alliance.admin.members.tpl');
	}
	
	private function adminMembersSave()
	{
		global $USER, $LNG;
		if (!$this->rights['MANAGEUSERS']) {
			$this->redirectToHome();
		}
		
		$rankResult		= $GLOBALS['DATABASE']->query("SELECT rankID, ".implode(", ", $this->avalibleRanks)." FROM ".ALLIANCE_RANK." WHERE allianceID = ".$this->allianceData['id'].";");
		$rankList		= array();
		$rankList[0]	= array_combine($this->avalibleRanks, array_fill(0, count($this->avalibleRanks), true));
		
		while($rankRow = $GLOBALS['DATABASE']->fetch_array($rankResult))
			$rankList[$rankRow['rankID']]	= $rankRow;
			
		$userRanks	= HTTP::_GP('rank', array());
		foreach($userRanks as $userID => $rankID) {
			if($userID == $this->allianceData['ally_owner'] || !isset($rankList[$rankID])) {
				continue;
			}
			
			unset($rankList[$rankID]['rankID']);
			
			foreach($rankList[$rankID] as $permission => $value) {
				if($this->rights[$permission] < $value)
					continue;
			}
			
			$GLOBALS['DATABASE']->query("UPDATE ".USERS." SET ally_rank_id = ".((int) $rankID)." WHERE id = ".((int) $userID)." AND ally_id = ".$this->allianceData['id'].";");
		}
		
		$this->redirectTo('game.php?page=alliance&mode=memberList');
	}
	
	private function adminMembersKick()
	{
		global $USER, $LNG;
		if (!$this->rights['ADMIN']) {
			$this->redirectToHome();
		}
		
		$id	= HTTP::_GP('id', 0);
		
		$GLOBALS['DATABASE']->multi_query("
		UPDATE ".USERS." SET ally_id = 0, ally_register_time = 0, ally_rank_id = 0 WHERE id = ".$id.";
		UPDATE ".STATPOINTS." SET id_ally = 0 WHERE id_owner = ".$id." AND stat_type = 1;
		UPDATE ".ALLIANCE." SET ally_members = (SELECT COUNT(*) FROM ".USERS." WHERE ally_id = ".$this->allianceData['id'].") WHERE id = ".$this->allianceData['id'].";");
		
		$this->redirectTo('game.php?page=alliance&mode=memberList');
	}
	
	private function adminDiplomacy()
	{
		global $USER, $LNG;
		if (!$this->rights['DIPLOMATIC']) {
			$this->redirectToHome();
		}
		
		$diploList	= array(
			0 => array(
				1 => array(),
				2 => array(),
				3 => array(),
				4 => array(),
				5 => array(),
				6 => array()
			),
			1 => array(
				1 => array(),
				2 => array(),
				3 => array(),
				4 => array(),
				5 => array(),
				6 => array()
			),
			2 => array(
				1 => array(),
				2 => array(),
				3 => array(),
				4 => array(),
				5 => array(),
				6 => array()
			)
		);
		
		$diploResult	= $GLOBALS['DATABASE']->query("SELECT d.id, d.level, d.accept, d.owner_1, d.owner_2, a.ally_name FROM ".DIPLO." d
		INNER JOIN ".ALLIANCE." a ON IF(".$this->allianceData['id']." = d.owner_1, a.id = d.owner_2, a.id = d.owner_1)
		WHERE owner_1 = ".$this->allianceData['id']." OR owner_2 = ".$this->allianceData['id'].";");
		
		while($diploRow = $GLOBALS['DATABASE']->fetch_array($diploResult)) {
			$own	= $diploRow['owner_1'] == $this->allianceData['id'];
			if($diploRow['accept'] == 1) {
				$diploList[0][$diploRow['level']][$diploRow['id']] = $diploRow['ally_name'];
			} elseif($own) {
				$diploList[2][$diploRow['level']][$diploRow['id']] = $diploRow['ally_name'];
			} else {
				$diploList[1][$diploRow['level']][$diploRow['id']] = $diploRow['ally_name'];
			}
		}
		
		
		$this->tplObj->assign_vars(array(
			'diploList'	=> $diploList,
		));
		
		$this->display('page.alliance.admin.diplomacy.default.tpl');
	}
	
	private function admindiplomacyRefuse()
	{
		if (!$this->rights['DIPLOMATIC']) {
			$this->redirectToHome();
		}
		
		$diploAlly	= $GLOBALS['DATABASE']->query("SELECT owner_1,owner_2 FROM ".DIPLO." WHERE id = ".HTTP::_GP('id', 0).";");
		while ($i = $GLOBALS['DATABASE']->fetch_array($diploAlly)){
		
		$getAllianceName = $this->getAllianceName($i['owner_1']);
		$getAllianceName2 = $this->getAllianceName($i['owner_2']);
		
		$getAllianceOwner = $this->getAllianceOwner($i['owner_1']);
		
		$getAllianceTag = $this->getAllianceTag($i['owner_1']);
		$getAllianceTag2 = $this->getAllianceTag($i['owner_2']);
		
		SendSimpleMessage($getAllianceOwner, '', TIMESTAMP, 2, 'System', 'Pact refused between ['.$getAllianceTag.'] and ['.$getAllianceTag2.']', '<span class="bbcode">Hello,<br><br>The alliance "'.$getAllianceName2.'" <span class="orange">['.$getAllianceTag2.']</span> just <span class="rouge">refused</span> the pact with the alliance "'.$getAllianceName.'" <span class="orange">['.$getAllianceTag.']</span>.<br><br>Best Regards</span>');		
		
		}
		
		
		
		$GLOBALS['DATABASE']->query("DELETE FROM ".DIPLO." WHERE id = ".HTTP::_GP('id', 0)." AND (owner_1 = ".$this->allianceData['id']." OR owner_2 = ".$this->allianceData['id'].");");
		
		$this->redirectTo('game.php?page=alliance&mode=pactes');
	}
	
	private function adminDiplomacyAccept()
	{
		if (!$this->rights['DIPLOMATIC']) {
			$this->redirectToHome();
		}
		
		$GLOBALS['DATABASE']->query("UPDATE ".DIPLO." SET accept = 1, time = ".TIMESTAMP." WHERE id = ".HTTP::_GP('id', 0)." AND owner_2 = ".$this->allianceData['id'].";");
		
		$diploAlly	= $GLOBALS['DATABASE']->query("SELECT owner_1,owner_2 FROM ".DIPLO." WHERE id = ".HTTP::_GP('id', 0).";");
		while ($i = $GLOBALS['DATABASE']->fetch_array($diploAlly)){
		
		$getAllianceName = $this->getAllianceName($i['owner_1']);
		$getAllianceName2 = $this->getAllianceName($i['owner_2']);
		
		$getAllianceOwner = $this->getAllianceOwner($i['owner_1']);
		
		$getAllianceTag = $this->getAllianceTag($i['owner_1']);
		$getAllianceTag2 = $this->getAllianceTag($i['owner_2']);
		
		SendSimpleMessage($getAllianceOwner, '', TIMESTAMP, 2, 'System', 'Pact agreed between ['.$getAllianceTag.'] and ['.$getAllianceTag2.']', '<span class="bbcode">Hello,<br><br>The alliance "'.$getAllianceName2.'" <span class="orange">['.$getAllianceTag2.']</span> just <span class="vert">agreed</span> the pact with the alliance "'.$getAllianceName.'" <span class="orange">['.$getAllianceTag.']</span>.<br><i>The other alliance players now have an automatic pact with us.</i><br><br>Best Regards</span>');		
		
		}
		
		$this->redirectTo('game.php?page=alliance&mode=pactes');
	}
	
	private function adminDiplomacyDelete()
	{
		global $USER;
		if (!$this->rights['DIPLOMATIC']) {
			$this->redirectToHome();
		}
		
		$diploAlly	= $GLOBALS['DATABASE']->query("SELECT owner_1,owner_2 FROM ".DIPLO." WHERE id = ".HTTP::_GP('id', 0).";");
		while ($i = $GLOBALS['DATABASE']->fetch_array($diploAlly)){
		
		$getAllianceName = $this->getAllianceName($i['owner_1']);
		$getAllianceName2 = $this->getAllianceName($i['owner_2']);
		$getAllianceOwner = $this->getAllianceOwner($i['owner_1']);
		$getAllianceOwner2 = $this->getAllianceOwner($i['owner_2']);
		$getAllianceTag = $this->getAllianceTag($i['owner_1']);
		$getAllianceTag2 = $this->getAllianceTag($i['owner_2']);
		
		SendSimpleMessage($getAllianceOwner, '', TIMESTAMP, 2, 'System', 'Pact canceled between ['.$getAllianceTag.'] and ['.$getAllianceTag2.']', '<span class="bbcode">Hello,<br><br>The alliance '.$getAllianceName.' <span class="orange">['.$getAllianceTag.']</span> just <span class="rouge">canceled</span> the pact with the alliance '.$getAllianceName2.' <span class="orange">['.$getAllianceTag2.']</span>.<br><i>However, it remains valid for 24 hours. After the delay, automatic pacts with other alliance members will be removed.</i><br><br>Best Regards</span>');		
		
		SendSimpleMessage($getAllianceOwner2, '', TIMESTAMP, 2, 'System', 'Pact canceled between ['.$getAllianceTag.'] and ['.$getAllianceTag2.']', '<span class="bbcode">Hello,<br><br>The alliance '.$getAllianceName2.' <span class="orange">['.$getAllianceTag2.']</span> just <span class="rouge">canceled</span> the pact with the alliance '.$getAllianceName.' <span class="orange">['.$getAllianceTag.']</span>.<br><i>However, it remains valid for 24 hours. After the delay, automatic pacts with other alliance members will be removed.</i><br><br>Best Regards</span>');		
		
		
		}
		
		$GLOBALS['DATABASE']->query("DELETE FROM ".DIPLO." WHERE id = ".HTTP::_GP('id', 0)." AND (owner_1 = ".$this->allianceData['id']." OR owner_2 = ".$this->allianceData['id'].");");

		$this->redirectTo('game.php?page=alliance&mode=pactes');
	}
	
	private function adminDiplomacyCreate()
	{
		global $USER, $LNG;
		if (!$this->rights['DIPLOMATIC']) {
			$this->redirectToHome();
		}
		
		$this->initTemplate();
		$this->setWindow('popup');
		
		$diploMode	= HTTP::_GP('diploMode', 0);
		
		$diploAlly	= $GLOBALS['DATABASE']->query("SELECT ally_tag,ally_name,id FROM ".ALLIANCE." WHERE id != ".$USER['ally_id']." ORDER BY ally_tag ASC;");
		$AllyList = array();
		$IdList = array();
		while ($i = $GLOBALS['DATABASE']->fetch_array($diploAlly))
		{
			$IdList[] = $i['id'];
			$AllyList[] = $i['ally_name'];
		}
		$this->tplObj->assign_vars(array(
			'diploMode'	=> $diploMode,
			'AllyList'	=> $AllyList,
			'IdList'	=> $IdList,
		));
		
		$this->display('page.alliance.admin.diplomacy.create.tpl');
	}
	
	private function adminDiplomacyCreateProcessor()
	{
		global $UNI, $LNG, $USER;
		if (!$this->rights['DIPLOMATIC']) {
			$this->redirectToHome();
		}
		
		$id	= HTTP::_GP('ally_id', '', UTF8_SUPPORT);
		
		$targetAlliance	= $GLOBALS['DATABASE']->getFirstRow("SELECT id, ally_name, ally_owner, ally_tag, (SELECT level FROM ".DIPLO." WHERE (owner_1 = ".$GLOBALS['DATABASE']->sql_escape($id)." AND owner_2 = ".$USER['ally_id'].") OR (owner_2 = ".$GLOBALS['DATABASE']->sql_escape($id)." AND owner_1 = ".$USER['ally_id'].")) as diplo FROM ".ALLIANCE." WHERE ally_universe = ".$UNI." AND id = '".$GLOBALS['DATABASE']->sql_escape($id)."';");
		
		if(empty($targetAlliance)) {
			$this->sendJSON(array(
				'error'		=> true,
				'message'	=> sprintf($LNG['al_diplo_no_alliance'], $targetAlliance['id']),
			));	
		}
		
		if(!empty($targetAlliance['diplo'])) {
			$this->sendJSON(array(
				'error'		=> true,
				'message'	=> sprintf($LNG['al_diplo_exists'], $targetAlliance['ally_name']),
			));	
		}
		if($targetAlliance['id'] == $this->allianceData['id']) {
			$this->sendJSON(array(
				'error'		=> true,
				'message'	=> $LNG['al_diplo_same_alliance'],
			));	
		}
		
		$this->setWindow('ajax');
		
		$level	= HTTP::_GP('level', 0);
		$text	= HTTP::_GP('text', '', true);
		
		if($level == 5)
		{
			SendSimpleMessage($targetAlliance['ally_owner'], $USER['id'], TIMESTAMP, 1, $LNG['al_circular_alliance'].$this->allianceData['ally_tag'], $LNG['al_diplo_war'], sprintf($LNG['al_diplo_war_mes'], "[".$this->allianceData['ally_tag']."] ".$this->allianceData['ally_name'], "[".$targetAlliance['ally_tag']."] ".$targetAlliance['ally_name'], $LNG['al_diplo_level'][$level], $text));
		}
		else
		{
			SendSimpleMessage($targetAlliance['ally_owner'], $USER['id'], TIMESTAMP, 1, $LNG['al_circular_alliance'].$this->allianceData['ally_tag'], $LNG['al_diplo_ask'], sprintf($LNG['al_diplo_ask_mes'], $LNG['al_diplo_level'][$level], "[".$this->allianceData['ally_tag']."] ".$this->allianceData['ally_name'], "[".$targetAlliance['ally_tag']."] ".$targetAlliance['ally_name'], $text));
		}
		
		$GLOBALS['DATABASE']->query("INSERT INTO ".DIPLO." SET 
			owner_1		= ".$this->allianceData['id'].",
			owner_2		= ".$targetAlliance['id'].", 
			level		= ".$level.", 
			accept		= 0, 
			accept_text	= '".$GLOBALS['DATABASE']->sql_escape($text)."', 
			universe	= ".$UNI.";");
		
		$this->sendJSON(array(
			'error'		=> false,
			'message'	=> $LNG['al_diplo_create_done'],
		));
	}
}