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
 * @info $Id: class.ShowOverviewPage.php 2640 2013-03-23 19:23:26Z slaver7 $
 * @link http://2moons.cc/
 */

class ShowOverviewPage extends AbstractPage 
{
	public static $requireModule = 0;

	function __construct() 
	{
		parent::__construct();
	}
	
	private function GetTeamspeakData()
	{
		global $CONF, $USER, $LNG;
		if (Config::get('ts_modon') == 0)
		{
			return false;
		}
		
		$GLOBALS['CACHE']->add('teamspeak', 'TeamspeakBuildCache');
		$tsInfo	= $GLOBALS['CACHE']->get('teamspeak', false);
		
		if(empty($tsInfo))
		{
			return array(
				'error'	=> $LNG['ov_teamspeak_not_online']
			);
		}
		
		switch(Config::get('ts_version'))
		{
			case 2:
				$url = 'teamspeak://%s:%s?nickname=%s';
			break;
			case 3:
				$url = 'ts3server://%s?port=%d&amp;nickname=%s&amp;password=%s';
			break;
		}
		
		return array(
			'url'		=> sprintf($url, Config::get('ts_server'), Config::get('ts_tcpport'), $USER['username'], $tsInfo['password']),
			'current'	=> $tsInfo['current'],
			'max'		=> $tsInfo['maxuser'],
			'error'		=> false,
		);
	}
	
	private function GetFleets() {
		global $USER, $PLANET;
		require_once('includes/classes/class.FlyingFleetsTable.php');
		$fleetTableObj = new FlyingFleetsTable;
		$fleetTableObj->setUser($USER['id']);
		$fleetTableObj->setPlanet($PLANET['id']);
		return $fleetTableObj->renderTable();
	}
	
	function savePlanetAction()
	{
		global $USER, $PLANET;
		$password =	HTTP::_GP('password', '', true);
		if (!empty($password))
		{
			$IfFleets	= $GLOBALS['DATABASE']->getFirstCell("SELECT COUNT(*) FROM ".FLEETS." WHERE 
			(
				fleet_owner = ".$USER['id']."
				AND (
					fleet_start_id = ".$PLANET['id']." OR fleet_start_id = ".$PLANET['id_luna']."
				)
			) OR (
				fleet_target_owner = ".$USER['id']." 
				AND (
					fleet_end_id = ".$PLANET['id']." OR fleet_end_id = ".$PLANET['id_luna']."
				)
			);");
			
			if ($IfFleets > 0)
				exit(json_encode(array('message' => $LNG['ov_abandon_planet_not_possible'])));
			elseif ($USER['id_planet'] == $PLANET['id'])
				exit(json_encode(array('message' => $LNG['ov_principal_planet_cant_abanone'])));
			elseif (cryptPassword($password) != $USER['password'])
				exit(json_encode(array('message' => $LNG['ov_wrong_pass'])));
			else
			{
				if($PLANET['planet_type'] == 1) {
					$GLOBALS['DATABASE']->multi_query("UPDATE ".PLANETS." SET destruyed = ".(TIMESTAMP+ 86400)." WHERE id = ".$PLANET['id'].";DELETE FROM ".PLANETS." WHERE id = ".$PLANET['id_luna'].";");
				} else {
					$GLOBALS['DATABASE']->multi_query("UPDATE ".PLANETS." SET id_luna = 0 WHERE id_luna = ".$PLANET['id'].";DELETE FROM ".PLANETS." WHERE id = ".$PLANET['id'].";");
				}
				
				$PLANET['id']	= $USER['id_planet'];
				exit(json_encode(array('ok' => true, 'message' => $LNG['ov_planet_abandoned'])));
			}
		}
	}
		
	function show()
	{
		global $CONF, $LNG, $PLANET, $USER, $resource, $UNI, $ALLIANCE;
		
		$AdminsOnline 	= array();
		$chatOnline 	= array();
		$AllPlanets		= array();
		$Moon 			= array();
		$RefLinks		= array();
		$Buildtime		= 0;
		
		foreach($USER['PLANETS'] as $ID => $CPLANET)
		{		
			if ($ID == $PLANET['id'] || $CPLANET['planet_type'] == 3)
				continue;

			if (!empty($CPLANET['b_building']) && $CPLANET['b_building'] > TIMESTAMP) {
				$Queue				= unserialize($CPLANET['b_building_id']);
				$BuildPlanet		= $LNG['tech'][$Queue[0][0]]." (".$Queue[0][1].")<br><span style=\"color:#7F7F7F;\">(".pretty_time($Queue[0][3] - TIMESTAMP).")</span>";
			} else {
				$BuildPlanet     = $LNG['ov_free'];
			}
			
			$AllPlanets[] = array(
				'id'	=> $CPLANET['id'],
				'name'	=> $CPLANET['name'],
				'image'	=> $CPLANET['image'],
				'build'	=> $BuildPlanet,
			);
		}
		
		if ($PLANET['id_luna'] != 0) {
			$Moon		= $GLOBALS['DATABASE']->getFirstRow("SELECT id, name FROM ".PLANETS." WHERE id = '".$PLANET['id_luna']."';");
		}
		$overmessage = 0;	
		if ($PLANET['b_building'] - TIMESTAMP > 0) {
			$Queue			= unserialize($PLANET['b_building_id']);
			$temp_total = (BuildFunctions::getBuildingTime($USER, $PLANET, $Queue[0][0], (BuildFunctions::getElementPrice($USER, $PLANET, $Queue[0][0], false, ($Queue[0][1]-1)))));
			$temps_rest = $PLANET['b_building'] - TIMESTAMP;
			$pourc = 100-(100/$temp_total*$temps_rest);

			
			$buildInfo['buildings']	= array(
				'price'		=> BuildFunctions::getElementPrice($USER, $PLANET, $Queue[0][0], false, ($Queue[0][1]-1)),
				'elementime'		=> pretty_time(BuildFunctions::getBuildingTime($USER, $PLANET, $Queue[0][0], (BuildFunctions::getElementPrice($USER, $PLANET, $Queue[0][0], false, ($Queue[0][1]-1))))),
				'id'		=> $Queue[0][0],
				'level'		=> $Queue[0][1],
				'timeleft'	=> $PLANET['b_building'] - TIMESTAMP,
				'time'		=> $PLANET['b_building'],
				'endtime'		=> date('d/m/Y H:i:s', $PLANET['b_building']),
				'percenting'		=> round($pourc),
				'starttime'	=> pretty_time($PLANET['b_building'] - TIMESTAMP),
				'starttimeego'		=> date('d/m/Y H:i:s', ($PLANET['b_building'] - (BuildFunctions::getBuildingTime($USER, $PLANET, $Queue[0][0], (BuildFunctions::getElementPrice($USER, $PLANET, $Queue[0][0], false, ($Queue[0][1]-1))))))),
			);
			$overmessage = 1;	
		}
		else {
			$buildInfo['buildings']	= false;
		}
		
		/* As FR#206 (http://tracker.2moons.cc/view.php?id=206), i added the shipyard and research status here, but i add not them the template. */
		
		if (!empty($PLANET['b_hangar_id'])) {
			$Queue	= unserialize($PLANET['b_hangar_id']);
			$time	= BuildFunctions::getBuildingTime($USER, $PLANET, $Queue[0][0]) * $Queue[0][1];
			$times	= BuildFunctions::getBuildingTime($USER, $PLANET, $Queue[0][0]);
			
			
			$buildInfo['fleet']	= array(
				'price'		=> BuildFunctions::getElementPrice($USER, $PLANET, $Queue[0][0]),
				'id'		=> $Queue[0][0],
				'level'		=> $Queue[0][1],
				'timeleft'	=> $time - $PLANET['b_hangar'],
				'timelefts'	=> date('d/m/Y H:i:s', (TIMESTAMP + ($times - $PLANET['b_hangar']))),
				'time'		=> $time,
				'starttime'	=> pretty_time($time - $PLANET['b_hangar']),
				'endtime'	=> date('d/m/Y H:i:s',(TIMESTAMP + $time - $PLANET['b_hangar'])),
			);
			$overmessage = 1;
		}
		else {
			$buildInfo['fleet']	= false;
		}
		
		if (!empty($PLANET['b_defense_id'])) {
			$Queue	= unserialize($PLANET['b_defense_id']);
			$time	= BuildFunctions::getBuildingTime($USER, $PLANET, $Queue[0][0]) * $Queue[0][1];
			$times	= BuildFunctions::getBuildingTime($USER, $PLANET, $Queue[0][0]);
			$buildInfo['defense']	= array(
				'price'		=> BuildFunctions::getElementPrice($USER, $PLANET, $Queue[0][0]),
				'id'		=> $Queue[0][0],
				'level'		=> $Queue[0][1],
				'timeleft'	=> $time - $PLANET['b_defense'],
				'timelefts'	=> date('d/m/Y H:i:s', (TIMESTAMP + ($times - $PLANET['b_defense']))),
				'time'		=> $time,
				'starttime'	=> pretty_time($time - $PLANET['b_defense']),
				'endtime'	=> date('d/m/Y H:i:s',(TIMESTAMP + $time - $PLANET['b_defense'])),
			);
			$overmessage = 1;
		}
		else {
			$buildInfo['defense']	= false;
		}
		
		if ($USER['b_tech'] - TIMESTAMP > 0) {
			$Queue			= unserialize($USER['b_tech_queue']);
			$temp_total = (BuildFunctions::getBuildingTime($USER, $PLANET, $Queue[0][0], (BuildFunctions::getElementPrice($USER, $PLANET, $Queue[0][0], false, ($Queue[0][1]-1)))));
			$temps_rest = $PLANET['b_building'] - TIMESTAMP;
			$pourc = 100-(100/$temp_total*$temps_rest);
			$buildInfo['tech']	= array(
				'price'		=> BuildFunctions::getElementPrice($USER, $PLANET, $Queue[0][0], false, ($Queue[0][1]-1)),
				'elementime'		=> pretty_time(BuildFunctions::getBuildingTime($USER, $PLANET, $Queue[0][0], (BuildFunctions::getElementPrice($USER, $PLANET, $Queue[0][0], false, ($Queue[0][1]-1))))),
				'id'		=> $Queue[0][0],
				'level'		=> $Queue[0][1],
				'timeleft'	=> $USER['b_tech'] - TIMESTAMP,
				'endtime'		=> date('d/m/Y H:i:s', $USER['b_tech']),
				'percenting'		=> round($pourc),
				'starttime'	=> pretty_time($USER['b_tech'] - TIMESTAMP),
				'starttimeego'		=> date('d/m/Y H:i:s', ($USER['b_tech'] - (BuildFunctions::getBuildingTime($USER, $PLANET, $Queue[0][0], (BuildFunctions::getElementPrice($USER, $PLANET, $Queue[0][0], false, ($Queue[0][1]-1))))))),
			);
			$overmessage = 1;
		}
		else {
			$buildInfo['tech']	= false;
		}
		
		
		
		$OnlineAdmins 	= $GLOBALS['DATABASE']->query("SELECT id,username FROM ".USERS." WHERE universe = ".$UNI." AND onlinetime >= ".(TIMESTAMP-10*60)." AND authlevel > '".AUTH_USR."';");
		while ($AdminRow = $GLOBALS['DATABASE']->fetch_array($OnlineAdmins)) {
			$AdminsOnline[$AdminRow['id']]	= $AdminRow['username'];
		}
		$GLOBALS['DATABASE']->free_result($OnlineAdmins);


		

		$Messages		= $USER['messages'];
		
		// Fehler: Wenn Spieler gelöscht werden, werden sie nicht mehr in der Tabelle angezeigt.
		$RefLinksRAW	= $GLOBALS['DATABASE']->query("SELECT u.id, u.username, s.total_points FROM ".USERS." as u LEFT JOIN ".STATPOINTS." as s ON s.id_owner = u.id AND s.stat_type = '1' WHERE ref_id = ".$USER['id'].";");
		
		if(Config::get('ref_active')) 
		{
			while ($RefRow = $GLOBALS['DATABASE']->fetch_array($RefLinksRAW)) {
				$RefLinks[$RefRow['id']]	= array(
					'username'	=> $RefRow['username'],
					'points'	=> min($RefRow['total_points'], Config::get('ref_minpoints'))
				);
			}
		}
		
		if($USER['total_rank'] == 0) {
			$rankInfo	= "-";
		} else {
			$rankInfo	= sprintf($LNG['ov_userrank_info'], pretty_number($USER['total_points']), $LNG['ov_place'], $USER['total_rank'], $USER['total_rank'], $LNG['ov_of'], Config::get('users_amount'));
		}
		
		
		if($USER['total_rank'] == 0) {
			$userRank	= "-";
			$userTotal = Config::get('users_amount');
		} else {
			$userRank	= $USER['total_rank'];
			$userTotal = Config::get('users_amount');
		}
		
		
		$AllFeeds = array();
   
			$GetAll = $GLOBALS['DATABASE']->query("SELECT * FROM `uni1_newsfeed` WHERE accepted = '1' AND valid_until > ".TIMESTAMP." ORDER BY date DESC LIMIT 6;");
			if($GLOBALS['DATABASE']->numRows($GetAll)>0){
			while($x = $GLOBALS['DATABASE']->fetch_array($GetAll)){
			$AllFeeds[] = $x;
			}
			}
			
			
			
				
				$allianceData = $GLOBALS['DATABASE']->query("SELECT DISTINCT a.*, s.total_rank, s.total_points FROM ".ALLIANCE." as a
                INNER JOIN ".STATPOINTS." as s ON a.id = s.id_owner
                WHERE `universe` = 1 AND `id` = ".$USER['ally_id'].";");
				
				
			$Total_alliance = $GLOBALS['DATABASE']->query("SELECT COUNT(id) FROM ".ALLIANCE.";");
			$Total_alliance = $GLOBALS['DATABASE']->fetch_array($Total_alliance);
			
			$ally_tag = $this->getAllianceTag($USER['ally_id']);
			$ally_name = $this->getAllianceName($USER['ally_id']);
			$ally_members = '';
			$ally_points = '';
			$ally_rank = '';
			if($GLOBALS['DATABASE']->numRows($allianceData)>0){
			while($as = $GLOBALS['DATABASE']->fetch_array($allianceData)){
			$ally_members = $as['ally_members'];
			$ally_points = pretty_number($as['total_points']);
			$ally_rank = $as['total_rank'];
			}
			}
			
			
			$statinfo	= $GLOBALS['DATABASE']->query("SELECT s.total_points, s.popu_points, s.defs_points, s.build_points, s.fleet_points, s.tech_points, s.total_old_rank, s.total_rank, h.history_total_points  FROM ".USERS." as u 
			LEFT JOIN ".STATPOINTS." as s ON s.id_owner = u.id AND s.stat_type = '1'
			LEFT JOIN ".STATHISTORY." as h ON h.id_owner = u.id WHERE id = ".$USER['id'].";");
		while ($game = $GLOBALS['DATABASE']->fetch_array($statinfo)) {
		$ranking	= $game['total_old_rank'] - $game['total_rank'];
		$totalo = $game['total_points'] - $game['history_total_points'];
		$totalP = $game['total_points'];
		$totalBuild = $game['build_points'];
		$totalResearch = $game['tech_points'];
		$totalFleet = $game['fleet_points'];
		$totalDefense = $game['defs_points'];
		$totalPopu = $game['popu_points'];
		
		if($ranking == 0){
		$position = "<span style='color:orange'>0";
		}elseif($ranking < 0){
		$position = "<img src='media/ingame/image/diminue.png' /><span style='color:rouge'>(".$ranking.")";
		}elseif ($ranking > 0){
		$position = "<img src='media/ingame/image/augmente.png' /><span style='color:vert'>(+".$ranking.")";
		}
		
		if($totalo == 0){
		$positionP = "<span style='color:orange'>0";
		}elseif($totalo < 0){
		$positionP = "<img src='media/ingame/image/diminue.png' /><span style='color:rouge'> (".pretty_number($totalo).")";
		}elseif ($totalo > 0){
		$positionP = "<img src='media/ingame/image/augmente.png' /><span style='color:vert'> (+".pretty_number($totalo).")";
		}
		}
		  
		
			$post	= $position;
			$postP	= $positionP;
		
		$GetAll99 = $GLOBALS['DATABASE']->query("SELECT id FROM ".PLANETS." WHERE id != ".$PLANET['id']." AND id_owner = ".$USER['id']." AND destruyed = '0' ;");
		$GetAll99 = $GLOBALS['DATABASE']->numRows($GetAll99);
		$fleetCount					= $GLOBALS['DATABASE']->getFirstCell("SELECT COUNT(*) FROM ".FLEETS." WHERE fleet_owner = '".$USER['id']."' OR fleet_target_owner = '".$USER['id']."' AND hasCanceled = '0' AND fleet_mess = '0' AND fleet_mission != '8';");
		
		$defcontext = '';
		$defcon = '';;
		if($USER['ally_id'] != 0){
		$textar = $GLOBALS['DATABASE']->query("SELECT defcon FROM ".ALLIANCE." WHERE id = ".$USER['ally_id']." ;");
		while($x = $GLOBALS['DATABASE']->fetch_array($textar)){
		$defcontext = '';
		$defcon = $x['defcon'];
		if($x['defcon'] == 5){
		$defcontext = 'Normal preparation in peacetime';
		}elseif($x['defcon'] == 4){
		$defcontext = 'Normal preparation, but increased and enhanced information security measures'; //vert
		}elseif($x['defcon'] == 3){
		$defcontext = 'Increased preparation of forces beyond the normal preparation'; //jaune
		}elseif($x['defcon'] == 2){
		$defcontext = 'Further increase in the preparation of forces, but less than the maximum preparation'; //oramnge
		}elseif($x['defcon'] == 1){
		$defcontext = 'State of War: Maximum forces Preparation'; //rouge
		}
		}		
		}
		$GeTransportCount =$GLOBALS['DATABASE']->getFirstCell("SELECT COUNT(*) FROM `uni1_transport_player` WHERE senderID = ".$USER['id']." AND legal = '1' OR receiverID = ".$USER['id']." AND legal = '1';");
		
		//Bank Config
		if($CONF['newbank'] < TIMESTAMP){
		$Info =$GLOBALS['DATABASE']->query("SELECT taxe_metal, new_taxe_metal, taxe_crystal, new_taxe_crystal, taxe_deuterium, new_taxe_deuterium, taxe_elyrium, new_taxe_elyrium FROM `uni1_config` WHERE uni = '1';");	
		$Info  = $GLOBALS['DATABASE']->fetch_array($Info);
		$NewMet = ($Info['taxe_metal'] + $Info['new_taxe_metal']);
		$NewCryt = ($Info['taxe_crystal'] + $Info['new_taxe_crystal']);
		$NewDeut = ($Info['taxe_deuterium'] + $Info['new_taxe_deuterium']);
		$NewElyr = ($Info['taxe_elyrium'] + $Info['new_taxe_elyrium']);
		$GLOBALS['DATABASE']->query("UPDATE ".CONFIG." SET taxe_metal = '".$NewMet."', taxe_crystal = '".$NewCryt."', taxe_deuterium = '".$NewDeut."', taxe_elyrium = '".$NewElyr."', new_taxe_metal = '0', new_taxe_crystal = '0', new_taxe_deuterium = '0', new_taxe_elyrium = '0', newbank = newbank + '".(TIMESTAMP+ 3600*24)."';");		
		} 
		
		$this->tplObj->assign_vars(array(
			'avatar'					=> $USER['avatar'],
			'totalP' => pretty_number($totalP),
			'totalBuild' => pretty_number($totalBuild)	,
			'totalResearch' => pretty_number($totalResearch)	,
			'totalFleet' => pretty_number($totalFleet)	,
			'totalDefense' => pretty_number($totalDefense)	,
			'totalPopu' => pretty_number($totalPopu)	,
			'GetAll99' => $GetAll99	,
			'fleetCount' => $fleetCount	,
			'defcontext' => $defcontext	,
			'defcon' => $defcon	,
			'overmessage' => $overmessage	,
			'postal' => $post	,
			'postalP' => $postP	,
			'userRank' => $userRank	,
			'GeTransportCount' => $GeTransportCount	,
			'userTotal' => $userTotal,
			'Total_alliance'					=> (int) $Total_alliance,
			'ally_tag'					=> $ally_tag,
			'ally_rank'					=> $ally_rank,
			'ally_points'					=> $ally_points,
			'ally_members'					=> $ally_members,
			'ally_name'					=> $ally_name,
			'rankInfo'					=> $rankInfo,
			'userally'					=> $USER['ally_id'],
			'AllFeeds' => $AllFeeds,
			'is_news'					=> Config::get('OverviewNewsFrame'),
			'news'						=> makebr(Config::get('OverviewNewsText')),
			'planetname'				=> $PLANET['name'],
			'planetimage'				=> $PLANET['image'],
			'cokies'				=> isset($_COOKIE['salle_de_controle-detail_statistique']) ? $_COOKIE['salle_de_controle-detail_statistique'] : 'false', 
			'galaxy'					=> $PLANET['galaxy'],
			'system'					=> $PLANET['system'],
			'planet'					=> $PLANET['planet'],
			'planet_type'				=> $PLANET['planet_type'],
			'username'					=> $USER['username'],
			'userid'					=> $USER['id'],
			'allyID'					=> $USER['ally_id'],
			'buildInfo'					=> $buildInfo,
			'Moon'						=> $Moon,
			'fleets'					=> $this->GetFleets(),
			'AllPlanets'				=> $AllPlanets,
			'AdminsOnline'				=> $AdminsOnline,
			'teamspeakData'				=> $this->GetTeamspeakData(),
			'messages'					=> ($Messages > 0) ? (($Messages == 1) ? $LNG['ov_have_new_message'] : sprintf($LNG['ov_have_new_messages'], pretty_number($Messages))): false,
			'planet_diameter'			=> pretty_number($PLANET['diameter']),
			'teleport_portal' 		=> $PLANET['teleport_portal'],
			'force_field' 		=> $PLANET['force_field_timer'],
			'siege_active' 		=> $PLANET['siege_on'],
			'planet_field_current' 		=> $PLANET['field_current'],
			'planet_field_max' 			=> CalculateMaxPlanetFields($PLANET),
			'planet_temp_min' 			=> $PLANET['temp_min'],
			'planet_temp_max' 			=> $PLANET['temp_max'],
			'ref_active'				=> Config::get('ref_active'),
			'ref_minpoints'				=> Config::get('ref_minpoints'),
			'RefLinks'					=> $RefLinks,
			'path'						=> HTTP_PATH,
			'trem'						=> TIMESTAMP,
			'taxe_metal' => $CONF['taxe_metal'],
			'taxe_crystal' => $CONF['taxe_crystal'],
			'taxe_deuterium' => $CONF['taxe_deuterium'],
			'taxe_elyrium' => $CONF['taxe_elyrium'],
		));
		
		$this->display('page.overview.default.tpl');
	}
	
	function actions() 
	{
		global $LNG, $PLANET;

		$this->initTemplate();
		$this->setWindow('popup');
		
		$this->tplObj->loadscript('overview.actions.js');
		$this->tplObj->assign_vars(array(
			'ov_security_confirm'		=> sprintf($LNG['ov_security_confirm'], $PLANET['name'].' ['.$PLANET['galaxy'].':'.$PLANET['system'].':'.$PLANET['planet'].']'),
		));
		$this->display('page.overview.actions.tpl');
	}
	
	function rename() 
	{
		global $LNG, $PLANET;

		$newname        = HTTP::_GP('name', '', UTF8_SUPPORT);
		if (!empty($newname))
		{
			if (!CheckName($newname)) {
				$this->sendJSON(array('message' => $LNG['ov_newname_specialchar'], 'error' => true));
			} else {
				$GLOBALS['DATABASE']->query("UPDATE ".PLANETS." SET name = '".$GLOBALS['DATABASE']->sql_escape($newname)."' WHERE id = ".$PLANET['id'].";");
				$this->sendJSON(array('message' => $LNG['ov_newname_done'], 'error' => false));
			}
		}
	}
	
	function newmail() {
	global $USER, $LNG, $PLANET;
	$getch = $GLOBALS['DATABASE']->query("SELECT SUM(message_unread) as id FROM `uni1_messages` where `message_owner` = '".$USER['id']."' AND `message_unread` = '1' ");
	while($x = $GLOBALS['DATABASE']->fetch_array($getch)){
	$resp = ($x['id']);
	}
	
	
	
	
	$this->sendJSON(array('message' => $resp));
	}
	
	function endIntro() 
	{
	global $USER, $LNG, $PLANET;
	$GLOBALS['DATABASE']->query("UPDATE ".USERS." SET intro = '1' WHERE id = '".$USER['id']."'");
	}
	
	function delete() 
	{
		global $LNG, $PLANET, $USER;
		$password	= HTTP::_GP('password', '', true);
		
		if (!empty($password))
		{
			$IfFleets	= $GLOBALS['DATABASE']->getFirstCell("SELECT COUNT(*) FROM ".FLEETS." WHERE 
			(
				fleet_owner = '".$USER['id']."'
				AND (
						fleet_start_id = ".$PLANET['id']." OR fleet_start_id = ".$PLANET['id_luna']."
				)
			) OR (
				fleet_target_owner = '".$USER['id']."' 
				AND (
						fleet_end_id = '".$PLANET['id']."' OR fleet_end_id = ".$PLANET['id_luna']."
				)
			);");

			if ($IfFleets > 0) {
				$this->sendJSON(array('message' => $LNG['ov_abandon_planet_not_possible']));
			} elseif ($USER['id_planet'] == $PLANET['id']) {
				$this->sendJSON(array('message' => $LNG['ov_principal_planet_cant_abanone']));
			} elseif (cryptPassword($password) != $USER['password']) {
				$this->sendJSON(array('message' => $LNG['ov_wrong_pass']));
			} else {
				if($PLANET['planet_type'] == 1) {
					$GLOBALS['DATABASE']->multi_query("DELETE FROM ".PLANETS." WHERE id = ".$PLANET['id_luna'].";DELETE FROM ".PLANETS." WHERE id = ".$PLANET['id'].";");
				} else {
					$GLOBALS['DATABASE']->multi_query("UPDATE ".PLANETS." SET id_luna = '0' WHERE id_luna = ".$PLANET['id'].";DELETE FROM ".PLANETS." WHERE id = ".$PLANET['id'].";");
				}
				
				$_SESSION['planet']     = $USER['id_planet'];
				$this->sendJSON(array('ok' => true, 'message' => $LNG['ov_planet_abandoned']));
			}
		}
	}
}