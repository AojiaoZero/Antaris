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
 * @info $Id: class.ShowFleetAjaxPage.php 2640 2013-03-23 19:23:26Z slaver7 $
 * @link http://2moons.cc/
 */

require_once('includes/classes/class.FleetFunctions.php');


class ShowFleetAjaxcPage extends AbstractPage
{
	public $returnData	= array();

    public static $requireModule = 0;

	function __construct() 
	{
		parent::__construct();
		$this->setWindow('ajax');
	}
	
	private function sendData($Code, $Message) {
		$this->returnData['code']	= $Code;
		$this->returnData['mess']	= $Message;
		$this->sendJSON($this->returnData);
	}
	
	public function show()
	{
		global $USER, $PLANET, $resource, $LNG, $CONF, $pricelist;
		
		$UserDeuterium  = $PLANET['elyrium'];
		
		$planetID 		= HTTP::_GP('planetID', 0);
		$targetMission	= HTTP::_GP('mission', 0);
		$galaxyC = HTTP::_GP('galaxyC', 0);
		$systemC = HTTP::_GP('systemC', 0);
		$planetC = HTTP::_GP('planetC', 0);
	
		
		if (IsVacationMode($USER)) {
			$this->sendData(620, $LNG['fa_vacation_mode_current']);
		}
		
		$fleetArray = array();

		switch($targetMission)
		{
			case 14:
				if(!isModulAvalible(MODULE_MISSION_SPY)) {
					$this->sendData('rouge', $LNG['sys_module_inactive']);
				}
				if($PLANET['teleport_portal'] == 0) {
					$this->sendData('rouge', $LNG['fleet_ajax_11']);	
				}
				$ships	= min($USER['spio_anz'], $PLANET[$resource[210]]);
				
				if(empty($ships)) {
					$this->sendData('rouge', $LNG['fleet_ajax_22']);
				}
				
				$fleetArray = array(210 => $ships);
				$this->returnData['ships'][210]	= $PLANET[$resource[210]] - $ships;
			break;
			
			case 7:
				if(!isModulAvalible(MODULE_MISSION_COLONY)) {
					$this->sendData('rouge', $LNG['sys_module_inactive']);
				}
				if($PLANET['teleport_portal'] == 0) {
					$this->sendData('rouge', $LNG['fleet_ajax_11']);	
				}
				if($PLANET[$resource[303]] < 10 || $PLANET[$resource[306]] < 100) {
					$this->sendData('rouge', sprintf($LNG['fleet_ajax_12'], $PLANET[$resource[303]],$PLANET[$resource[306]]));
					
				}
				
				$fleetArray		= array(303 => 10, 306 => 100);

				break;
			default:
				$this->sendData('rouge', $LNG['fleet_ajax_22']);
			break;
		}
		
		$fleetArray						= array_filter($fleetArray);
		
		if(empty($fleetArray)) {
			$this->sendData('rouge', $LNG['fleet_ajax_22']);
		}
		
		$iPlanetCount 	= $GLOBALS['DATABASE']->getFirstCell("SELECT COUNT(*) FROM ".PLANETS." WHERE `id_owner` = '". $USER['id'] ."' AND `planet_type` = '1' AND `destruyed` = '0';");
		$MaxPlanets		= PlayerUtil::maxPlanetCount($USER);
		
		if($iPlanetCount >= $MaxPlanets && $targetMission == 7)
		{
		$this->sendData('rouge', $LNG['fleet_ajax_14']);
		}	
		
		$targetData	= $GLOBALS['DATABASE']->getFirstRow("SELECT planet.id_owner as id_owner, 
										planet.id as id, 
										planet.name as name, 
										planet.galaxy as galaxy, 
										planet.system as system, 
										planet.planet as planet,
										planet.planet_type as planet_type, 
										planet.force_field_timer as force_field_timer, 
										planet.teleport_portal as teleport_portal, 
										total_points, onlinetime, forcefield_tech, urlaubs_modus, banaday, authattack, user_deleted, username
										FROM ".PLANETS." planet
										INNER JOIN ".USERS." user ON planet.id_owner = user.id
										LEFT JOIN ".STATPOINTS." as stat ON stat.id_owner = user.id AND stat.stat_type = '1' 
										WHERE planet.galaxy = ".$galaxyC." AND planet.system = ".$systemC." AND planet.planet = ".$planetC.";");
		$BuddyCheck = $GLOBALS['DATABASE']->query("SELECT * FROM uni1_buddy WHERE (sender = '".$USER['id']."' AND owner = '".$targetData['id_owner']."' AND state = '1') OR (owner = '".$USER['id']."' AND sender = '".$targetData['id_owner']."' AND state = '1');");
		
		if ($targetMission == 1 || $targetMission == 6 || $targetMission == 3 || $targetMission == 14 || $targetMission == 13)
		{
		$ipCheck = $GLOBALS['DATABASE']->query("SELECT userID, secondID FROM uni1_ipblock WHERE userID = ".$USER['id']." OR secondID = '".$USER['id']."';");
		if($GLOBALS['DATABASE']->numRows($ipCheck) > 0){
		while($xb = $GLOBALS['DATABASE']->fetch_array($ipCheck)){
		if ($targetData['id_owner'] == $xb['userID'] || $targetData['id_owner'] == $xb['secondID']) {
				$this->sendData('rouge', '<span class=rouge>'.sprintf($LNG['fleet_multi_block'], $this->getUsername($targetData['id_owner'])).'</span>');	
			}
		}
		}
		
		if($GLOBALS['DATABASE']->numRows($BuddyCheck) >= 1){
			$this->sendData('rouge', sprintf($LNG['fleet_pact'], $this->getUsername($targetData['id_owner'])));
			} 
		}
		if($targetMission == 14)
		{ 
	
			if($targetData['id_owner'] == $USER['id']){
			$this->sendData('rouge', $LNG['fleet_ajax_19']);	
			}
			
			if($targetData['force_field_timer'] > TIMESTAMP && $USER['virus_tech'] < $targetData['forcefield_tech']){
			$this->sendData('rouge', sprintf($LNG['fleet_ajax_21'], $this->getUsername($targetData['id_owner'])));	
			}
			
			if($targetData['teleport_portal'] == 0){
			$this->sendData('rouge', sprintf($LNG['fleet_ajax_18'], $targetData['name'], $targetData['system'], $targetData['planet']));	
			}

			if($targetData['user_deleted'] == 1){
			$this->sendData('rouge', sprintf($LNG['fleet_ajax_3'], $targetData['username']));	
			}

			if($targetData['banaday'] > TIMESTAMP){
			$this->sendData('rouge', sprintf($LNG['fleet_ajax_4'], $targetData['username']));	
			}
			
			if(Config::get('adm_attack') == 1 && $targetData['authattack'] > $USER['authlevel']) {
				$this->sendData('rouge', $LNG['fa_action_not_allowed']);
			}
			
			if (IsVacationMode($targetData)) {
				$this->sendData('rouge', sprintf($LNG['fleet_ajax_5'], $targetData['username']));
			}
			
			$IsNoobProtec	= CheckNoobProtec($USER, $targetData, $targetData);
			
			if ($IsNoobProtec['NoobPlayer']) {
				$this->sendData('rouge', sprintf($LNG['fleet_ajax_6'], $targetData['username']));
			}
			
			if ($IsNoobProtec['StrongPlayer']) {
				$this->sendData('rouge', sprintf($LNG['fleet_ajax_7'], $targetData['username']));
			}

			if ($USER['id'] == $targetData['id_owner']) {
				$this->sendData('rouge', $LNG['fleet_ajax_8']);
			}
		}
		
		if(connection_aborted())
			exit;
		
		$SpeedFactor    	= FleetFunctions::GetGameSpeedFactor();
		
		$Distance    		= FleetFunctions::GetTargetDistance(array($PLANET['galaxy'], $PLANET['system'], $PLANET['planet']), array($targetData['galaxy'], $targetData['system'], $targetData['planet']));
		
		$SpeedAllMin		= FleetFunctions::GetFleetMaxSpeed($fleetArray, $USER);
		$Duration			= 1;
		$consumption		= 0;	
		
		$fleetRessource	= array(
			901	=> 0,
			902	=> 0,
			903	=> 0,
			904	=> 0,
		);
		
		$fleetPopulation	= array(
			301	=> 0,
			302	=> 0,
			303	=> 0,
			304	=> 0,
			305	=> 0,
			306	=> 0,
			307	=> 0,
			309	=> 0,
		);
		
		if($targetMission == 7){
		$targetData	= array('id' => 0, 'id_owner' => 0, 'planettype' => 1);
		}
		$fleetStartTime		= $Duration + TIMESTAMP;
		$fleetStayTime		= $fleetStartTime;
		$fleetEndTime		= $fleetStayTime + 1;
		
		$shipID				= array_keys($fleetArray);
		
		if($targetMission == 7){
		FleetFunctions::sendFleet($fleetArray, $targetMission, $USER['id'], $PLANET['id'], $PLANET['galaxy'], $PLANET['system'], $PLANET['planet'], $PLANET['planet_type'],
		$targetData['id_owner'], 0, $galaxyC, $systemC, $planetC, 1, $fleetRessource, $fleetPopulation, $fleetStartTime, $fleetStayTime, $fleetEndTime);
		}else{
		FleetFunctions::sendFleet($fleetArray, $targetMission, $USER['id'], $PLANET['id'], $PLANET['galaxy'], $PLANET['system'], $PLANET['planet'], $PLANET['planet_type'],
		$targetData['id_owner'], $targetData['id'], $targetData['galaxy'], $targetData['system'], $targetData['planet'], $targetData['planet_type'], $fleetRessource, $fleetPopulation, $fleetStartTime, $fleetStayTime, $fleetEndTime);
		}
		if($targetMission == 7){
		$finalMsg = sprintf($LNG['fleet_ajax_10'], $systemC,$planetC);
		}else{
		$finalMsg = sprintf($LNG['fleet_ajax_17'], $targetData['name'], $targetData['system'],$targetData['planet'],$this->getUsername($targetData['id_owner']));
		}
		$this->sendData('vert', $finalMsg);
		
		}
	}