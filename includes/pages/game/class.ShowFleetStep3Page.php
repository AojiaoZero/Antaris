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
 * @info $Id: class.ShowFleetStep3Page.php 2640 2013-03-23 19:23:26Z slaver7 $
 * @link http://2moons.cc/
 */

require_once('includes/classes/class.FleetFunctions.php');

class ShowFleetStep3Page extends AbstractPage
{
	public static $requireModule = MODULE_FLEET_TABLE;

	function __construct() 
	{
		parent::__construct();
	}
	
	public function show()
	{
		global $USER, $PLANET, $resource, $pricelist, $reslist, $CONF, $LNG, $UNI;
			
		if (IsVacationMode($USER)) {
			FleetFunctions::GotoFleetPage(0);
		}
		
		$targetMission 			= HTTP::_GP('mission', 3);
		$TransportMetal			= max(0, round(HTTP::_GP('metal', 0.0)));
		$TransportCrystal		= max(0, round(HTTP::_GP('crystal', 0.0)));
		$TransportDeuterium		= max(0, round(HTTP::_GP('deuterium', 0.0)));
		$TransportElyrium		= max(0, round(HTTP::_GP('elyrium', 0.0)));
		$TransportPopulation301		= max(0, round(HTTP::_GP('population301', 0.0)));
		$TransportPopulation302		= max(0, round(HTTP::_GP('population302', 0.0)));
		$TransportPopulation303		= max(0, round(HTTP::_GP('population303', 0.0)));
		$TransportPopulation304		= max(0, round(HTTP::_GP('population304', 0.0)));
		$TransportPopulation305		= max(0, round(HTTP::_GP('population305', 0.0)));
		$TransportPopulation306		= max(0, round(HTTP::_GP('population306', 0.0)));
		$TransportPopulation307		= max(0, round(HTTP::_GP('population307', 0.0)));
		$TransportPopulation309		= max(0, round(HTTP::_GP('population309', 0.0)));
		$stayTime 				= HTTP::_GP('staytime', 0);
		$speed 				= HTTP::_GP('speed', 10);
		$token					= HTTP::_GP('tokens', '');

		if (!isset($_SESSION['fleet'][$token])) {
			FleetFunctions::GotoFleetPage(1);
		}
			
		if ($_SESSION['fleet'][$token]['time'] < TIMESTAMP - 600) {
			unset($_SESSION['fleet'][$token]);
			FleetFunctions::GotoFleetPage(0);
		}
		
		$maxFleetSpeed	= $_SESSION['fleet'][$token]['speed'];
		$distance		= $_SESSION['fleet'][$token]['distance'];
		$targetGalaxy	= $_SESSION['fleet'][$token]['targetGalaxy'];
		$targetSystem	= $_SESSION['fleet'][$token]['targetSystem'];
		$targetPlanet	= $_SESSION['fleet'][$token]['targetPlanet'];
		$targetType		= $_SESSION['fleet'][$token]['targetType'];
		$fleetGroup		= $_SESSION['fleet'][$token]['fleetGroup'];
		$fleetArray  	= $_SESSION['fleet'][$token]['fleet'];
		$fleetStorage	= $_SESSION['fleet'][$token]['fleetRoom'];
		$fleetSpeed		= $speed;
		unset($_SESSION['fleet'][$token]);
		
		if($targetMission != 2)
		{
			$fleetGroup	= 0;
		}
			
		if ($PLANET['galaxy'] == $targetGalaxy && $PLANET['system'] == $targetSystem && $PLANET['planet'] == $targetPlanet && $PLANET['planet_type'] == $targetType)
		{
			$this->printMessage('<span class="rouge">'.$LNG['fl_error_same_planet'].'</span>');
		}

		if ($targetGalaxy < 1 || $targetGalaxy > Config::get('max_galaxy') || 
			$targetSystem < 1 || $targetSystem > Config::get('max_system') || 
			$targetPlanet < 1 || $targetPlanet > (Config::get('max_planets') + 1) ||
			($targetType !== 1 && $targetType !== 2 && $targetType !== 3)) {
			$this->printMessage('<span class="rouge">'.$LNG['fl_invalid_target'].'</span>');
		}

		if ($targetMission == 3 && $TransportMetal + $TransportCrystal + $TransportDeuterium + $TransportElyrium < 1)
		{
			$this->printMessage('<span class="rouge">'.$LNG['fl_no_noresource'].'</span>');
		}
		
		$ActualFleets		= FleetFunctions::GetCurrentFleets($USER['id']);
		
		if (FleetFunctions::GetMaxFleetSlots($USER) <= $ActualFleets)
		{
			$this->printMessage('<span class="rouge">'.$LNG['fl_no_slots'].'</span>');
		}
		
		$ACSTime = 0;
		
		if(!empty($fleetGroup))
		{
			$ACSTime = $GLOBALS['DATABASE']->getFirstCell("SELECT ankunft
			FROM ".USERS_ACS." 
			INNER JOIN ".AKS." ON id = acsID
			WHERE acsID = ".$fleetGroup."
			AND ".Config::get('max_fleets_per_acs')." > (SELECT COUNT(*) FROM ".FLEETS." WHERE fleet_group = ".$fleetGroup.");");
			
			if (empty($ACSTime)) {
				$fleetGroup	= 0;
				$targetMission	= 1;
			}
		}
				
		$ActualFleets 		= FleetFunctions::GetCurrentFleets($USER['id']);
		
		$targetPlanetData  	= $GLOBALS['DATABASE']->getFirstRow("SELECT id, id_owner, der_metal, der_crystal, destruyed, ally_deposit FROM ".PLANETS." WHERE universe = ".$UNI." AND galaxy = ".$targetGalaxy." AND system = ".$targetSystem." AND planet = ".$targetPlanet." AND planet_type = '".($targetType == 2 ? 1 : $targetType)."';");
		
		if ($targetMission == 1 || $targetMission == 6 || $targetMission == 3 || $targetMission == 14)
		{
		$ipCheck = $GLOBALS['DATABASE']->query("SELECT userID, secondID FROM uni1_ipblock WHERE userID = ".$USER['id']." OR secondID = '".$USER['id']."';");
		if($GLOBALS['DATABASE']->numRows($ipCheck) > 0){
		while($xb = $GLOBALS['DATABASE']->fetch_array($ipCheck)){
		if ($targetPlanetData['id_owner'] == $xb['userID'] || $targetPlanetData['id_owner'] == $xb['secondID']) {
				$this->printMessage(sprintf($LNG['fleet_multi_block'], $this->getUsername($targetPlanetData['id_owner'])));
			}
		}
		}
		}
		if ($targetMission == 7)
		{
			if (isset($targetPlanetData)) {
				$this->printMessage('<span class="rouge">'.$LNG['fl_target_exists'].'</span>');
			}
			
			if ($targetType != 1) {
				$this->printMessage('<span class="rouge">'.$LNG['fl_only_planets_colonizable'].'</span>');
			}
		}
		
		if ($targetMission == 7 || $targetMission == 15) {
			$targetPlanetData	= array('id' => 0, 'id_owner' => 0, 'planettype' => 1);
		}
		else {
			if ($targetPlanetData["destruyed"] != 0) {
				$this->printMessage('<span class="rouge">'.$LNG['fl_no_target'].'</span>');
			}
				
			if (!isset($targetPlanetData)) {
				$this->printMessage('<span class="rouge">'.$LNG['fl_no_target'].'</span>');
			}
		}
		
		foreach ($fleetArray as $Ship => $Count)
		{
			if ($Count > $PLANET[$resource[$Ship]]) {
				$this->printMessage('<span class="rouge">'.$LNG['fl_not_all_ship_avalible'].'</span>');
			}
		}
		
		if ($targetMission == 11)
		{
			$activeExpedition	= FleetFunctions::GetCurrentFleets($USER['id'], 11);
			$maxExpedition		= FleetFunctions::getDMMissionLimit($USER);

			if ($activeExpedition >= $maxExpedition) {
				$this->printMessage('<span class="rouge">'.$LNG['fl_no_expedition_slot'].'</span>');
			}
		}
		elseif ($targetMission == 15)
		{		
			$activeExpedition	= FleetFunctions::GetCurrentFleets($USER['id'], 15);
			$maxExpedition		= FleetFunctions::getExpeditionLimit($USER);
			
			if ($activeExpedition >= $maxExpedition) {
				$this->printMessage('<span class="rouge">'.$LNG['fl_no_expedition_slot'].'</span>');
			}
		}

		$usedPlanet	= isset($targetPlanetData['id_owner']);
		$myPlanet	= $usedPlanet && $targetPlanetData['id_owner'] == $USER['id'];
		
		if($targetMission == 7 || $targetMission == 15) {
			$targetPlayerData	= array(
				'id'				=> 0,
				'onlinetime'		=> TIMESTAMP,
				'ally_id'			=> 0,
				'urlaubs_modus'		=> 0,
				'authattack'		=> 0,
				'total_points'		=> 0,
			);
		} elseif($myPlanet) {
			$targetPlayerData	= $USER;
		} elseif(!empty($targetPlanetData['id_owner'])) {
			$targetPlayerData	= $GLOBALS['DATABASE']->getFirstRow("SELECT 
			user.id, user.onlinetime, user.ally_id, user.urlaubs_modus, user.banaday, user.authattack, 
			stat.total_points
			FROM ".USERS." as user 
			LEFT JOIN ".STATPOINTS." as stat ON stat.id_owner = user.id AND stat.stat_type = '1' 
			WHERE user.id = ".$targetPlanetData['id_owner'].";");
		} else {
			$this->printMessage('<span class="rouge">'.$LNG['fl_empty_target'].'</span>');
		}
		
		$MisInfo		     	= array();		
		$MisInfo['galaxy']     	= $targetGalaxy;		
		$MisInfo['system'] 	  	= $targetSystem;	
		$MisInfo['planet'] 	  	= $targetPlanet;		
		$MisInfo['planettype'] 	= $targetType;	
		$MisInfo['IsAKS']		= $fleetGroup;
		$MisInfo['Ship'] 		= $fleetArray;		
		
		$avalibleMissions		= FleetFunctions::GetFleetMissions($USER, $MisInfo, $targetPlanetData);
		
		if (!in_array($targetMission, $avalibleMissions['MissionSelector'])) {
			$this->printMessage('<span class="rouge">'.$LNG['fl_invalid_mission'].'</span>');
		}
		
		if ($targetMission != 8 && IsVacationMode($targetPlayerData)) {
			$this->printMessage('<span class="rouge">'.$LNG['fl_target_exists'].'</span>');
		}
		
		if($targetMission == 1 || $targetMission == 2 || $targetMission == 9) {
			if(FleetFunctions::CheckBash($targetPlanetData['id'])) {
				$this->printMessage('<span class="rouge">'.$LNG['fl_bash_protection'].'</span>');
			}
		}
		
		if($targetMission == 1 || $targetMission == 2 || $targetMission == 5 || $targetMission == 6 || $targetMission == 9) {
			if(Config::get('adm_attack') == 1 && $targetPlayerData['authattack'] > $USER['authlevel']) {
				$this->printMessage('<span class="rouge">'.$LNG['fl_admin_attack'].'</span>');
			}
		
			$IsNoobProtec	= CheckNoobProtec($USER, $targetPlayerData, $targetPlayerData);
			
			if ($IsNoobProtec['NoobPlayer']) {
				$this->printMessage('<span class="rouge">'.$LNG['fl_player_is_noob'].'</span>');
			}
			
			if ($IsNoobProtec['StrongPlayer']) {
				$this->printMessage('<span class="rouge">'.$LNG['fl_player_is_strong'].'</span>');
			}
		}

		if ($targetMission == 5)
		{	
			if($targetPlayerData['ally_id'] != $USER['ally_id']) {
				$buddy	= $GLOBALS['DATABASE']->getFirstCell("
				SELECT COUNT(*) FROM ".BUDDY." 
				WHERE id NOT IN (SELECT id FROM ".BUDDY_REQUEST." WHERE ".BUDDY_REQUEST.".id = ".BUDDY.".id) AND 
				(owner = ".$targetPlayerData['id']." AND sender = ".$USER['id'].") OR
				(owner = ".$USER['id']." AND sender = ".$targetPlayerData['id'].");");
				
				if($buddy == 0) {
					$this->printMessage('<span class="rouge">'.$LNG['fl_no_same_alliance'].'</span>');
				}
			}
		}

		$fleetMaxSpeed 	= FleetFunctions::GetFleetMaxSpeed($fleetArray, $USER);
		$SpeedFactor    = FleetFunctions::GetGameSpeedFactor();
		$duration      	= FleetFunctions::GetMissionDuration($fleetSpeed, $fleetMaxSpeed, $distance, $SpeedFactor, $USER);
		$consumption   	= FleetFunctions::GetFleetConsumption($fleetArray, $duration, $distance, $fleetMaxSpeed, $USER, $SpeedFactor);
	
		if ($PLANET[$resource[904]] < $consumption) {
			$this->printMessage('<span class="rouge">Not enough elyrium</span>');
		}
		
		$StayDuration    = 0;
		
		if($targetMission == 5 || $targetMission == 11 || $targetMission == 15)
		{
			if(!isset($avalibleMissions['StayBlock'][$stayTime])) {
				$this->printMessage('<span class="rouge">'.$LNG['fl_hold_time_not_exists'].'</span>');
			}
			
			$StayDuration    = round($avalibleMissions['StayBlock'][$stayTime] * 3600, 0);
		}
		
		$fleetStorage		-= $consumption;
		
		$fleetRessource	= array(
			901	=> min($TransportMetal, floor($PLANET[$resource[901]])),
			902	=> min($TransportCrystal, floor($PLANET[$resource[902]])),
			903	=> min($TransportDeuterium, floor($PLANET[$resource[903]])),
			904	=> min($TransportElyrium, floor($PLANET[$resource[904]] - $consumption)),
		);
		$Diplo = 0;
		$Soldi = 0;
		if($targetMission == 12){
		$Diplo = 5;
		$Soldi = 10;
		}
		$fleetPopulation	= array(
			301	=> min($TransportPopulation301, floor($PLANET[$resource[301]])),
			302	=> min($TransportPopulation302, floor($PLANET[$resource[302]])),
			303	=> min($TransportPopulation303, floor($PLANET[$resource[303]])),
			304	=> min($TransportPopulation304, floor($PLANET[$resource[304]])),
			305	=> min($TransportPopulation305 + $Diplo, floor($PLANET[$resource[305]])),
			306	=> min($TransportPopulation306 + $Soldi, floor($PLANET[$resource[306]])),
			307	=> min($TransportPopulation307, floor($PLANET[$resource[307]])),
			309	=> min($TransportPopulation309, floor($PLANET[$resource[309]])),
			
		);
		
		$StorageNeeded		= array_sum($fleetRessource);
		
		if ($StorageNeeded > $fleetStorage) {
			$this->printMessage('<span class="rouge">'.$LNG['fl_not_enough_space'].'</span>');
		}
		
		$PLANET[$resource[901]]	-= $fleetRessource[901];
		$PLANET[$resource[902]]	-= $fleetRessource[902];
		$PLANET[$resource[903]]	-= $fleetRessource[903];
		$PLANET[$resource[904]]	-= $fleetRessource[904] + $consumption;
		
		$PLANET[$resource[301]]	-= $fleetPopulation[301];
		$PLANET[$resource[302]]	-= $fleetPopulation[302];
		$PLANET[$resource[303]]	-= $fleetPopulation[303];
		$PLANET[$resource[304]]	-= $fleetPopulation[304];
		$PLANET[$resource[305]]	-= $fleetPopulation[305];
		$PLANET[$resource[306]]	-= $fleetPopulation[306];
		$PLANET[$resource[307]]	-= $fleetPopulation[307];
		$PLANET[$resource[309]]	-= $fleetPopulation[309];

		if(connection_aborted())
			exit;
		
		$fleetStartTime		= $duration + TIMESTAMP;
		$timeDifference		= round(max(0, $fleetStartTime - $ACSTime));
		
		if($fleetGroup != 0)
		{
			if($timeDifference != 0)
			{
				FleetFunctions::setACSTime($timeDifference, $fleetGroup);
			}
			else
			{
				$fleetStartTime		= $ACSTime;
			}
		}
		
		$fleetStayTime		= $fleetStartTime + $StayDuration;
		$fleetEndTime		= $fleetStayTime + $duration;
		
		FleetFunctions::sendFleet($fleetArray, $targetMission, $USER['id'], $PLANET['id'], $PLANET['galaxy'], $PLANET['system'], $PLANET['planet'], $PLANET['planet_type'], $targetPlanetData['id_owner'], $targetPlanetData['id'], $targetGalaxy, $targetSystem, $targetPlanet, $targetType, $fleetRessource, $fleetPopulation, $fleetStartTime, $fleetStayTime, $fleetEndTime, $fleetGroup);
		
		foreach ($fleetArray as $Ship => $Count)
		{
			$fleetList[$LNG['tech'][$Ship]]	= $Count;
		}
	
		$this->tplObj->loadscript('flotten.js');
		$this->tplObj->gotoside('game.php?page=fleetTable');
		$this->tplObj->assign_vars(array(
			'targetMission'		=> $targetMission,
			'distance'			=> $distance,
			'consumption'		=> $consumption,
			'from'				=> $PLANET['galaxy'] .":". $PLANET['system']. ":". $PLANET['planet'],
			'destination'		=> $targetGalaxy .":". $targetSystem .":". $targetPlanet,
			'fleetStartTime'	=> _date($LNG['php_tdformat'], $fleetStartTime, $USER['timezone']),
			'fleetEndTime'		=> _date($LNG['php_tdformat'], $fleetEndTime, $USER['timezone']),
			'MaxFleetSpeed'		=> $fleetMaxSpeed,
			'FleetList'			=> $fleetArray,
			'arraysum'			=> array_sum($fleetArray),
		));
		
		$this->display('page.fleetStep3.default.tpl');
	}
}