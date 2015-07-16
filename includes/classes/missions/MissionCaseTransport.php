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
class MissionCaseTransport extends MissionFunctions
{		
	function __construct($Fleet)
	{
		$this->_fleet	= $Fleet;
	}
	
	function TargetEvent()
	{
		$StartPlanet	= $GLOBALS['DATABASE']->getFirstRow("SELECT name FROM ".PLANETS." WHERE `id` = '". $this->_fleet['fleet_start_id'] ."';");
		$StartName		= $StartPlanet['name'];
		$StartOwner		= $this->_fleet['fleet_owner'];
		$senderUser		= $GLOBALS['DATABASE']->getFirstRow("SELECT * FROM ".USERS." WHERE id = ".$this->_fleet['fleet_owner'].";");
		$targetUser		= $GLOBALS['DATABASE']->getFirstRow("SELECT * FROM ".USERS." WHERE id = ".$this->_fleet['fleet_target_owner'].";");

		$TargetPlanet	= $GLOBALS['DATABASE']->getFirstRow("SELECT name FROM ".PLANETS." WHERE `id` = '". $this->_fleet['fleet_end_id'] ."';");
		$TargetName		= $TargetPlanet['name'];
		$TargetOwner	= $this->_fleet['fleet_target_owner'];
		$userRank	= $GLOBALS['DATABASE']->getFirstRow("SELECT total_rank FROM ".STATPOINTS." WHERE `id_owner` = '".$StartOwner."';");
		$targetRank	= $GLOBALS['DATABASE']->getFirstRow("SELECT total_rank FROM ".STATPOINTS." WHERE `id_owner` = '".$TargetOwner."';");
		$Counting = $GLOBALS['DATABASE']->getFirstCell("SELECT COUNT(*) FROM `uni1_transport_player` WHERE `senderID` = ".$this->_fleet['fleet_owner']." AND `receiverID` = ".$this->_fleet['fleet_target_owner']." AND `legal` = 1 AND `delete` = 0;");
		$Strongest = $StartOwner;
		if($targetRank['total_rank'] > $userRank['total_rank']){
		$Strongest = $TargetOwner;	
		}
		
		$Push = $this->_fleet['fleet_resource_metal'] + $this->_fleet['fleet_resource_crystal']*2 + $this->_fleet['fleet_resource_deuterium']*3 + $this->_fleet['fleet_resource_elyrium']*4 + $this->_fleet['fleet_population_301']*20 + $this->_fleet['fleet_population_302']*60 + $this->_fleet['fleet_population_303']*80 + $this->_fleet['fleet_population_304']*1000 + $this->_fleet['fleet_population_305']*400 + $this->_fleet['fleet_population_306']*240 + $this->_fleet['fleet_population_307']*880;
		
		$legal = 1;
		if($Strongest == $StartOwner){
		$legal = 0;
		}elseif($Counting != 0){
		$legal = 0;
		}elseif($Push < 2){
		$legal = 0;
		}
		
		 $SelectCount		= $GLOBALS['DATABASE']->getFirstCell("SELECT COUNT(*) FROM uni1_buddy WHERE (sender = ".$this->_fleet['fleet_target_owner']." AND owner = ".$this->_fleet['fleet_owner']." AND state = '1') OR (sender = ".$this->_fleet['fleet_owner']." AND owner = ".$this->_fleet['fleet_target_owner']." AND state = '1');");
		 if($SelectCount == 0 && $this->_fleet['fleet_owner'] != $this->_fleet['fleet_target_owner']){
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
		 
		 
		if ($TargetOwner == $StartOwner) 
		{
		$LNG			= $this->getLanguage($senderUser['lang']);
		$Message		= '<div style="text-align : justify;">
                   '.$LNG['fleet_transport_3'].' :
    </div>

    <div class="citation">
        <div class="guillemet ouvrir">«</div>
        <div class="guillemet fermer">»</div>
        
                '.$LNG['fleet_deploy_10'].' Home001 ['.$this->_fleet['fleet_end_system'].':'.$this->_fleet['fleet_end_planet'].'] '.$LNG['fleet_transport_4'].' Base Alpha 5 ['.$this->_fleet['fleet_start_system'].':'.$this->_fleet['fleet_start_planet'].'].
        '.$LNG['fleet_transport_5'].'.
                <br>
        <div style="padding-left : 20px; padding-top : 10px;">
            — '.$LNG['fleet_deploy_12'].' 27 mars 2015 à 23h25<br>
            — '.$LNG['fleet_deploy_13'].' : Base Alpha 5 ['.$this->_fleet['fleet_start_system'].':'.$this->_fleet['fleet_start_planet'].']<br>
            — '.$LNG['fleet_deploy_14'].' : Home001 ['.$this->_fleet['fleet_end_system'].':'.$this->_fleet['fleet_end_planet'].'] <br>
        </div>
    </div>
  
                                            
    <div class="explication_utilisateur">
        '.$LNG['fleet_transport_6'].'
            </div>';
		}else{
			$LNG			= $this->getLanguage($senderUser['lang']);
			$Message = ' <div style="text-align : justify;">
                   '.$LNG['fleet_transport_7'].' '.$this->getUsername($StartOwner).' <span class="orange">[testt]</span>  '.$LNG['fleet_transport_8'].' '.$this->getUsername($TargetOwner).' . 
                '.$LNG['fleet_transport_9'].' :
    </div>

    <div class="citation">
        <div class="guillemet ouvrir">«</div>
        <div class="guillemet fermer">»</div>
        
                '.$LNG['fleet_deploy_10'].' Home001 ['.$this->_fleet['fleet_end_system'].':'.$this->_fleet['fleet_end_planet'].'] '.$LNG['fleet_transport_4'].' Base Alpha 5 ['.$this->_fleet['fleet_start_system'].':'.$this->_fleet['fleet_start_planet'].'].
        '.$LNG['fleet_transport_5'].'.
                <br>
        <div style="padding-left : 20px; padding-top : 10px;">
            — '.$LNG['fleet_deploy_12'].' 29 mars 2015 à 18h41<br>
            — '.$LNG['fleet_deploy_13'].' : ['.$this->_fleet['fleet_start_system'].':'.$this->_fleet['fleet_start_planet'].']<br>
            — '.$LNG['fleet_deploy_14'].' : Hme001 ['.$this->_fleet['fleet_end_system'].':'.$this->_fleet['fleet_end_planet'].'] <br>
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
        '.$LNG['fleet_transport_6'].'
        '.$LNG['fleet_transport_10'].' <span class="rouge">'.$this->getUsername($Strongest).'</span>.    </div>
</div>';
		}
		$transmessage = sprintf($LNG['sys_mess_tower_transport_bis'],$this->getUsername($TargetOwner));
		SendSimpleMessage($StartOwner, 0, $this->_fleet['fleet_start_time'], 7, $transmessage, $LNG['sys_mess_transport'], $Message);
		
		
		if ($TargetOwner != $StartOwner) 
		{
			$LNG			= $this->getLanguage($targetUser['lang']);
			//$Message        = sprintf($LNG['sys_tran_mess_user'], $StartName, GetStartAdressLink($this->_fleet, ''), $TargetName, GetTargetAdressLink($this->_fleet, ''), pretty_number($this->_fleet['fleet_resource_metal']), $LNG['tech'][901], pretty_number($this->_fleet['fleet_resource_crystal']), $LNG['tech'][902], pretty_number($this->_fleet['fleet_resource_deuterium']), $LNG['tech'][903], pretty_number($this->_fleet['fleet_resource_elyrium']), $LNG['tech'][904] );
			
			
			$Message = ' <div style="text-align : justify;">
                   '.$LNG['fleet_transport_7'].' '.$this->getUsername($StartOwner).' <span class="orange">[testt]</span>  '.$LNG['fleet_transport_8'].' '.$this->getUsername($TargetOwner).' . 
                '.$LNG['fleet_transport_9'].' :
    </div>

    <div class="citation">
        <div class="guillemet ouvrir">«</div>
        <div class="guillemet fermer">»</div>
        
                '.$LNG['fleet_deploy_10'].' Home001 ['.$this->_fleet['fleet_end_system'].':'.$this->_fleet['fleet_end_planet'].'] '.$LNG['fleet_transport_4'].' Base Alpha 5 ['.$this->_fleet['fleet_start_system'].':'.$this->_fleet['fleet_start_planet'].'].
        '.$LNG['fleet_transport_5'].'.
                <br>
        <div style="padding-left : 20px; padding-top : 10px;">
            — '.$LNG['fleet_deploy_12'].' 29 mars 2015 à 18h41<br>
            — '.$LNG['fleet_deploy_13'].' : ['.$this->_fleet['fleet_start_system'].':'.$this->_fleet['fleet_start_planet'].']<br>
            — '.$LNG['fleet_deploy_14'].' : Hme001 ['.$this->_fleet['fleet_end_system'].':'.$this->_fleet['fleet_end_planet'].'] <br>
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
        '.$LNG['fleet_transport_6'].'
        '.$LNG['fleet_transport_10'].' <span class="rouge">'.$this->getUsername($Strongest).'</span>.    </div>
</div>';
			
			$GLOBALS['DATABASE']->query("INSERT INTO uni1_transport_player VALUES ('".$GLOBALS['DATABASE']->GetInsertID()."','".$StartOwner."','".$TargetOwner."','".TIMESTAMP."', '".$Strongest."', '".$Push."', ".$this->_fleet['fleet_resource_metal'].", ".$this->_fleet['fleet_resource_crystal'].", ".$this->_fleet['fleet_resource_deuterium'].", ".$this->_fleet['fleet_resource_elyrium'].", ".$this->_fleet['fleet_population_301'].", ".$this->_fleet['fleet_population_302'].", ".$this->_fleet['fleet_population_303'].", ".$this->_fleet['fleet_population_304'].", ".$this->_fleet['fleet_population_305'].", ".$this->_fleet['fleet_population_306'].", ".$this->_fleet['fleet_population_307'].", ".$legal.", '0');");
			$transmessage = sprintf($LNG['sys_mess_tower_transport_bis'],$this->getUsername($StartOwner));
			SendSimpleMessage($TargetOwner, 0, $this->_fleet['fleet_start_time'], 7, $transmessage, $LNG['sys_mess_transport'], $Message);
		}
		$this->StoreGoodsToPlanet();
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
		$LNG		= $this->getLanguage($senderUser['lang']);
		$StartName	= $GLOBALS['DATABASE']->getFirstCell("SELECT name FROM ".PLANETS." WHERE id = ".$this->_fleet['fleet_start_id'].";");
		$TargetOwner	= $this->_fleet['fleet_target_owner'];
		$StartOwner		= $this->_fleet['fleet_owner'];
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
            '.$LNG['fleet_transport_1'].' '.date('d/m/Y H:i:s', TIMESTAMP).'<br>
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
            '.$LNG['fleet_transport_2'].' '.date('d/m/Y H:i:s', TIMESTAMP).'<br>
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
		
		
		SendSimpleMessage($this->_fleet['fleet_owner'], 0, $this->_fleet['fleet_end_time'], 5, $LNG['sys_mess_tower_transport'], $LNG['sys_mess_fleetback'], $Message);
		$this->RestoreFleet();
	}
}