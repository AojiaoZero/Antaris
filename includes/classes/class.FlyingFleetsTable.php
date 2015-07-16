<?php

/**
 *  2Moons
 *  Copyright (C) 2012 Jan Kr?pke
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
 * @author Jan Kr?pke <info@2moons.cc>
 * @copyright 2012 Jan Kr?pke <info@2moons.cc>
 * @license http://www.gnu.org/licenses/gpl.html GNU GPLv3 License
 * @version 1.5 (2011-07-31)
 * @info $Id: class.FlyingFleetsTable.php 2600 2013-01-16 20:24:45Z slaver7 $
 * @link http://2moons.cc/
 */

class FlyingFleetsTable
{
	protected $Mode = null;
	protected $UserID	= null;
	protected $PlanetID = null;
	protected $IsPhalanx = false;
	protected $missions = false;
	
	function __construct() {
		
	}
	
	function setUser($UserID) {
		$this->UserID = $UserID;
	}
	
	function setPlanet($PlanetID) {
		$this->PlanetID = $PlanetID;
	}
	
	function setPhalanxMode() {
		$this->IsPhalanx = true;
	}
	
	function setMissions($missions) {
		$this->missions = $missions;
	}
	
	function getFleets($acsID = false) {
		global $USER, $resource;
		
		if($this->IsPhalanx) {
			$SQLWhere	= "(fleet_start_id = ".$this->PlanetID." AND fleet_mission != 4) OR (fleet_end_id = ".$this->PlanetID." AND fleet_mess IN (0, 2))";
		} elseif(!empty($acsID)) {
			$SQLWhere	= "fleet_group = ".$acsID;
		} elseif($this->missions) {
			$SQLWhere	= "(fleet_owner = ". $this->UserID ." OR fleet_target_owner = ". $this->UserID .") AND fleet_mission IN (". $this->missions .")";
		} else {
			$SQLWhere	= "fleet_owner = ".$this->UserID." OR (fleet_target_owner = ".$this->UserID." AND fleet_mission != 8)";
		}

		return $GLOBALS['DATABASE']->query("SELECT DISTINCT fleet.*, ownuser.username as own_username, targetuser.username as target_username, ownplanet.name as own_planetname, targetplanet.name as target_planetname 
		FROM ".FLEETS." fleet
		LEFT JOIN ".USERS." ownuser ON (ownuser.id = fleet.fleet_owner)
		LEFT JOIN ".USERS." targetuser ON (targetuser.id = fleet.fleet_target_owner)
		LEFT JOIN ".PLANETS." ownplanet ON (ownplanet.id = fleet.fleet_start_id)
		LEFT JOIN ".PLANETS." targetplanet ON (targetplanet.id = fleet.fleet_end_id)
		WHERE ".$SQLWhere.";");
	}
	
	function renderTable()
	{
		$fleetResult	= $this->getFleets();
		$ACSDone		= array();
		$FleetData		= array();
		
		while($fleetRow = $GLOBALS['DATABASE']->fetch_array($fleetResult)) 
		{
			 if ($fleetRow['fleet_mess'] == 0 && $fleetRow['fleet_start_time'] > TIMESTAMP && ($fleetRow['fleet_group'] == 0 || !isset($ACSDone[$fleetRow['fleet_group']])))
			{
				$ACSDone[$fleetRow['fleet_group']]		= true;
				$FleetData[$fleetRow['fleet_start_time'].$fleetRow['fleet_id']] = $this->BuildFleetEventTable($fleetRow, 0);
			}elseif ($fleetRow['fleet_end_time'] > TIMESTAMP){
				$FleetData[$fleetRow['fleet_end_time'].$fleetRow['fleet_id']] = $this->BuildFleetEventTable($fleetRow, 1); 
			}
			if ($fleetRow['fleet_mission'] == 10 || ($fleetRow['fleet_mission'] == 4 && $fleetRow['fleet_mess'] == 0))
				continue;
				
			if ($fleetRow['fleet_end_stay'] != $fleetRow['fleet_start_time'] && $fleetRow['fleet_end_stay'] > TIMESTAMP && ($this->IsPhalanx && $fleetRow['fleet_end_id'] == $this->PlanetID))
				$FleetData[$fleetRow['fleet_end_stay'].$fleetRow['fleet_id']] = $this->BuildFleetEventTable($fleetRow, 2);
		
			if ($fleetRow['fleet_owner'] != $this->UserID)
				continue;
		
			
		}
		
		ksort($FleetData);
		$GLOBALS['DATABASE']->free_result($fleetResult);
		return $FleetData;
	}
	
	function BuildFleetEventTable($fleetRow, $FleetState) 
	{
				
		if ($FleetState == 0 && !$this->IsPhalanx && $fleetRow['fleet_group'] != 0)
		{
			$acsResult		= $this->getFleets($fleetRow['fleet_group']);
			$EventString	= '';
			while($acsRow = $GLOBALS['DATABASE']->fetch_array($acsResult))
			{
				$Return			= $this->getEventData($acsRow, $FleetState);
					
				$Rest			= $Return[0];
				$EventString    .= $Return[1].'<br><br>';
				$Time			= $Return[2];
				$Rest1			= $Return[3];
				$Rest2			= $Return[4];
				$Rest3			= $Return[5];
				$Rest4			= $Return[6];
				$Rest5			= $Return[7];
				$Rest6			= $Return[8];
				$Rest7			= $Return[9];
				$Rest8			= $Return[10];
				$Rest9			= $Return[11];
				$Rest10			= $Return[12];
				$Rest11			= $Return[13];
				$Rest12			= $Return[14];
				$Rest13			= $Return[15];
				$Rest14			= $Return[16];
				$Rest15			= $Return[17];
				$Rest16			= $Return[18];
			}
			$GLOBALS['DATABASE']->free_result($acsResult);
			$EventString	= substr($EventString, 0, -8);
		}
		else
		{
			list($Rest, $EventString, $Time, $Rest1, $Rest2, $Rest3, $Rest4, $Rest5, $Rest6, $Rest7, $Rest8, $Rest9, $Rest10, $Rest11, $Rest12, $Rest13, $Rest14, $Rest15, $Rest16) = $this->getEventData($fleetRow, $FleetState);
		}
		
		return array(
			'text'			=> $EventString,
			'returntime'	=> $Time,
			'resttime'		=> $Rest,
			'mission'		=> $Rest1,
			'fleetOwner'		=> $Rest2,
			'fleetID'		=> $Rest3,
			'fleetAmount'		=> $Rest4,
			'fleetMission'		=> $Rest5,
			'fleetStart'		=> $Rest6,
			'fleetStay'		=> $Rest7,
			'fleetEnd'		=> $Rest8,
			'fleetNameStart'		=> $Rest9,
			'fleetNameEnd'		=> $Rest10,
			'fleetStartSys'		=> $Rest11,
			'fleetStartPla'		=> $Rest12,
			'fleetEndSys'		=> $Rest13,
			'fleetEndPla'		=> $Rest14,
			'fleetmes'		=> $Rest15,
			'missioncolor'		=> $Rest16
		);
	}
	public function getPlanetName($ID) 
	{
	global $UNI;
	$name = '';
	$stats_sql	=	'SELECT name FROM '.PLANETS.' WHERE `universe` = '.$UNI.' AND `id` = '.$ID.';';
	$query = $GLOBALS['DATABASE']->query($stats_sql);
	 while ($StatRow = $GLOBALS['DATABASE']->fetch_array($query))
      {
	  $name = $StatRow['name'];
	  }
	
	return $name;
	}
	
	public function getEventData($fleetRow, $Status)
	{
		global $LNG;
		$Owner			= $fleetRow['fleet_owner'] == $this->UserID;
		$FleetStyle  = array (
			1 => 'attack',
			2 => 'federation',
			3 => 'transport',
			4 => 'deploy',
			5 => 'hold',
			6 => 'espionage',
			7 => 'colony',
			8 => 'harvest',
			9 => 'destroy',
			10 => 'missile',
			11 => 'transport',
			12 => 'negociate',
			13 => 'attack',
			14 => 'espionage',
			15 => 'transport',
			16 => 'asteroid',
			17 => 'deploy',
		);
		
	    $GoodMissions	= array(3, 5);
		$MissionType    = $fleetRow['fleet_mission'];

		$FleetPrefix    = ($Owner == true) ? 'own' : '';
		$FleetType		= $FleetPrefix.$FleetStyle[$MissionType];
		$FleetName		= (!$Owner && ($MissionType == 1 || $MissionType == 2 || $MissionType == 13) && $Status == FLEET_OUTWARD && $fleetRow['fleet_target_owner'] != $this->UserID) ? $LNG['cff_acs_fleet'] : $LNG['ov_fleet'];
		$FleetContent   = $this->CreateFleetPopupedFleetLink($fleetRow, $FleetName, $FleetPrefix.$FleetStyle[$MissionType]);
		$FleetCapacity  = $this->CreateFleetPopupedMissionLink($fleetRow, $LNG['type_mission'][$MissionType], $FleetPrefix.$FleetStyle[$MissionType]);
		$FleetStatus    = array(0 => 'flight', 1 => 'return' , 2 => 'holding');
		$StartType		= $LNG['type_planet'][$fleetRow['fleet_start_type']];
		$TargetType		= $LNG['type_planet'][$fleetRow['fleet_end_type']];
	
		if ($MissionType == 8) {
			if ($Status == FLEET_OUTWARD)
				$EventString = sprintf($LNG['cff_mission_own_recy_0'], $FleetContent, $StartType, $fleetRow['own_planetname'], GetStartAdressLink($fleetRow, $FleetType), GetTargetAdressLink($fleetRow, $FleetType), $FleetCapacity);
			else
				$EventString = sprintf($LNG['cff_mission_own_recy_1'], $FleetContent, GetTargetAdressLink($fleetRow, $FleetType), $StartType, $fleetRow['own_planetname'], GetStartAdressLink($fleetRow, $FleetType), $FleetCapacity);
		} elseif ($MissionType == 10) {
			if ($Owner)
				$EventString = sprintf($LNG['cff_mission_own_mip'], $fleetRow['fleet_amount'], $StartType, $fleetRow['own_planetname'], GetStartAdressLink($fleetRow, $FleetType), $TargetType, $fleetRow['target_planetname'], GetTargetAdressLink($fleetRow, $FleetType));
			else
				$EventString = sprintf($LNG['cff_mission_target_mip'], $fleetRow['fleet_amount'], $this->BuildHostileFleetPlayerLink($fleetRow, $fleetRow), $StartType, $fleetRow['own_planetname'], GetStartAdressLink($fleetRow, $FleetType), $TargetType, $fleetRow['target_planetname'], GetTargetAdressLink($fleetRow, $FleetType));
		} elseif ($MissionType == 11 || $MissionType == 15) {		
			if ($Status == FLEET_OUTWARD)
				$EventString = sprintf($LNG['cff_mission_own_expo_0'], $FleetContent, $StartType, $fleetRow['own_planetname'], GetStartAdressLink($fleetRow, $FleetType), GetTargetAdressLink($fleetRow, $FleetType), $FleetCapacity);
			elseif ($Status == FLEET_HOLD)
				$EventString = sprintf($LNG['cff_mission_own_expo_2'], $FleetContent, $StartType, $fleetRow['own_planetname'], GetStartAdressLink($fleetRow, $FleetType), GetTargetAdressLink($fleetRow, $FleetType), $FleetCapacity);	
			else
				$EventString = sprintf($LNG['cff_mission_own_expo_1'], $FleetContent, GetTargetAdressLink($fleetRow, $FleetType), $StartType, $fleetRow['own_planetname'], GetStartAdressLink($fleetRow, $FleetType), $FleetCapacity);	
		} else {
			if ($Owner == true) {
				if ($Status == FLEET_OUTWARD) {
					if (!$Owner && ($MissionType == 1 || $MissionType == 2 || $MissionType == 13))
						$Message  = $LNG['cff_mission_acs']	;
					else
						$Message  = $LNG['cff_mission_own_0'];
						
					$EventString  = sprintf($Message, $FleetContent, $StartType, $fleetRow['own_planetname'], GetStartAdressLink($fleetRow, $FleetType), $TargetType, $fleetRow['target_planetname'], GetTargetAdressLink($fleetRow, $FleetType), $FleetCapacity);
				} elseif($Status == FLEET_RETURN)
					$EventString  = sprintf($LNG['cff_mission_own_1'], $FleetContent, $TargetType, $fleetRow['target_planetname'], GetTargetAdressLink($fleetRow, $FleetType), $StartType, $fleetRow['own_planetname'], GetStartAdressLink($fleetRow, $FleetType), $FleetCapacity);		
				else
					$EventString  = sprintf($LNG['cff_mission_own_2'], $FleetContent, $StartType, $fleetRow['own_planetname'], GetStartAdressLink($fleetRow, $FleetType), $TargetType, $fleetRow['target_planetname'], GetTargetAdressLink($fleetRow, $FleetType), $FleetCapacity);	
			} else {
				if ($Status == FLEET_HOLD)
					$Message	= $LNG['cff_mission_target_stay'];
				elseif(in_array($MissionType, $GoodMissions))
					$Message	= $LNG['cff_mission_target_good'];
				else
					$Message	= $LNG['cff_mission_target_bad'];

				$EventString	= sprintf($Message, $FleetContent, $this->BuildHostileFleetPlayerLink($fleetRow, $fleetRow), $StartType, $fleetRow['own_planetname'], GetStartAdressLink($fleetRow, $FleetType), $TargetType, $fleetRow['target_planetname'], GetTargetAdressLink($fleetRow, $FleetType), $FleetCapacity);
			}		       
		}
		$EventString = '<span class="'.$FleetStatus[$Status].' '.$FleetType.'">'.$EventString.'</span>';
		if ($Status == FLEET_OUTWARD)
			$Time	 = $fleetRow['fleet_start_time'];
		elseif ($Status == FLEET_RETURN)
			$Time	 = $fleetRow['fleet_end_time'];
		elseif ($Status == FLEET_HOLD)
			$Time	 = $fleetRow['fleet_end_stay'];
			
		$Rest	= $Time - TIMESTAMP;
		$Rest1  = $LNG['type_mission'][$MissionType];
		$Rest2  = $fleetRow['fleet_owner'];
		$Rest3  = $fleetRow['fleet_id'];
		$Rest4  = pretty_number($fleetRow['fleet_amount']);
		$Rest5  = $LNG['type_missionbis'][$fleetRow['fleet_mission']];
		$Rest6  = date('d/m/Y H:i:s', $fleetRow['start_time']);
		$Rest7  = date('d/m/Y H:i:s', $fleetRow['fleet_end_stay']);
		$Rest8  = date('d/m/Y H:i:s', $fleetRow['fleet_end_time']);
		$Rest9  = $this->getPlanetName($fleetRow['fleet_start_id']);
		$Rest10  = $this->getPlanetName($fleetRow['fleet_end_id']);
		$Rest11  = $fleetRow['fleet_start_system'];
		$Rest12  = $fleetRow['fleet_start_planet'];
		$Rest13  = $fleetRow['fleet_end_system'];
		$Rest14  = $fleetRow['fleet_end_planet'];
		$Rest15  = $fleetRow['fleet_mess'];
		$Rest16  = $fleetRow['fleet_mission'];
		return array($Rest, $EventString, $Time, $Rest1, $Rest2, $Rest3, $Rest4, $Rest5, $Rest6, $Rest7, $Rest8, $Rest9, $Rest10, $Rest11, $Rest12, $Rest13, $Rest14, $Rest15, $Rest16);
	}
    private function BuildHostileFleetPlayerLink($fleetRow, $fleetRow)
    {
		global $LNG;
		return $fleetRow['own_username'].' <a href="#" onclick="return Dialog.PM('.$fleetRow['fleet_owner'].')">'.$LNG['PM'].'</a>';
	}

	private function CreateFleetPopupedMissionLink($fleetRow, $Texte, $FleetType)
	{
		global $LNG;
		$FleetTotalC  = $fleetRow['fleet_resource_metal'] + $fleetRow['fleet_resource_crystal'] + $fleetRow['fleet_resource_deuterium'] + $fleetRow['fleet_resource_elyrium'] + $fleetRow['fleet_resource_darkmatter'];
		if ($FleetTotalC != 0)
		{
			$textForBlind = $LNG['tech'][900].': ';
			$textForBlind .= floattostring($fleetRow['fleet_resource_metal']).' '.$LNG['tech'][901];
			$textForBlind .= '; '.floattostring($fleetRow['fleet_resource_crystal']).' '.$LNG['tech'][902];
			$textForBlind .= '; '.floattostring($fleetRow['fleet_resource_deuterium']).' '.$LNG['tech'][903];
			$textForBlind .= '; '.floattostring($fleetRow['fleet_resource_elyrium']).' '.$LNG['tech'][904];
			if($fleetRow['fleet_resource_darkmatter'] > 0)
				$textForBlind .= '; '.floattostring($fleetRow['fleet_resource_darkmatter']).' '.$LNG['tech'][921];
			
			$FRessource   = '<table width=200>';
			$FRessource  .= '<tr><td style=\'width:50%;color:white\'>'.$LNG['tech'][901].'</td><td style=\'width:50%;color:white\'>'. pretty_number($fleetRow['fleet_resource_metal']).'</td></tr>';
			$FRessource  .= '<tr><td style=\'width:50%;color:white\'>'.$LNG['tech'][902].'</td><td style=\'width:50%;color:white\'>'. pretty_number($fleetRow['fleet_resource_crystal']).'</td></tr>';
			$FRessource  .= '<tr><td style=\'width:50%;color:white\'>'.$LNG['tech'][903].'</td><td style=\'width:50%;color:white\'>'. pretty_number($fleetRow['fleet_resource_deuterium']).'</td></tr>';
			$FRessource  .= '<tr><td style=\'width:50%;color:white\'>'.$LNG['tech'][904].'</td><td style=\'width:50%;color:white\'>'. pretty_number($fleetRow['fleet_resource_elyrium']).'</td></tr>';
			if($fleetRow['fleet_resource_darkmatter'] > 0)
				$FRessource  .= '<tr><td style=\'width:50%;color:white\'>'.$LNG['tech'][921].'</td><td style=\'width:50%;color:white\'>'. pretty_number($fleetRow['fleet_resource_darkmatter']).'</td></tr>';
			$FRessource  .= '</table>';
			
			$MissionPopup  = '<a data-tooltip-content="'.$FRessource.'" class="tooltip '.$FleetType.'">'.$Texte.'</a><span class="textForBlind"> ('.$textForBlind.')</span>';
		}
		else
			$MissionPopup  = $Texte;

		return $MissionPopup;
	}

	private function CreateFleetPopupedFleetLink($fleetRow, $Text, $FleetType)
	{
		global $LNG, $USER, $resource;
		$SpyTech		= $USER[$resource[106]];
		$Owner			= $fleetRow['fleet_owner'] == $this->UserID;
		$FleetRec		= explode(';', $fleetRow['fleet_array']);
		$FleetPopup		= '<a href="#" onmouseout="cache();"onmouseover="montre(\'<table>';
		$textForBlind	= '';         
		if ($this->IsPhalanx || $SpyTech >= 4 || $Owner)
		{
			
			if($SpyTech < 8 && !$Owner)
			{
				$FleetPopup		.= '<tr><td>'.$LNG['cff_aproaching'].$fleetRow['fleet_amount'].$LNG['cff_ships'].':</td></tr>';
				$textForBlind	= $LNG['cff_aproaching'].$fleetRow['fleet_amount'].$LNG['cff_ships'].': ';
			}
			$shipsData	= array();
			foreach($FleetRec as $Item => $Group)
			{
				if (empty($Group))
					continue;
					
				$Ship    = explode(',', $Group);
				if($Owner) {
					$FleetPopup 	.= '<tr><td>'.$LNG['tech'][$Ship[0]].':</td><td>'.pretty_number($Ship[1]).'</td></tr>';
						$shipsData[]	= floattostring($Ship[1]).' '.$LNG['tech'][$Ship[0]];
				} else {
					if($SpyTech >= 8)
					{
						$FleetPopup 	.= '<tr><td>'.$LNG['tech'][$Ship[0]].':</td><td>'.pretty_number($Ship[1]).'</td></tr>';
						$shipsData[]	= floattostring($Ship[1]).' '.$LNG['tech'][$Ship[0]];
					}
					else
					{
						$FleetPopup		.= '<tr><td>'.$LNG['tech'][$Ship[0]].'</td></tr>';
						$shipsData[]	= $LNG['tech'][$Ship[0]];
					}
				}
			}
			$textForBlind	.= implode('; ', $shipsData);
		} else {
			$FleetPopup 	.= '<tr><td>'.$LNG['cff_no_fleet_data'].'</span></td></tr>';
			$textForBlind	= $LNG['cff_no_fleet_data'];
		}
		
		$FleetPopup  .= '</table>\');" class="tooltip '. $FleetType .'">'. $Text .'</a>';

		return $FleetPopup;
	}	
}
?>