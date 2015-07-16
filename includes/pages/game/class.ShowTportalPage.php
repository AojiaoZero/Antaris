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
 * @info $Id: class.ShowResourcesPage.php 2632 2013-03-18 19:05:14Z slaver7 $
 * @link http://2moons.cc/
 */
require_once('includes/classes/class.FleetFunctions.php');
class ShowTportalPage extends AbstractPage
{
	public static $requireModule = MODULE_RESSOURCE_LIST;
	function __construct() 
	{
		parent::__construct();
		
	}

	
	function missionSend(){
	global $LNG, $ProdGrid, $resource, $reslist, $CONF, $pricelist, $USER, $PLANET;
		
	$mission				= HTTP::_GP('target_mission', 0);	
	$population202				= HTTP::_GP('population203', 0);	
	$population203				= HTTP::_GP('population203', 0);	
	$population204				= HTTP::_GP('population204', 0);	
	$population205				= HTTP::_GP('population205', 0);	
	$population206				= HTTP::_GP('population206', 0);	
	$population207				= HTTP::_GP('population207', 0);	
	$population211				= HTTP::_GP('population211', 0);	
	$population214				= HTTP::_GP('population214', 0);	
	$population215				= HTTP::_GP('population215', 0);	
	$population216				= HTTP::_GP('population216', 0);	
	$population209				= HTTP::_GP('population209', 0);	
	$population223				= HTTP::_GP('population223', 0);	
	$population219				= HTTP::_GP('population219', 0);	
	$population210				= HTTP::_GP('population210', 0);	
	$population224				= HTTP::_GP('population224', 0);	
	$population301				= HTTP::_GP('population301', 0);	
	$population302				= HTTP::_GP('population302', 0);	
	$population303				= HTTP::_GP('population303', 0);	
	$population304				= HTTP::_GP('population304', 0);	
	$population305				= HTTP::_GP('population305', 0);	
	$population306				= HTTP::_GP('population306', 0);	
	$population307				= HTTP::_GP('population307', 0);	
	$system				= HTTP::_GP('system', 0);	
	$planet				= HTTP::_GP('planet', 0);	
	$fleetArray = array();
	switch($mission)
		{
			case 17:
				$ship202 = min($population202, $PLANET[$resource[202]]);
				$ship203 = min($population203, $PLANET[$resource[203]]);
				$ship204 = min($population204, $PLANET[$resource[204]]);
				$ship205 = min($population205, $PLANET[$resource[205]]);
				$ship206 = min($population206, $PLANET[$resource[206]]);
				$ship207 = min($population207, $PLANET[$resource[207]]);
				$ship211 = min($population211, $PLANET[$resource[211]]);
				$ship214 = min($population214, $PLANET[$resource[214]]);
				$ship215 = min($population215, $PLANET[$resource[215]]);
				$ship216 = min($population216, $PLANET[$resource[216]]);
				$ship209 = min($population209, $PLANET[$resource[209]]);
				$ship223 = min($population223, $PLANET[$resource[223]]);
				$ship219 = min($population219, $PLANET[$resource[219]]);
				$ship210 = min($population210, $PLANET[$resource[210]]);
				$ship224 = min($population224, $PLANET[$resource[224]]);
				
				$fleetArray = array(202 => $ship202, 203 => $ship203, 204 => $ship204, 205 => $ship205, 206 => $ship206, 207 => $ship207, 211 => $ship211, 214 => $ship214, 215 => $ship215, 216 => $ship216, 209 => $ship209, 223 => $ship223, 219 => $ship219, 210 => $ship210, 224 => $ship224);
				

				break;
				case 14:
				$fleetArray = array(210 => 1);
				

				break;
		}
		$fleetArray						= array_filter($fleetArray);
		if(empty($fleetArray)) {
			$this->printMessage('<span class="rouge">NO ARRAY</span>');
		}
		$targetData	= $GLOBALS['DATABASE']->getFirstRow("SELECT planet.id_owner as id_owner, 
										planet.id as id, 
										planet.name as name, 
										planet.galaxy as galaxy, 
										planet.system as system, 
										planet.planet as planet,
										planet.planet_type as planet_type, 
										planet.teleport_portal as teleport_portal, 
										planet.force_field_timer as force_field_timer, 
										total_points, onlinetime, urlaubs_modus, banaday, forcefield_tech, authattack, user_deleted, username
										FROM ".PLANETS." planet
										INNER JOIN ".USERS." user ON planet.id_owner = user.id
										LEFT JOIN ".STATPOINTS." as stat ON stat.id_owner = user.id AND stat.stat_type = '1' 
										WHERE planet.galaxy = '1' AND planet.system = ".$system." AND planet.planet = ".$planet.";");
									
		$galaxy = 1;
		$SpeedFactor    	= FleetFunctions::GetGameSpeedFactor();
		$Distance    		= FleetFunctions::GetTargetDistance(array($PLANET['galaxy'], $PLANET['system'], $PLANET['planet']), array($galaxy, $system, $planet));
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
			301	=> $population301,
			302	=> $population302,
			303	=> $population303,
			304	=> $population304,
			305	=> $population305,
			306	=> $population306,
			307	=> $population307,
			309	=> 0,
		);
		
		$PLANET[$resource[901]]	-= $fleetRessource[901];
		$PLANET[$resource[902]]	-= $fleetRessource[902];
		$PLANET[$resource[903]]	-= $fleetRessource[903];
		$PLANET[$resource[904]]	-= $fleetRessource[904];
		
		$PLANET[$resource[301]]	-= $fleetPopulation[301];
		$PLANET[$resource[302]]	-= $fleetPopulation[302];
		$PLANET[$resource[303]]	-= $fleetPopulation[303];
		$PLANET[$resource[304]]	-= $fleetPopulation[304];
		$PLANET[$resource[305]]	-= $fleetPopulation[305];
		$PLANET[$resource[306]]	-= $fleetPopulation[306];
		$PLANET[$resource[307]]	-= $fleetPopulation[307];
		$PLANET[$resource[309]]	-= $fleetPopulation[309];
		
		$fleetStartTime		= $Duration + TIMESTAMP;
		$fleetStayTime		= $fleetStartTime;
		$fleetEndTime		= $fleetStayTime + 1;
		
		$shipID				= array_keys($fleetArray);
		
		FleetFunctions::sendFleet($fleetArray, $mission, $USER['id'], $PLANET['id'], $PLANET['galaxy'], $PLANET['system'], $PLANET['planet'], $PLANET['planet_type'],$targetData['id_owner'], $targetData['id'], $targetData['galaxy'], $targetData['system'], $targetData['planet'], $targetData['planet_type'], $fleetRessource, $fleetPopulation, $fleetStartTime, $fleetStayTime, $fleetEndTime);
		
		$this->printMessage('<span class="vert">OK</span>');
	
	$this->tplObj->assign_vars(array(
			
	));
		
	
	}
	
	function mission(){
	global $LNG, $ProdGrid, $resource, $reslist, $CONF, $pricelist, $USER, $PLANET;
		
		if($PLANET['teleport_portal'] == 0){
		$this->printMessage('<span class="rouge">notok</span>');
		}
		$PlanetCount					= $GLOBALS['DATABASE']->getFirstCell("SELECT COUNT(*) FROM ".PLANETS." WHERE id != ".$PLANET['id']." AND id_owner = ".$USER['id']." AND destruyed = 0;");
		
		$targetGalaxy 			= HTTP::_GP('galaxy', '');
		$targetSystem 			= HTTP::_GP('system', '');
		$targetPlanet			= HTTP::_GP('planet', '');
		$targetType 			= HTTP::_GP('type', (int) $PLANET['planet_type']);
		
		$mission				= HTTP::_GP('missionID', 0);
		if($mission == 0){
		$this->printMessage('<span class="rouge">notok</span>');
		}
		$missionText = '';
		$missionDesc = '';
		
		if($mission != 0){
		$missionText = $LNG['type_missionbis'][$mission];
		}	
		if($mission != 0){
		$missionDesc = $LNG['type_missionDesc'][$mission];
		}		
		$colonyList 	= $this->GetColonyList();
		$PopulationOnPlanet	= array();
		$avaible_pop = array(301,302,303,304,305,306,307);
		foreach($avaible_pop as $populationID)
		{
			
				
			$PopulationOnPlanet[]	= array(
				'id'	=> $populationID,
				'count'	=> $PLANET[$resource[$populationID]],
			);
		}
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
		$this->tplObj->loadscript('portal.js');
		$this->tplObj->assign_vars(array(
			'metal'		=> pretty_number($PLANET['metal']),
			'crystal'		=> pretty_number($PLANET['crystal']),
			'deuterium'		=> pretty_number($PLANET['deuterium']),
			'elyrium'		=> pretty_number($PLANET['elyrium']),
			'missionText'		=> $missionText,
			'missionDesc'		=> $missionDesc,
			'mission'		=> $mission,
			'colonyList' 	=> $colonyList,
			'PopulationOnPlanet' => $PopulationOnPlanet,
			'FleetsOnPlanet' => $FleetsOnPlanet,
			'galaxy' 		=> $targetGalaxy,
			'system' 		=> $targetSystem,
			'planet' 		=> $targetPlanet,
			'PlanetCount' 		=> $PlanetCount,
			'type'			=> $targetType,
			'speedSelect'	=> FleetFunctions::$allowedSpeed,
			//'typeSelect'   	=> array(1 => $LNG['type_planet'][1], 2 => $LNG['type_planet'][2], 3 => $LNG['type_planet'][3]),
			'typeSelect'   	=> array(1 => $LNG['type_planet'][1], 2 => $LNG['type_planet'][2]),
		));
		
	$this->display('page.tportal.mission_'.$mission.'.tpl');
	}
	
	function show(){
	global $LNG, $ProdGrid, $resource, $reslist, $CONF, $pricelist, $USER, $PLANET;
		
	$havePortal = 0;
	if($USER['energy_tech'] >=6 && $USER['control_room_tech'] >=5 && $USER['particle_tech'] >=4){
	$havePortal = 1;
	}
	
	$showMessage =0;
	if($PLANET['teleport_portal'] == 0 && $USER['energy_tech'] >=6 && $USER['control_room_tech'] >=5 && $USER['particle_tech'] >=4){
	$showMessage = 1;
	}elseif($PLANET['teleport_portal'] == 1 && $PLANET['force_field_timer'] < TIMESTAMP){
	$showMessage = 2;
	}elseif($PLANET['teleport_portal'] == 1 && $PLANET['force_field_timer'] > TIMESTAMP){
	$showMessage = 3;
	}
	
		
	$this->tplObj->assign_vars(array(	
	'energy_tech' => $USER['energy_tech'],                                  
	'control_room_tech' => $USER['control_room_tech'],                                  
	'tpanels' => $PLANET['teleport_portal'],                                  
	'particul_tech' => $USER['particle_tech'],
	'havePortal' => $havePortal,
	'showMessage' => $showMessage,
	));
	$this->display('page.tportal.default.tpl');
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
			
			if ($missions == 1 || $missions == 6 || $missions == 3 || $missions == 14 )
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
		
		if ($missions == 3 || $missions == 14)
		{
			if($GLOBALS['DATABASE']->numRows($BuddyCheck) == 0 && isset($Data) ){
			$this->sendJSON(sprintf($LNG['fleet_no_pact'], $this->getUsername($Data['id_owner'])));
			} 
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

	