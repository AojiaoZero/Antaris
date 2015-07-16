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
 * @info $Id: MissionCaseTransport.php 2632 2013-03-18 19:05:14Z slaver7 $
 * @link http://2moons.cc/
 */
class MissionCaseNegociate extends MissionFunctions
{		
	function __construct($Fleet)
	{
		$this->_fleet	= $Fleet;
	}
	
	function TargetEvent()
	{
		 $GLOBALS['DATABASE']->query("INSERT INTO uni1_buddy (sender,owner,state,time,universe) VALUES('".$this->_fleet['fleet_owner']."', '".$this->_fleet['fleet_target_owner']."', '0', '".(TIMESTAMP)."', '1');");
		 $TargetOwner	= $this->_fleet['fleet_target_owner'];
		 $StartOwner		= $this->_fleet['fleet_owner'];
		 $senderUser		= $GLOBALS['DATABASE']->getFirstRow("SELECT * FROM ".USERS." WHERE id = ".$this->_fleet['fleet_owner'].";");
		 $targetUser		= $GLOBALS['DATABASE']->getFirstRow("SELECT * FROM ".USERS." WHERE id = ".$this->_fleet['fleet_target_owner'].";");
		 
		 $SelectCount		= $GLOBALS['DATABASE']->getFirstCell("SELECT COUNT(*) FROM uni1_buddy WHERE (sender = ".$this->_fleet['fleet_target_owner']." AND owner = ".$this->_fleet['fleet_owner'].") OR (sender = ".$this->_fleet['fleet_owner']." AND owner = ".$this->_fleet['fleet_target_owner'].");");
		 if($SelectCount > 0){
			 $LNG			= $this->getLanguage($senderUser['lang']);
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
		 }else{
		

		$LNG			= $this->getLanguage($senderUser['lang']);
		 $Message = '<div style="text-align : justify;">
        '.$LNG['fleet_transport_7'].' '.$this->getUsername($StartOwner).' <span class="orange">[testt]</span> '.$LNG['fleet_negociate_5'].' '.$this->getPlanetName($this->_fleet['fleet_end_id']).' ['.$this->_fleet['fleet_end_system'].':'.$this->_fleet['fleet_end_planet'].'] 
        du joueur '.$this->getUsername($TargetOwner).'. 
        '.$LNG['fleet_negociate_3'].' :
    </div>
    
    <div class="citation">
        <div class="guillemet ouvrir">«</div>
        <div class="guillemet fermer">»</div>
        
        <!-- Message pour celui qui a envoyé l\'équipe -->
                    '.$LNG['fleet_negociate_1'].'
        
        <!-- Message pour celui qui a reçu l\'équipe de négociation -->
            </div>
    
    <div class="explication_utilisateur">
        '.$LNG['fleet_negociate_2'].'
    </div>';
	
	SendSimpleMessage($this->_fleet['fleet_owner'], 0, TIMESTAMP, 7, $LNG['sys_mess_tower'], $LNG['bu_rejected_request_title'], $Message);
	
	if ($TargetOwner != $StartOwner) 
		{
		$LNG			= $this->getLanguage($targetUser['lang']);
		 $Message1 = '<div style="text-align : justify;">
        '.$LNG['fleet_transport_7'].' '.$this->getUsername($StartOwner).' <span class="orange">[testt]</span> '.$LNG['fleet_negociate_5'].' '.$this->getPlanetName($this->_fleet['fleet_start_id']).' ['.$this->_fleet['fleet_start_system'].':'.$this->_fleet['fleet_start_planet'].'] 
        du joueur '.$this->getUsername($TargetOwner).'. 
        '.$LNG['fleet_negociate_3'].' :
    </div>
    
    <div class="citation">
        <div class="guillemet ouvrir">«</div>
        <div class="guillemet fermer">»</div>
        
        <!-- Message pour celui qui a envoyé l\'équipe -->
                    '.sprintf($LNG['fleet_negociate_4'], $this->getPlanetName($this->_fleet['fleet_start_id']), $this->_fleet['fleet_start_system'], $this->_fleet['fleet_start_planet']).'
            </div>
    
    <div class="explication_utilisateur">
        '.$LNG['fleet_negociate_2'].'
    </div>';
	
	SendSimpleMessage($this->_fleet['fleet_target_owner'], 0, TIMESTAMP, 7, $LNG['sys_mess_tower'], $LNG['bu_rejected_request_title'], $Message1);
		}
	
	

		$this->setState(FLEET_RETURN);
		
		 }
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
		$StartName	= $GLOBALS['DATABASE']->getFirstCell("SELECT name FROM ".PLANETS." WHERE id = ".$this->_fleet['fleet_start_id'].";");
		

		$this->RestoreFleet();
	}
}