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
 * @info $Id: class.ShowFleetTablePage.php 2640 2013-03-23 19:23:26Z slaver7 $
 * @link http://2moons.cc/
 */

require_once('includes/classes/class.FleetFunctions.php');


class ShowFleetTablePage extends AbstractPage
{
	public static $requireModule = MODULE_FLEET_TABLE;

	function __construct() 
	{
		parent::__construct();
	}
	
	public function createACS($fleetID, $fleetData) {
		global $USER;
		
		$rand 			= mt_rand(100000, 999999999);
		$acsName	 	= 'AG'.$rand;
		$acsCreator		= $USER['id'];

		$GLOBALS['DATABASE']->query("INSERT INTO ".AKS." SET
					name = '".$GLOBALS['DATABASE']->sql_escape($acsName)."',
					ankunft = ".$fleetData['fleet_start_time'].",
					target = ".$fleetData['fleet_end_id'].";");
		$acsID	= $GLOBALS['DATABASE']->GetInsertID();
		
		$GLOBALS['DATABASE']->multi_query("INSERT INTO ".USERS_ACS." SET
					acsID = ".$acsID.",
					userID = ".$USER['id'].";
					UPDATE ".FLEETS." SET
					fleet_group = ".$acsID."
					WHERE fleet_id = ".$fleetID.";");
					
		return array(
			'name' 			=> $acsName,
			'id' 			=> $acsID,
		);
	}
	
	public function loadACS($fleetID, $fleetData) {
		global $USER;
		
		$acsResult = $GLOBALS['DATABASE']->query("SELECT id, name 
		FROM ".USERS_ACS." 
		INNER JOIN ".AKS." ON acsID = id 
		WHERE userID = ".$USER['id']." AND acsID = ".$fleetData['fleet_group'].";");
		
		return $GLOBALS['DATABASE']->fetch_array($acsResult);
	}
	
	public function getACSPageData($fleetID)
	{
		global $USER, $PLANET, $LNG, $UNI;
		
		$fleetResult	= $GLOBALS['DATABASE']->query("SELECT fleet_start_time, fleet_end_id, fleet_group, fleet_mess 
									  FROM ".FLEETS."
									  WHERE fleet_id = ".$fleetID.";");

		if ($GLOBALS['DATABASE']->numRows($fleetResult) != 1)
			return array();
					
		$fleetData 		= $GLOBALS['DATABASE']->fetch_array($fleetResult);
		$GLOBALS['DATABASE']->free_result($fleetResult);
		
		if ($fleetData['fleet_mess'] == 1 || $fleetData['fleet_start_time'] <= TIMESTAMP)
			return array();
				
		if ($fleetData['fleet_group'] == 0)
			$acsData	= $this->createACS($fleetID, $fleetData);
		else
			$acsData	= $this->loadACS($fleetID, $fleetData);
	
		if (empty($acsData))
			return array();
			
		$acsName	= HTTP::_GP('acsName', '', UTF8_SUPPORT);
		if(!empty($acsName)) {
			if(!CheckName($acsName))
			{
				$this->sendJSON($LNG['fl_acs_newname_alphanum']);
			}
			
			$GLOBALS['DATABASE']->query("UPDATE ".AKS." SET name = '".$GLOBALS['DATABASE']->sql_escape($acsName)."' WHERE id = ".$acsData['id'].";");
			$this->sendJSON(false);
		}
		
		$invitedUsers	= array();
		$userResult 	= $GLOBALS['DATABASE']->query("SELECT id, username
									  FROM ".USERS_ACS."
									  INNER JOIN ".USERS." ON userID = id 
									  WHERE acsID = ".$acsData['id'].";");
		
		while($userRow = $GLOBALS['DATABASE']->fetch_array($userResult))
		{
			$invitedUsers[$userRow['id']]	= $userRow['username'];
		}

		$GLOBALS['DATABASE']->free_result($userResult);
		
		$newUser		= HTTP::_GP('username', '', UTF8_SUPPORT);
		$statusMessage	= "";
		if(!empty($newUser))
		{
			$newUserID				= $GLOBALS['DATABASE']->getFirstCell("SELECT id FROM ".USERS." WHERE universe = ".$UNI." AND username = '".$GLOBALS['DATABASE']->sql_escape($newUser)."';");
				
			if(empty($newUserID)) {
				$statusMessage			= $LNG['fl_player']." ".$newUser." ".$LNG['fl_dont_exist'];
			} elseif(isset($invitedUsers[$newUserID])) {
				$statusMessage			= $LNG['fl_player']." ".$newUser." ".$LNG['fl_already_invited'];
			} else {
				$statusMessage			= $LNG['fl_player']." ".$newUser." ".$LNG['fl_add_to_attack'];
				
				$GLOBALS['DATABASE']->query("INSERT INTO ".USERS_ACS." SET acsID = ".$acsData['id'].", userID = ".$newUserID.";");
				
				$invitedUsers[$newUserID]	= $newUser;
				
				$inviteTitle			= $LNG['fl_acs_invitation_title'];
				$inviteMessage 			= $LNG['fl_player'] . $USER['username'] . $LNG['fl_acs_invitation_message'];
				SendSimpleMessage($newUserID, $USER['id'], TIMESTAMP, 1, $USER['username'], $inviteTitle, $inviteMessage);
			}
		}
		
		return array(
			'invitedUsers'	=> $invitedUsers,
			'acsName'		=> $acsData['name'],
			'mainFleetID'	=> $fleetID,
			'statusMessage'	=> $statusMessage,
		);
	}
	
	public function show()
	{
		global $USER, $PLANET, $reslist, $resource, $LNG;
		
		$acsData			= array();
		$FleetID			= HTTP::_GP('fleetID', 0);
		$GetAction			= HTTP::_GP('action', "");
		
		$this->tplObj->loadscript('flotten.js');
		
		if(!empty($FleetID) && !IsVacationMode($USER))
		{
			switch($GetAction){
				case "sendfleetback":
					FleetFunctions::SendFleetBack($USER, $FleetID);
				break;
				case "acs":
					$acsData	= $this->getACSPageData($FleetID);
				break;
			}
		}
		
		
		$techExpedition      = $USER[$resource[124]];

		if ($techExpedition >= 1)
		{
			$activeExpedition   = FleetFunctions::GetCurrentFleets($USER['id'], 15);
			$maxExpedition 		= floor(sqrt($techExpedition));
		}
		else
		{
			$activeExpedition 	= 0;
			$maxExpedition 		= 0;
		}

		$maxFleetSlots	= FleetFunctions::GetMaxFleetSlots($USER);

		$targetGalaxy	= HTTP::_GP('galaxy', (int) $PLANET['galaxy']);
		$targetSystem	= HTTP::_GP('system', (int) $PLANET['system']);
		$targetPlanet	= HTTP::_GP('planet', (int) $PLANET['planet']);
		$targetType		= HTTP::_GP('planettype', (int) $PLANET['planet_type']);
		$targetMission	= HTTP::_GP('target_mission', 0);
		
		$fleetResult 		= $GLOBALS['DATABASE']->query("SELECT * FROM ".FLEETS." WHERE fleet_owner = ".$USER['id']." AND fleet_mission <> 10 ORDER BY fleet_end_time ASC;");
		$activeFleetSlots	= $GLOBALS['DATABASE']->numRows($fleetResult);

		$FlyingFleetList	= array();
		
		while ($fleetsRow = $GLOBALS['DATABASE']->fetch_array($fleetResult))
		{
			$fleet = explode(";", $fleetsRow['fleet_array']);

            $FleetList  = array();

			foreach ($fleet as $shipDetail)
			{
				if (empty($shipDetail))
					continue;

				$ship = explode(",", $shipDetail);
				
				$FleetList[$fleetsRow['fleet_id']][$ship[0]] = $ship[1];
			}
			
			if($fleetsRow['fleet_mission'] == 4 && $fleetsRow['fleet_mess'] == FLEET_OUTWARD)
			{
				$returnTime	= $fleetsRow['fleet_start_time'];
			}
			else
			{
				$returnTime	= $fleetsRow['fleet_end_time'];
			}
			
			$FlyingFleetList[]	= array(
				'id'			=> $fleetsRow['fleet_id'],
				'mission'		=> $fleetsRow['fleet_mission'],
				'state'			=> $fleetsRow['fleet_mess'],
				'startGalaxy'	=> $fleetsRow['fleet_start_galaxy'],
				'startSystem'	=> $fleetsRow['fleet_start_system'],
				'startPlanet'	=> $fleetsRow['fleet_start_planet'],
				'startTime'		=> _date($LNG['php_tdformat'], $fleetsRow['fleet_start_time'], $USER['timezone']),
				'endGalaxy'		=> $fleetsRow['fleet_end_galaxy'],
				'endSystem'		=> $fleetsRow['fleet_end_system'],
				'endPlanet'		=> $fleetsRow['fleet_end_planet'],
				'endTime'		=> _date($LNG['php_tdformat'], $fleetsRow['fleet_end_time'], $USER['timezone']),
				'amount'		=> pretty_number($fleetsRow['fleet_amount']),
				'returntime'	=> $returnTime,
				'resttime'		=> $returnTime - TIMESTAMP,
				'FleetList'		=> $FleetList[$fleetsRow['fleet_id']],
			);
		}

		$GLOBALS['DATABASE']->free_result($fleetResult);
		
		$FleetsOnPlanet	= array();
		$avaible_fleets = array(202,203,209,223,219,210,224,204,205,206,207,211,214,215,216);
		foreach($avaible_fleets as $FleetID)
		{
			if ($PLANET[$resource[$FleetID]] == 0)
				continue;
				
			$FleetsOnPlanet[]	= array(
				'id'	=> $FleetID,
				'speed'	=> FleetFunctions::GetFleetMaxSpeed($FleetID, $USER),
				'count'	=> $PLANET[$resource[$FleetID]],
			);
		}
		
		$this->tplObj->assign_vars(array(
			'FleetsOnPlanet'		=> $FleetsOnPlanet,
			'FlyingFleetList'		=> $FlyingFleetList,
			'activeExpedition'		=> $activeExpedition,
			'maxExpedition'			=> $maxExpedition,
			'activeFleetSlots'		=> $activeFleetSlots,
			'maxFleetSlots'			=> $maxFleetSlots,
			'targetGalaxy'			=> $targetGalaxy,
			'targetSystem'			=> $targetSystem,
			'targetPlanet'			=> $targetPlanet,
			'targetType'			=> $targetType,
			'targetMission'			=> $targetMission,
			'acsData'				=> $acsData,
			'isVacation'			=> IsVacationMode($USER),
			'bonusAttack'			=> $USER[$resource[109]] * 10 + (1 + abs($USER['factor']['Attack'])) * 100,
			'bonusDefensive'		=> $USER[$resource[110]] * 10 + (1 + abs($USER['factor']['Defensive'])) * 100,
			'bonusShield'			=> $USER[$resource[111]] * 10 + (1 + abs($USER['factor']['Shield'])) * 100,
			'bonusCombustion'		=> $USER[$resource[115]] * 10,
			'bonusImpulse'			=> $USER[$resource[117]] * 20,
			'bonusHyperspace'		=> $USER[$resource[118]] * 30,
		));
		
		$this->display('page.fleetTable.default.tpl');
	}
	public function managesend()
	{
		global $USER, $PLANET, $reslist, $resource, $LNG;
		
		$planetname	= HTTP::_GP('planetname', '');
		$ship202 = $_POST['ship202'];
		$ship203 = $_POST['ship203'];
		$ship204 = $_POST['ship204'];
		$ship205 = $_POST['ship205'];
		$ship206 = $_POST['ship206'];
		$ship207 = $_POST['ship207'];
		$ship211 = $_POST['ship211'];
		$ship214 = $_POST['ship214'];
		$ship215 = $_POST['ship215'];
		$ship216 = $_POST['ship216'];
		
		if($ship202 + $ship203 + $ship204 + $ship205 + $ship206 + $ship207 + $ship211 + $ship214 + $ship215 + $ship216 > 0){
		$SQL	= "LOCK TABLE `uni1_fleets_manage` WRITE, ".USERS." WRITE;
				   UPDATE ".USERS." SET `fleet_manage` = `fleet_manage` + 1 WHERE id = ".$USER['id'].";
				   INSERT INTO uni1_fleets_manage SET
				   `userID`              = ".$USER['id'].",
				   `manage_name`              = '".$planetname."',
				   `ship202`              = ".$ship202.",
				   `ship203`              = ".$ship203.",
				   `ship204`              = ".$ship204.",
				   `ship205`              = ".$ship205.",
				   `ship206`              = ".$ship206.",
				   `ship207`              = ".$ship207.",
				   `ship211`              = ".$ship211.",
				   `ship214`              = ".$ship214.",
				   `ship215`              = ".$ship215.",
				   `ship216`              = ".$ship216.";
				   SET @manageID = LAST_INSERT_ID();
				   UNLOCK TABLES;";
				   $GLOBALS['DATABASE']->multi_query($SQL);
		}
		
	}
	public function managedelete()
	{
		global $USER, $PLANET, $reslist, $resource, $LNG;
		$idata	= HTTP::_GP('data', '');
		$GLOBALS['DATABASE']->query("DELETE FROM `uni1_fleets_manage` WHERE manageID = ".$idata.";");	
		$GLOBALS['DATABASE']->query("UPDATE uni1_users set fleet_manage = fleet_manage - '1'  WHERE id = ".$USER['id'].";");	
		
	}
	
	public function manage()
	{
		global $USER, $PLANET, $reslist, $resource, $LNG;
		$FleetsOnPlanet	= array();
		$avaible_fleets = array(202,203,204,205,206,207,211,214,215,216);
		foreach($avaible_fleets as $fleetID)
		{
			$FleetsOnPlanet[]	= array(
				'id'	=> $fleetID,
				'count'	=> $PLANET[$resource[$fleetID]],
			);
		}
		
		$userComp = array();
		$GetuserComp = $GLOBALS['DATABASE']->query("SELECT * FROM `uni1_fleets_manage` WHERE userID = ".$USER['id']." ORDER by manageID ASC;");
		while($xb = $GLOBALS['DATABASE']->fetch_array($GetuserComp)){
		$userComp[$xb['manageID']]	= array(
			
			'manage_name'		=> $xb['manage_name'],
			'ship202'		=> $xb['ship202'] == 0 ? '' : pretty_number($xb['ship202']) ,
			'ship203'		=> $xb['ship203'] == 0 ? '' : pretty_number($xb['ship203']) ,
			'ship204'		=> $xb['ship204'] == 0 ? '' : pretty_number($xb['ship204']) ,
			'ship205'		=> $xb['ship205'] == 0 ? '' : pretty_number($xb['ship205']) ,
			'ship206'		=> $xb['ship206'] == 0 ? '' : pretty_number($xb['ship206']) ,
			'ship207'		=> $xb['ship207'] == 0 ? '' : pretty_number($xb['ship207']) ,
			'ship211'		=> $xb['ship211'] == 0 ? '' : pretty_number($xb['ship211']) ,
			'ship214'		=> $xb['ship214'] == 0 ? '' : pretty_number($xb['ship214']) ,
			'ship215'		=> $xb['ship215'] == 0 ? '' : pretty_number($xb['ship215']) ,
			'ship216'		=> $xb['ship216'] == 0 ? '' : pretty_number($xb['ship216']) ,
			
		);
		}
		
		$this->tplObj->assign_vars(array(
		'userComp' => $userComp,
		'FleetsOnPlanet' => $FleetsOnPlanet,
		'fleet_manage' => $USER['fleet_manage'],
		));
		if($USER['fleet_manage'] == 0){
		$this->display('page.fleetgestion.default.tpl');
		}elseif($USER['fleet_manage'] == 1){
		$this->display('page.fleetgestion1.default.tpl');
		}elseif($USER['fleet_manage'] == 2){
		$this->display('page.fleetgestion2.default.tpl'); 
		}elseif($USER['fleet_manage'] == 3){
		$this->display('page.fleetgestion3.default.tpl'); 
		}
	}
}