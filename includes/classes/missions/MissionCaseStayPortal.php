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
 * @info $Id: MissionCaseStay.php 2640 2013-03-23 19:23:26Z slaver7 $
 * @link http://2moons.cc/
 */

class MissionCaseStayPortal extends MissionFunctions
{
	function __construct($Fleet)
	{
		$this->_fleet	= $Fleet;
	}
	
	function TargetEvent()
	{	
		$senderUser		= $GLOBALS['DATABASE']->getFirstRow("SELECT * FROM ".USERS." WHERE id = ".$this->_fleet['fleet_owner'].";");
		$senderUser['factor']	= getFactors($senderUser, 'basic', $this->_fleet['fleet_start_time']);
		
		$fleetArray			= fleetAmountToArray($this->_fleet['fleet_array']);
		$duration			= $this->_fleet['fleet_start_time'] - $this->_fleet['start_time'];
		
		
		$LNG				= $this->getLanguage($senderUser['lang']);
		$TargetUserID       = $this->_fleet['fleet_target_owner'];
		
		$TargetMessage = '<div style="text-align : justify;">
    	'.$LNG['fleet_deploy_9'].' :
    </div>

    <div class="citation">
        <div class="guillemet ouvrir">«</div>
        <div class="guillemet fermer">»</div>
        
                '.$LNG['fleet_deploy_10'].' Base Alpha 5 ['.$this->_fleet['fleet_end_system'].':'.$this->_fleet['fleet_end_planet'].'] '.$LNG['fleet_deploy_11'].'
                <br>
        <div style="padding-left : 20px; padding-top : 10px;">
            — '.$LNG['fleet_deploy_12'].' '.date('d/m/Y H:i:s', TIMESTAMP).'<br>
            — '.$LNG['fleet_deploy_13'].' : Home001 ['.$this->_fleet['fleet_start_system'].':'.$this->_fleet['fleet_start_planet'].']<br>
            — '.$LNG['fleet_deploy_14'].' : Base Alpha 5 ['.$this->_fleet['fleet_end_system'].':'.$this->_fleet['fleet_end_planet'].'] <br>
        </div>
    </div>
  
                       <h3>'.$LNG['fleet_deploy_7'].' :</h3>
            <div class="conteneur_item" style="margin-top : 5px;">
                    <div class="element_item">
                        <img src="/media/ingame/image/metal.jpg">
                        '.$LNG['tech'][901].' : <span class="orange">'.pretty_number($this->_fleet['fleet_resource_metal']).'</span> '.$LNG['lm_achat_units'].'
                    </div>    
					<div class="element_item">
                        <img src="/media/ingame/image/oro.jpg">
                        '.$LNG['tech'][902].' : <span class="orange">'.pretty_number($this->_fleet['fleet_resource_crystal']).'</span> '.$LNG['lm_achat_units'].'
                    </div> 
					<div class="element_item">
                        <img src="/media/ingame/image/crystal.jpg">
                        '.$LNG['tech'][903].' : <span class="orange">'.pretty_number($this->_fleet['fleet_resource_deuterium']).'</span> '.$LNG['lm_achat_units'].'
                    </div> 
					<div class="element_item">
                        <img src="/media/ingame/image/elyrium.jpg">
                        '.$LNG['tech'][904].' : <span class="orange">'.pretty_number($this->_fleet['fleet_resource_elyrium']).'</span> '.$LNG['lm_achat_units'].'
                    </div> 
                        </div>
                                                    
    <div class="explication_utilisateur">
        '.$LNG['fleet_deploy_15'].'
    </div>';
		
		
		
		SendSimpleMessage($TargetUserID, 0, $this->_fleet['fleet_start_time'], 7, $LNG['sys_mess_tower_deploy_good'], $LNG['sys_stat_mess_stay'], $TargetMessage);
		
		$this->RestoreFleet(false);
	}
	
	function EndStayEvent()
	{
		return;
	}
	
	function ReturnEvent()
	{
		$LNG				= $this->getLanguage(NULL, $this->_fleet['fleet_owner']);	
		$TargetUserID       = $this->_fleet['fleet_target_owner'];
		$TargetOwner	= $this->_fleet['fleet_target_owner'];
		$StartOwner		= $this->_fleet['fleet_owner'];
		
		if($this->_fleet['hasCanceled'] != 0){
		$TargetMessage      = '<div style="text-align : justify;">
        '.$LNG['fleet_deploy_1'].' ['.$this->_fleet['fleet_start_system'].':'.$this->_fleet['fleet_start_planet'].'], '.$LNG['fleet_deploy_2'].' Base Alpha 5 ['.$this->_fleet['fleet_end_system'].':'.$this->_fleet['fleet_end_planet'].']
                    '.$LNG['fleet_deploy_3'].' '.$this->getUsername($StartOwner).' <span class="orange">[testt]</span>.
            </div>
    <div class="citation">
        <div class="guillemet ouvrir">«</div>
        <div class="guillemet fermer">»</div>
        
        '.$LNG['fleet_deploy_4'].'.<br>
        <div style="padding-left : 20px; padding-top : 10px; text-align : left;">
           '.$LNG['fleet_deploy_5'].' '.date('d/m/Y H:i:s', TIMESTAMP).'<br>
            — '.$LNG['fleet_deploy_6'].' Home001 ['.$this->_fleet['fleet_start_system'].':'.$this->_fleet['fleet_start_planet'].']<br>
        </div>
    </div>
                              
            
                                  <h3>'.$LNG['fleet_deploy_7'].' :</h3>
            <div class="conteneur_item" style="margin-top : 5px;">
                    <div class="element_item">
                        <img src="/media/ingame/image/metal.jpg">
                        '.$LNG['tech'][901].' : <span class="orange">'.pretty_number($this->_fleet['fleet_resource_metal']).'</span> '.$LNG['lm_achat_units'].'
                    </div>    
					<div class="element_item">
                        <img src="/media/ingame/image/oro.jpg">
                        '.$LNG['tech'][902].' : <span class="orange">'.pretty_number($this->_fleet['fleet_resource_crystal']).'</span> '.$LNG['lm_achat_units'].'
                    </div> 
					<div class="element_item">
                        <img src="/media/ingame/image/crystal.jpg">
                        '.$LNG['tech'][903].' : <span class="orange">'.pretty_number($this->_fleet['fleet_resource_deuterium']).'</span> '.$LNG['lm_achat_units'].'
                    </div> 
					<div class="element_item">
                        <img src="/media/ingame/image/elyrium.jpg">
                        '.$LNG['tech'][904].' : <span class="orange">'.pretty_number($this->_fleet['fleet_resource_elyrium']).'</span> '.$LNG['lm_achat_units'].'
                    </div> 
                        </div>                    
    <div class="explication_utilisateur">
        '.$LNG['fleet_deploy_8'].'
    </div>';
		}else{
		$TargetMessage      = '<div style="text-align : justify;">
        '.$LNG['fleet_deploy_1'].' ['.$this->_fleet['fleet_start_system'].':'.$this->_fleet['fleet_start_planet'].'], '.$LNG['fleet_deploy_2'].' Base Alpha 5 ['.$this->_fleet['fleet_end_system'].':'.$this->_fleet['fleet_end_planet'].']
                    '.$LNG['fleet_deploy_3'].' '.$this->getUsername($StartOwner).' <span class="orange">[testt]</span>.
            </div>
    <div class="citation">
        <div class="guillemet ouvrir">«</div>
        <div class="guillemet fermer">»</div>
        
        '.$LNG['fleet_deploy_4'].'.<br>
        <div style="padding-left : 20px; padding-top : 10px; text-align : left;">
           '.$LNG['fleet_deploy_16'].' '.date('d/m/Y H:i:s', TIMESTAMP).'<br>
            — '.$LNG['fleet_deploy_6'].' Home001 ['.$this->_fleet['fleet_start_system'].':'.$this->_fleet['fleet_start_planet'].']<br>
        </div>
    </div>
                              
            
                                  <h3>'.$LNG['fleet_deploy_7'].' :</h3>
            <div class="conteneur_item" style="margin-top : 5px;">
                    <div class="element_item">
                        <img src="/media/ingame/image/metal.jpg">
                        '.$LNG['tech'][901].' : <span class="orange">'.pretty_number($this->_fleet['fleet_resource_metal']).'</span> '.$LNG['lm_achat_units'].'
                    </div>    
					<div class="element_item">
                        <img src="/media/ingame/image/oro.jpg">
                        '.$LNG['tech'][902].' : <span class="orange">'.pretty_number($this->_fleet['fleet_resource_crystal']).'</span> '.$LNG['lm_achat_units'].'
                    </div> 
					<div class="element_item">
                        <img src="/media/ingame/image/crystal.jpg">
                        '.$LNG['tech'][903].' : <span class="orange">'.pretty_number($this->_fleet['fleet_resource_deuterium']).'</span> '.$LNG['lm_achat_units'].'
                    </div> 
					<div class="element_item">
                        <img src="/media/ingame/image/elyrium.jpg">
                        '.$LNG['tech'][904].' : <span class="orange">'.pretty_number($this->_fleet['fleet_resource_elyrium']).'</span> '.$LNG['lm_achat_units'].'
                    </div> 
                        </div>                    
    <div class="explication_utilisateur">
        '.$LNG['fleet_deploy_8'].'
    </div>';	
			
			
		}
	
		SendSimpleMessage($TargetUserID, 0, $this->_fleet['fleet_end_time'], 5, $LNG['sys_mess_tower_deploy_fail'], $LNG['sys_stat_mess_stay'], $TargetMessage);
		
		$this->RestoreFleet();
	}
}