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
 * @info $Id: MissionCaseColonisation.php 2640 2013-03-23 19:23:26Z slaver7 $
 * @link http://2moons.cc/
 */

class MissionCaseColonisation extends MissionFunctions
{
	function __construct($Fleet)
	{
		$this->_fleet	= $Fleet;
	}
	
	function TargetEvent()
	{	
		global $resource;
		$iPlanetCount 	= $GLOBALS['DATABASE']->getFirstCell("SELECT COUNT(*) FROM ".PLANETS." WHERE `id_owner` = '". $this->_fleet['fleet_owner'] ."' AND `planet_type` = '1' AND `destruyed` = '0';");
		$iGalaxyPlace 	= $GLOBALS['DATABASE']->getFirstCell("SELECT COUNT(*) FROM ".PLANETS." WHERE `id` = '".$this->_fleet['fleet_end_id']."';");
		$senderUser		= $GLOBALS['DATABASE']->getFirstRow("SELECT * FROM ".USERS." WHERE `id` = '".$this->_fleet['fleet_owner']."';");
		$senderPlanet	= $GLOBALS['DATABASE']->getFirstRow("SELECT * FROM ".PLANETS." WHERE `id` = '".$this->_fleet['fleet_start_id']."';");
		$senderUser['factor']	= getFactors($senderUser, 'basic', $this->_fleet['fleet_start_time']);
		$LNG			= $this->getLanguage($senderUser['lang']);
		
		$MaxPlanets		= PlayerUtil::maxPlanetCount($senderUser);
		
		if ($iGalaxyPlace != 0)
		{
			$TheMessage = '<div style="text-align : justify;">
        '.sprintf($LNG['ls_fts_colo_1'], $this->_fleet['fleet_end_system'], $this->_fleet['fleet_end_planet'], $LNG['type_missionbis'][$this->_fleet['fleet_mission']]).'
    </div>
  
    <div class="citation">
        <div class="guillemet ouvrir">«</div>
        <div class="guillemet fermer">»</div>
        
        '.$LNG['ls_fts_colo_2'].' :
        <ul style="text-align : left;">
            <li>'.$LNG['ls_fts_colo_3'].'</li>
            <li>'.$LNG['ls_fts_colo_4'].'</li>
            <li>'.$LNG['ls_fts_colo_5'].'</li>
            <li>'.$LNG['ls_fts_colo_6'].'</li>
            <li>'.$LNG['ls_fts_colo_7'].'</li>
            <li>'.$LNG['ls_fts_colo_8'].'</li>
        </ul>
    </div>
        
    <div class="explication_utilisateur">
        '.$LNG['ls_fts_colo_9'].'
    </div>';
			SendSimpleMessage($this->_fleet['fleet_owner'], 0, $this->_fleet['fleet_start_time'], 7, $LNG['sys_colo_mess_from_text1'], sprintf($LNG['sys_colo_mess_report1'], $this->_fleet['fleet_end_system'], $this->_fleet['fleet_end_planet']), $TheMessage);
			$this->setState(FLEET_RETURN);
		}
		elseif($iPlanetCount >= $MaxPlanets)
		{
			$TheMessage = '<div style="text-align : justify;">
        '.sprintf($LNG['ls_fts_colo_1'], $this->_fleet['fleet_end_system'], $this->_fleet['fleet_end_planet'], $LNG['type_missionbis'][$this->_fleet['fleet_mission']]).'
    </div>
  
    <div class="citation">
        <div class="guillemet ouvrir">«</div>
        <div class="guillemet fermer">»</div>
        
        '.$LNG['ls_fts_colo_2'].' :
        <ul style="text-align : left;">
            <li>'.$LNG['ls_fts_colo_3'].'</li>
            <li>'.$LNG['ls_fts_colo_4'].'</li>
            <li>'.$LNG['ls_fts_colo_5'].'</li>
            <li>'.$LNG['ls_fts_colo_6'].'</li>
            <li>'.$LNG['ls_fts_colo_7'].'</li>
            <li>'.$LNG['ls_fts_colo_8'].'</li>
        </ul>
    </div>
        
    <div class="explication_utilisateur">
        '.$LNG['ls_fts_colo_9'].'
    </div>';
			SendSimpleMessage($this->_fleet['fleet_owner'], 0, $this->_fleet['fleet_start_time'], 7, $LNG['sys_colo_mess_from_text1'], sprintf($LNG['sys_colo_mess_report1'], $this->_fleet['fleet_end_system'], $this->_fleet['fleet_end_planet']), $TheMessage);
			$this->setState(FLEET_RETURN);
		}
		else
		{
			$bonus_iron = mt_rand(1,40);
			$bonus_gold = mt_rand(1,40);
			$bonus_crys = mt_rand(1,40);
			$bonus_elyr = mt_rand(1,40);
			$Color = 'vert';
			$Color1 = 'vert';
			$Color2 = 'vert';
			$Color3 = 'vert';
			$bonus_iron_perc = rand(1,55);
			$bonus_gold_perc = rand(1,55);
			$bonus_crys_perc = rand(1,55);
			$bonus_elyr_perc = rand(1,55);
			if($bonus_iron_perc >= $bonus_iron){
			$bonus_iron *= -1;
			$Color = 'rouge';
			}
			if($bonus_gold_perc >= $bonus_gold){
			$bonus_gold *= -1;
			$Color1 = 'rouge';
			}
			if($bonus_crys_perc >= $bonus_crys){
			$bonus_crys *= -1;
			$Color2 = 'rouge';
			}
			if($bonus_elyr_perc >= $bonus_elyr){
			$bonus_elyr *= -1;
			$Color3 = 'rouge';
			}
				
			require_once('includes/functions/CreateOnePlanetRecord.php');
			$NewOwnerPlanet = CreateOnePlanetRecord($this->_fleet['fleet_end_galaxy'], $this->_fleet['fleet_end_system'], $this->_fleet['fleet_end_planet'], $this->_fleet['fleet_universe'], $this->_fleet['fleet_owner'], $LNG['fcp_colony'], false, $senderUser['authlevel'], $bonus_iron , $bonus_gold, $bonus_crys, $bonus_elyr, $iPlanetCount);
			if($NewOwnerPlanet === false)
			{
				$TheMessage = '<div style="text-align : justify;">
        '.sprintf($LNG['ls_fts_colo_1'], $this->_fleet['fleet_end_system'], $this->_fleet['fleet_end_planet'], $LNG['type_missionbis'][$this->_fleet['fleet_mission']]).'
    </div>
  
    <div class="citation">
        <div class="guillemet ouvrir">«</div>
        <div class="guillemet fermer">»</div>
        
        '.$LNG['ls_fts_colo_2'].' :
        <ul style="text-align : left;">
            <li>'.$LNG['ls_fts_colo_3'].'</li>
            <li>'.$LNG['ls_fts_colo_4'].'</li>
            <li>'.$LNG['ls_fts_colo_5'].'</li>
            <li>'.$LNG['ls_fts_colo_6'].'</li>
            <li>'.$LNG['ls_fts_colo_7'].'</li>
            <li>'.$LNG['ls_fts_colo_8'].'</li>
        </ul>
    </div>
        
    <div class="explication_utilisateur">
        '.$LNG['ls_fts_colo_9'].'
    </div>';
				SendSimpleMessage($this->_fleet['fleet_owner'], 0, $this->_fleet['fleet_start_time'], 7, $LNG['sys_colo_mess_from_text1'], sprintf($LNG['sys_colo_mess_report1'], $this->_fleet['fleet_end_system'], $this->_fleet['fleet_end_planet']), $TheMessage);
					$this->setState(FLEET_RETURN);
			}
			else
			{
				
				
				
								
				
				
				
				
				
				$this->_fleet['fleet_end_id']	= $NewOwnerPlanet;
				$TheMessage = '<div style="text-align : justify;">
       '.$LNG['sys_col_1'].' ['.$this->_fleet['fleet_end_system'].':'.$this->_fleet['fleet_end_planet'].'].
         '.$LNG['sys_col_2'].' :
    </div>

	<div class="citation">
        <div class="guillemet ouvrir">«</div>
        <div class="guillemet fermer">»</div>
                
       '.$LNG['sys_col_3'].'
    </div>
        
    <h3>'.$LNG['sys_col_4'].' : </h3>
    <div class="conteneur_item" style="margin-top : 5px;">
                <div class="element_item">
            <img src="/media/ingame/image/metal.jpg">
            '.$LNG['sys_col_5'].' « '.$LNG['tech'][901].' » : <span class="'.$Color.'">'.$bonus_iron.'%</span>
        </div>
                <div class="element_item">
            <img src="/media/ingame/image/oro.jpg">
            '.$LNG['sys_col_5'].' « '.$LNG['tech'][902].' » : <span class="'.$Color1.'">'.$bonus_gold.'%</span>
        </div>
                <div class="element_item">
            <img src="/media/ingame/image/crystal.jpg">
            '.$LNG['sys_col_5'].' « '.$LNG['tech'][903].' » : <span class="'.$Color2.'">'.$bonus_crys.'%</span>
        </div>
                <div class="element_item">
            <img src="/media/ingame/image/elyrium.jpg">
            '.$LNG['sys_col_5'].' « '.$LNG['tech'][904].' » : <span class="'.$Color3.'">'.$bonus_elyr.'%</span>
        </div>
            </div>';
				$this->StoreGoodsToPlanet();
				if ($this->_fleet['fleet_amount'] == 1) {
					$this->KillFleet();
				} else {
					$CurrentFleet = explode(";", $this->_fleet['fleet_array']);
					$NewFleet     = '';
					foreach ($CurrentFleet as $Item => $Group)
					{
						if (empty($Group)) continue;

						$Class = explode (",", $Group);
						if ($Class[0] == 208 && $Class[1] > 1)
							$NewFleet  .= $Class[0].",".($Class[1] - 1).";";
						elseif ($Class[0] != 208 && $Class[1] > 0)
							$NewFleet  .= $Class[0].",".$Class[1].";";
					}
					$this->UpdateFleet('fleet_array', $NewFleet);
					$this->UpdateFleet('fleet_amount', ($this->_fleet['fleet_amount'] - 1));
					$this->UpdateFleet('fleet_resource_metal', 0);
					$this->UpdateFleet('fleet_resource_crystal', 0);
					$this->UpdateFleet('fleet_resource_deuterium', 0);
					$this->UpdateFleet('fleet_resource_elyrium', 0);
					$this->setState(FLEET_RETURN);
				}
			SendSimpleMessage($this->_fleet['fleet_owner'], 0, $this->_fleet['fleet_start_time'], 7, $LNG['sys_colo_mess_from_text'], sprintf($LNG['sys_colo_mess_report2'], $this->_fleet['fleet_end_system'], $this->_fleet['fleet_end_planet']), $TheMessage);	
			}
		}
		
		$this->SaveFleet();
	}
	
	function EndStayEvent()
	{
		return;
	}
	
	function ReturnEvent()
	{
		$this->RestoreFleet();
	}
}