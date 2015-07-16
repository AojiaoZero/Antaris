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
 * @info $Id: MissionCaseRecycling.php 2632 2013-03-18 19:05:14Z slaver7 $
 * @link http://2moons.cc/
 */

class MissionCaseRecycling extends MissionFunctions
{
	function __construct($Fleet)
	{
		$this->_fleet	= $Fleet;
	}
	
	function TargetEvent()
	{	
		global $pricelist, $reslist, $resource;
		
		$resourceIDs	= array(901, 902, 903, 904, 921);
		$debrisIDs		= array(901, 902, 903);
		$resQuery		= array();
		$collectQuery	= array();
		
		$collectedGoods = array();
		$senderUser		= $GLOBALS['DATABASE']->getFirstRow("SELECT * FROM ".USERS." WHERE id = ".$this->_fleet['fleet_owner'].";");
		foreach($debrisIDs as $debrisID)
		{
			$collectedGoods[$debrisID] = 0;
			$resQuery[]	= 'der_'.$resource[$debrisID];
		}
		
		$targetData	= $GLOBALS['DATABASE']->getFirstRow("SELECT ".implode(',', $resQuery).", (".implode(' + ', $resQuery).") as total FROM ".PLANETS." WHERE id = ".$this->_fleet['fleet_end_id'].";");
		if(!empty($targetData['total']))
		{
			$targetUser			= $GLOBALS['DATABASE']->getFirstRow("SELECT * FROM ".USERS." WHERE id = ".$this->_fleet['fleet_owner'].";");
			$targetUserFactors	= getFactors($targetUser);
			$shipStorageFactor	= 1 + $targetUserFactors['ShipStorage'];
		
			// Get fleet capacity
			$fleetData	= explode(";", $this->_fleet['fleet_array']);

			$recyclerStorage	= 0;
			$otherFleetStorage	= 0;
			
			foreach ($fleetData as $fleetRow)
			{
				if (empty($fleetRow)) continue;
					
				$temp        = explode (",", $fleetRow);

				if ($temp[0] == 209 || $temp[0] == 219 || $temp[0] == 223)
				{
					$recyclerStorage   += $pricelist[$temp[0]]['capacity'] * $temp[1];
				}
				else
				{
					$otherFleetStorage += $pricelist[$temp[0]]['capacity'] * $temp[1];
				}
			}
			
			$recyclerStorage	*= $shipStorageFactor;
			$otherFleetStorage	*= $shipStorageFactor;
			
			unset($temp);

			$incomingGoods		= 0;
			foreach($resourceIDs as $resourceID)
			{
				$incomingGoods	+= $this->_fleet['fleet_resource_'.$resource[$resourceID]];
			}
			
			$totalStorage = $recyclerStorage + min(0, $otherFleetStorage - $incomingGoods);

			// fast way
			$collectFactor	= min(1, $totalStorage / $targetData['total']);
			foreach($debrisIDs as $debrisID)
			{
				$collectedGoods[$debrisID]	= ceil($targetData['der_'.$resource[$debrisID]] * $collectFactor);
				$collectQuery[]				= 'der_'.$resource[$debrisID].' = GREATEST(0, der_'.$resource[$debrisID].' - '.$collectedGoods[$debrisID].')';
				$this->UpdateFleet('fleet_resource_'.$resource[$debrisID], $this->_fleet['fleet_resource_'.$resource[$debrisID]] + $collectedGoods[$debrisID]);
			}
			
			$GLOBALS['DATABASE']->query("UPDATE ".PLANETS." SET ".implode(',', $collectQuery)." WHERE id = ".$this->_fleet['fleet_end_id'].";");
		}
		
		$LNG			= $this->getLanguage($senderUser['lang']);
		$TargetOwner	= $this->_fleet['fleet_target_owner'];
		$StartOwner		= $this->_fleet['fleet_owner'];
		
		if($collectedGoods[901] + $collectedGoods[902] + $collectedGoods[903] == 0){
		$Message = ' <div style="text-align : justify;">
        '.$LNG['fleet_recycle_3'].' planète Home001 [363:7]        
                    '.$LNG['fleet_recycle_4'].' '.$this->getUsername($StartOwner).' <span class="orange">[testt]</span>.
                '.$LNG['fleet_recycle_5'].'
    </div>

	<div class="citation" style="text-align : left;">
        <div class="guillemet ouvrir">«</div>
        <div class="guillemet fermer">»</div>
                
                    '.$LNG['fleet_recycle_6'].' Home001 [363:7] '.$LNG['fleet_recycle_7'].'.
            
            </div>
        
            <div style="margin-top : 10px;" class="rouge">'.$LNG['fleet_recycle_8'].'</div>
        
    <div class="explication_utilisateur">
        '.$LNG['fleet_recycle_9'].'
    </div>';
	}else{
	$Message 	= sprintf($LNG['sys_recy_gotten'], 
							  pretty_number($collectedGoods[901]), $LNG['tech'][901], 
							  pretty_number($collectedGoods[902]), $LNG['tech'][902],
							  pretty_number($collectedGoods[903]), $LNG['tech'][903]
		);
	}
	
		
		SendSimpleMessage($this->_fleet['fleet_owner'], 0, $this->_fleet['fleet_start_time'], 5, $LNG['sys_mess_tower'], $LNG['sys_recy_report'], $Message);
		

	
	
		$this->setState(FLEET_RETURN);
		$this->SaveFleet();
	}
	
	function EndStayEvent()
	{
		return;
	}
	
	function ReturnEvent()
	{
		$senderUser		= $GLOBALS['DATABASE']->getFirstRow("SELECT * FROM ".USERS." WHERE id = ".$this->_fleet['fleet_owner'].";");
		$LNG			= $this->getLanguage($senderUser['lang']);
		$TargetOwner	= $this->_fleet['fleet_target_owner'];
		$StartOwner		= $this->_fleet['fleet_owner'];
		$TargetName	= $GLOBALS['DATABASE']->getFirstCell("SELECT name FROM ".PLANETS." WHERE id = ".$this->_fleet['fleet_start_id'].";");
	
		if($this->_fleet['hasCanceled'] != 0){
		$Message	= '<div class="conteneur_message">
    <div style="text-align : justify;">
        '.$LNG['fleet_deploy_1'].' Base Alpha 5 ['.$this->_fleet['fleet_start_system'].':'.$this->_fleet['fleet_start_planet'].'], '.$LNG['fleet_deploy_2'].' Home001 ['.$this->_fleet['fleet_end_system'].':'.$this->_fleet['fleet_end_planet'].']
        
                    '.$LNG['fleet_deploy_3'].' '.$this->getUsername($StartOwner).' <span class="orange">[testt]</span>.
            </div>

    <div class="citation">
        <div class="guillemet ouvrir">«</div>
        <div class="guillemet fermer">»</div>
        
        '.$LNG['fleet_deploy_4'].'.<br>
        <div style="padding-left : 20px; padding-top : 10px; text-align : left;">
            '.$LNG['fleet_recycle_1'].' '.date('d/m/Y H:i:s', TIMESTAMP).'<br>
            — '.$LNG['fleet_deploy_6'].' Base Alpha 5 ['.$this->_fleet['fleet_start_system'].':'.$this->_fleet['fleet_start_planet'].']<br>
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
		$Message	= '<div class="conteneur_message">
    <div style="text-align : justify;">
        '.$LNG['fleet_deploy_1'].' Base Alpha 5 ['.$this->_fleet['fleet_start_system'].':'.$this->_fleet['fleet_start_planet'].'], '.$LNG['fleet_deploy_2'].' Home001 ['.$this->_fleet['fleet_end_system'].':'.$this->_fleet['fleet_end_planet'].']
        
                    '.$LNG['fleet_deploy_3'].' '.$this->getUsername($StartOwner).' <span class="orange">[testt]</span>.
            </div>

    <div class="citation">
        <div class="guillemet ouvrir">«</div>
        <div class="guillemet fermer">»</div>
        
        '.$LNG['fleet_deploy_4'].'.<br>
        <div style="padding-left : 20px; padding-top : 10px; text-align : left;">
            '.$LNG['fleet_recycle_2'].' '.date('d/m/Y H:i:s', TIMESTAMP).'<br>
            — '.$LNG['fleet_deploy_6'].' Base Alpha 5 ['.$this->_fleet['fleet_start_system'].':'.$this->_fleet['fleet_start_planet'].']<br>
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
		SendSimpleMessage($this->_fleet['fleet_owner'], 0, $this->_fleet['fleet_end_time'], 5, $LNG['sys_mess_tower_recycle'], $LNG['sys_mess_fleetback'], $Message);

		$this->RestoreFleet();
	}
}