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
 * @info $Id: class.ShowFleetStep1Page.php 2640 2013-03-23 19:23:26Z slaver7 $
 * @link http://2moons.cc/
 */

require_once('includes/classes/class.FleetFunctions.php');

class ShowFleetStep1Page extends AbstractPage
{
	public static $requireModule = MODULE_FLEET_TABLE;

	function __construct() 
	{
		parent::__construct();
	}
	
	public function ajax()
    {
    global  $USER, $PLANET, $LNG, $LANG,$CONF,$UNI,$resource,$reslist;
	
	$this->setWindow('ajax');
	$targetGalaxy  				= HTTP::_GP('galaxy', 0);
	$targetSystem   			= HTTP::_GP('system', 0);
	$targetPlanet   			= HTTP::_GP('planet', 0);
	$targetType 				= HTTP::_GP('type', 0);
	$targetMission 				= HTTP::_GP('target_mission', 0); 
	$fleetGroup 				= HTTP::_GP('fleet_group', 0);
	$token						= HTTP::_GP('token', '');
	$fleetSpeed  				= HTTP::_GP('speed', 0);		
	$fleetArray    				= $_SESSION['fleet'][$token]['fleet'];
	
	$targetPlanetData			= $GLOBALS['DATABASE']->getFirstRow("SELECT `id`, `id_owner`, `der_metal`, `der_crystal`, `der_deuterium` FROM `".PLANETS."` WHERE `universe` = ".$UNI." AND `galaxy` = ".$targetGalaxy." AND `system` = ".$targetSystem." AND `planet` = ".$targetPlanet." AND `planet_type` = '1';");
	$MisInfo		     		= array();		
	$MisInfo['galaxy']     		= $targetGalaxy;		
	$MisInfo['system'] 	  		= $targetSystem;	
	$MisInfo['planet'] 	  		= $targetPlanet;		
	$MisInfo['planettype'] 		= $targetType;	
	$MisInfo['IsAKS']			= $fleetGroup;
	$MisInfo['Ship'] 			= $fleetArray;
	$MissionOutput	 			= FleetFunctions::GetFleetMissions($USER, $MisInfo, $targetPlanetData);
	
	
	
		$GameSpeedFactor   		 	= FleetFunctions::GetGameSpeedFactor();		
		$MaxFleetSpeed 				= FleetFunctions::GetFleetMaxSpeed($fleetArray, $USER);
		$distance      				= FleetFunctions::GetTargetDistance(array($PLANET['galaxy'], $PLANET['system'], $PLANET['planet']), array($targetGalaxy, $targetSystem, $targetPlanet));
		$duration      				= FleetFunctions::GetMissionDuration($fleetSpeed, $MaxFleetSpeed, $distance, $GameSpeedFactor, $USER);
		$consumption				= FleetFunctions::GetFleetConsumption($fleetArray, $duration, $distance, $MaxFleetSpeed, $USER, $GameSpeedFactor);
		
		$_SESSION['fleet'][$token]['speed']			= $MaxFleetSpeed;
		$_SESSION['fleet'][$token]['distance']		= $distance;
		$_SESSION['fleet'][$token]['targetGalaxy']	= $targetGalaxy;
		$_SESSION['fleet'][$token]['targetSystem']	= $targetSystem;
		$_SESSION['fleet'][$token]['targetPlanet']	= $targetPlanet;
		$_SESSION['fleet'][$token]['targetType']	= $targetType;
		$_SESSION['fleet'][$token]['fleetGroup']	= $fleetGroup;
		$_SESSION['fleet'][$token]['fleetSpeed']	= $fleetSpeed; 
		
		

    $this->tplObj->assign_vars(array(
	'MissionSelector' 				=> $MissionOutput['MissionSelector'],
	'StaySelector' 					=> $MissionOutput['StayBlock'],
	'mission'						=> $targetMission,
	'tokens' 						=> $token,
    ));
    $this->display('page.mission.default.tpl');
    }
	
	public function show()
	{
		global $USER, $PLANET, $resource, $pricelist, $reslist, $LNG;
		$PlanetCount					= $GLOBALS['DATABASE']->getFirstCell("SELECT COUNT(*) FROM ".PLANETS." WHERE id != ".$PLANET['id']." AND id_owner = ".$USER['id']." AND destruyed = 0;");
		
		$targetGalaxy 			= HTTP::_GP('galaxy', '');
		$targetSystem 			= HTTP::_GP('system', '');
		$targetPlanet			= HTTP::_GP('planet', '');
		$targetType 			= HTTP::_GP('type', (int) $PLANET['planet_type']);
		
		$mission				= HTTP::_GP('target_mission', 0);
		$missionText = '';
		$missionDesc = '';
		
		if($mission != 0){
		$missionText = $LNG['type_missionbis'][$mission];
		}	
		if($mission != 0){
		$missionDesc = $LNG['type_missionDesc'][$mission];
		}		
		$Fleet		= array();
		$FleetRoom	= 0;
		foreach ($reslist['fleet'] as $id => $ShipID)
		{
			$amount		 				= max(0, round(HTTP::_GP('ship'.$ShipID, 0.0, 0.0)));
			
			if ($amount < 1 || $ShipID == 212) continue;

			$Fleet[$ShipID]				= $amount;
			$FleetRoom			   	   += $pricelist[$ShipID]['capacity'] * $amount;
		}
		
		$FleetRoom	*= 1 + $USER['factor']['ShipStorage'];
		
		if (empty($Fleet))
			FleetFunctions::GotoFleetPage();
	
		$FleetData	= array(
			'fleetroom'			=> floattostring($FleetRoom),
			'gamespeed'			=> FleetFunctions::GetGameSpeedFactor(),
			'fleetspeedfactor'	=> max(0, 1 + $USER['factor']['FlyTime']),
			'planet'			=> array('galaxy' => $PLANET['galaxy'], 'system' => $PLANET['system'], 'planet' => $PLANET['planet'], 'planet_type' => $PLANET['planet_type']),
			'maxspeed'			=> FleetFunctions::GetFleetMaxSpeed($Fleet, $USER),
			'ships'				=> FleetFunctions::GetFleetShipInfo($Fleet, $USER),
			'fleetMinDuration'	=> MIN_FLEET_TIME,
		);
		
		$token		= getRandomString();
		
		$_SESSION['fleet'][$token]	= array(
			'time'		=> TIMESTAMP,
			'fleet'		=> $Fleet,
			'fleetRoom'	=> $FleetRoom,
		);

		$shortcutList	= $this->GetUserShotcut();
		$colonyList 	= $this->GetColonyList();
		$ACSList 		= $this->GetAvalibleACS();
		
		if(!empty($shortcutList)) {
			$shortcutAmount	= max(array_keys($shortcutList));
		} else {
			$shortcutAmount	= 0;
		}
		
		$PopulationOnPlanet	= array();
		$avaible_pop = array(301,302,303,304,305,306,307);
		foreach($avaible_pop as $populationID)
		{
			
				
			$PopulationOnPlanet[]	= array(
				'id'	=> $populationID,
				'count'	=> $PLANET[$resource[$populationID]],
			);
		}
		
		$this->tplObj->loadscript('flotten.js');
		$this->tplObj->execscript('updateVars();calculateTransportCapacity();FleetTime();window.setInterval("FleetTime()", 1000);');
		$this->tplObj->assign_vars(array(
			'token'			=> $token,
			'missionText'		=> $missionText,
			'missionDesc'		=> $missionDesc,
			'mission'		=> $mission,
			'shortcutList'	=> $shortcutList,
			'shortcutMax'	=> $shortcutAmount,
			'colonyList' 	=> $colonyList,
			'PopulationOnPlanet' => $PopulationOnPlanet,
			'ACSList' 		=> $ACSList,
			'galaxy' 		=> $targetGalaxy,
			'system' 		=> $targetSystem,
			'planet' 		=> $targetPlanet,
			'PlanetCount' 		=> $PlanetCount,
			'type'			=> $targetType,
			'speedSelect'	=> FleetFunctions::$allowedSpeed,
			'typeSelect'   	=> array(1 => $LNG['type_planet'][1], 2 => $LNG['type_planet'][2]),
			'fleetdata'		=> $FleetData,
		));
		
		$this->display('page.fleetStep1.default.tpl');
	}
	
	public function saveShortcuts()
	{
		global $USER, $LNG;
		
		if(!isset($_REQUEST['shortcut'])) {
			$this->sendJSON($LNG['fl_shortcut_saved']);
		}
		
		$Shortcut		= array();
		$ShortcutData	= $_REQUEST['shortcut'];
		$ShortcutUser	= $this->GetUserShotcut();
		foreach($ShortcutData as $ID => $Data) {
			if(!isset($ShortcutUser[$ID])) {
				if(empty($Data['name']) || empty($Data['galaxy']) || empty($Data['system']) || empty($Data['planet'])) {
					continue;
				}
				
				$GLOBALS['DATABASE']->query("INSERT INTO ".SHORTCUTS." 
				SET ownerID = ".$USER['id'].",
				name = '".$GLOBALS['DATABASE']->sql_escape($Data['name'])."', 
				galaxy = ".((int) $Data['galaxy']).", 
				system = ".((int) $Data['system']).",
				planet = ".((int) $Data['planet']).",
				type = ".((int) $Data['type']).";");
			} elseif(empty($Data['name'])) {
				$GLOBALS['DATABASE']->query("DELETE FROM ".SHORTCUTS." WHERE shortcutID = ".((int) $ID)." AND ownerID = ".$USER['id'].";");
			} else {
				$Data['ownerID']		= $USER['id'];
				$Data['shortcutID']		= $ID;
				if($Data != $ShortcutUser[$ID]) {
					$GLOBALS['DATABASE']->query("UPDATE ".SHORTCUTS." 
					SET name = '".$GLOBALS['DATABASE']->sql_escape($Data['name'])."', 
					galaxy = ".((int) $Data['galaxy']).", 
					system = ".((int) $Data['system']).",
					planet = ".((int) $Data['planet']).",
					type = ".((int) $Data['type'])."
					WHERE shortcutID = ".((int) $ID)." AND ownerID = ".$USER['id'].";");
				}				
			}
		}
		
		$this->sendJSON($LNG['fl_shortcut_saved']);
	}
	
	private function GetColonyList()
	{
		global $PLANET, $USER;
		
		$ColonyList	= array();
		
		foreach($USER['PLANETS'] as $CurPlanetID => $CurPlanet)
		{
			if ($PLANET['id'] == $CurPlanet['id'])
				continue;
			
			$ColonyList[] = array(
				'name'		=> $CurPlanet['name'],
				'galaxy'	=> $CurPlanet['galaxy'],
				'system'	=> $CurPlanet['system'],
				'planet'	=> $CurPlanet['planet'],
				'type'		=> $CurPlanet['planet_type'],
				'image'		=> $CurPlanet['image'],
			);	
		}
			
		return $ColonyList;
	}
	
	private function GetUserShotcut()
	{
		global $USER;
		
		if (!isModulAvalible(MODULE_SHORTCUTS))
			return array();
			
		$ShortcutResult	= $GLOBALS['DATABASE']->query("SELECT * FROM ".SHORTCUTS." WHERE ownerID = ".$USER['id'].";");
			
		$ShortcutList	= array();

		while($ShortcutRow = $GLOBALS['DATABASE']->fetch_array($ShortcutResult)) {						
			$ShortcutList[$ShortcutRow['shortcutID']] = $ShortcutRow;
		}
		
		$GLOBALS['DATABASE']->free_result($ShortcutResult);
		
		return $ShortcutList;
	}
	
	private function GetAvalibleACS()
	{
		global $USER, $CONF;
		
		$ACSResult 	= $GLOBALS['DATABASE']->query("SELECT acs.id, acs.name, planet.galaxy, planet.system, planet.planet, planet.planet_type 
		FROM ".USERS_ACS."
		INNER JOIN ".AKS." acs ON acsID = acs.id
		INNER JOIN ".PLANETS." planet ON planet.id = acs.target 
		WHERE userID = ".$USER['id']." AND ".Config::get('max_fleets_per_acs')." > (SELECT COUNT(*) FROM ".FLEETS." WHERE fleet_group = acsID);");
		
		$ACSList	= array();
		
		while($ACSRow = $GLOBALS['DATABASE']->fetch_array($ACSResult)) {
			$ACSList[]	= $ACSRow;
		}
		
		$GLOBALS['DATABASE']->free_result($ACSResult);
		
		return $ACSList;
	}
	function checkTargetBis()
	{
		global $PLANET, $LNG, $UNI, $CONF, $USER, $resource;
		$TargetGalaxy 					= HTTP::_GP('galaxy', 0);
		$TargetSystem 					= HTTP::_GP('system', 0);
		$TargetPlanet					= HTTP::_GP('planet', 0);
		$TargetPlanettype 				= HTTP::_GP('planet_type', 1);
		
		$Data	= $GLOBALS['DATABASE']->getFirstRow("SELECT u.id, u.urlaubs_modus, u.user_lastip, u.authattack, p.destruyed, p.id_owner, p.der_metal, p.der_crystal, p.destruyed FROM ".USERS." as u, ".PLANETS." as p WHERE p.universe = ".$UNI." AND p.galaxy = ".$TargetGalaxy." AND p.system = ".$TargetSystem." AND p.planet = ".$TargetPlanet."  AND p.planet_type = '".(($TargetPlanettype == 2) ? 1 : $TargetPlanettype)."' AND u.id = p.id_owner;");
		if (isset($Data))
			{
				$this->sendJSON('OK');	
			}
			
			else
			{
				$this->sendJSON('OK');	
			}
	}
	
	
	function checkTarget()
	{
		global $PLANET, $LNG, $UNI, $CONF, $USER, $resource;
		$TargetGalaxy 					= HTTP::_GP('galaxy', 0);
		$TargetSystem 					= HTTP::_GP('system', 0);
		$TargetPlanet					= HTTP::_GP('planet', 0);
		$TargetPlanettype 				= HTTP::_GP('planet_type', 1);
		$missions 				= HTTP::_GP('mission', 1);
		$ActualFleets		= FleetFunctions::GetCurrentFleets($USER['id']);
		$ipCheck = $GLOBALS['DATABASE']->query("SELECT userID, secondID FROM uni1_ipblock WHERE userID = ".$USER['id']." OR secondID = '".$USER['id']."';");
		
		if($TargetGalaxy == $PLANET['galaxy'] && $TargetSystem == $PLANET['system'] && $TargetPlanet == $PLANET['planet'] && $TargetPlanettype == $PLANET['planet_type'])
		{
			$this->sendJSON('<span class=rouge>'.$LNG['fl_error_same_planet'].'</span>');
		}
		
		if ($TargetPlanet != Config::get('max_planets') + 1) {
			$Data	= $GLOBALS['DATABASE']->getFirstRow("SELECT u.id, u.urlaubs_modus, u.immunity_until, u.user_lastip, u.authattack, p.id_owner, p.destruyed, p.der_metal, p.der_crystal, p.destruyed FROM ".USERS." as u, ".PLANETS." as p WHERE p.universe = ".$UNI." AND p.galaxy = ".$TargetGalaxy." AND p.system = ".$TargetSystem." AND p.planet = ".$TargetPlanet."  AND p.planet_type = '".(($TargetPlanettype == 2) ? 1 : $TargetPlanettype)."' AND u.id = p.id_owner;");
			
			$BuddyCheck = $GLOBALS['DATABASE']->query("SELECT * FROM uni1_buddy WHERE (sender = '".$USER['id']."' AND owner = '".$Data['id_owner']."' AND state = '1') OR (owner = '".$USER['id']."' AND sender = '".$Data['id_owner']."' AND state = '1');");
			
			if ($missions == 1 || $missions == 6 || $missions == 3 || $missions == 14)
		{
			if($GLOBALS['DATABASE']->numRows($ipCheck) > 0 && isset($Data)){
			while($xb = $GLOBALS['DATABASE']->fetch_array($ipCheck)){
			if ($Data['id_owner'] == $xb['userID'] || $Data['id_owner'] == $xb['secondID']) {
				$this->sendJSON(sprintf($LNG['fleet_multi_block'], $this->getUsername($Data['id_owner'])));
			}
			}
			} 
			if($GLOBALS['DATABASE']->numRows($BuddyCheck) >= 1 && isset($Data)){
			$this->sendJSON(sprintf($LNG['fleet_pact'], $this->getUsername($Data['id_owner'])));
			} 
			
		}
		
		if ($missions == 3)
		{
			if($GLOBALS['DATABASE']->numRows($BuddyCheck) == 0 && isset($Data) && $USER['id'] != $Data['id_owner']){
			$this->sendJSON(sprintf($LNG['fleet_no_pact'], $this->getUsername($Data['id_owner'])));
			} 
		}
		
		if ($missions == 12 && $PLANET['diplomat'] < 5)
		{
			$this->sendJSON(sprintf($LNG['fleet_miss_diplo'], $LNG['tech'][305]));
		}
		if ($missions == 12 && $PLANET['soldier'] < 10)
		{
			$this->sendJSON(sprintf($LNG['fleet_miss_diplo'], $LNG['tech'][306]));
		}
	
			if (FleetFunctions::GetMaxFleetSlots($USER) <= $ActualFleets)
			{
			$this->sendJSON('<span class=rouge>'.$LNG['fl_no_slots'].'</span>');
			}
			
			elseif ($TargetPlanettype == 3 && !isset($Data))
			{
				$this->sendJSON('<span class=rouge>'.$LNG['fl_error_no_moon'].'</span>');
			}
			elseif ($TargetPlanettype != 2 && $Data['urlaubs_modus'] == 1)
			{
				$this->sendJSON('<span class=rouge>'.$LNG['fl_in_vacation_player'].'</span>');
			}
			elseif ($Data['id'] != $USER['id'] && Config::get('adm_attack') == 1 && $Data['authattack'] > $USER['authlevel'])
			{
				$this->sendJSON('<span class=rouge>'.$LNG['fl_admin_attack'].'</span>');
			}
			elseif ($Data['destruyed'] != 0)
			{
				$this->sendJSON('<span class=rouge>'.$LNG['fl_error_not_avalible'].'</span>');
			}
			elseif($TargetPlanettype == 2 && $Data['der_metal'] == 0 && $Data['der_crystal'] == 0)
			{
				$this->sendJSON('<span class=rouge>'.$LNG['fl_error_empty_derbis'].'</span>');
			}
			elseif(ENABLE_MULTIALERT && $USER['id'] != $Data['id'] && $USER['authlevel'] != AUTH_ADM && $USER['user_lastip'] == $Data['user_lastip'] && $GLOBALS['DATABASE']->getFirstCell("SELECT (SELECT COUNT(*) FROM ".MULTI." WHERE userID = ".$USER['id'].") + (SELECT COUNT(*) FROM ".MULTI." WHERE userID = ".$Data['id'].")") != 2)
			{
				$this->sendJSON('<span class=rouge>'.$LNG['fl_multi_alarm'].'</span>');
			}
		} else {
			if ($USER[$resource[124]] == 0)
			{
				$this->sendJSON('<span class=rouge>'.$LNG['fl_target_not_exists'].'</span>');
			}
			
			$activeExpedition	= FleetFunctions::GetCurrentFleets($USER['id'], 15);

			if ($activeExpedition >= FleetFunctions::getExpeditionLimit($USER))
			{
				$this->sendJSON('<span class=rouge>'.$LNG['fl_no_expedition_slot'].'</span>');
			}
		}
		$this->sendJSON('OK');	
	}
}