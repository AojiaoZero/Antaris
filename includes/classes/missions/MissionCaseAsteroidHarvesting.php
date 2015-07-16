<?php

class MissionCaseAsteroidHarvesting extends MissionFunctions
{
	function __construct($Fleet)
	{
		$this->_fleet	= $Fleet;
	}
	
	function TargetEvent()
	{	
		global $db, $pricelist, $LANG,$CONF, $UNI;
		
		$UsedPlanet 	= $GLOBALS['DATABASE']->getFirstCell("SELECT COUNT(*) FROM ".PLANETS." WHERE `id` = '".$this->_fleet['fleet_end_id']."';");
        $Target2			 = $GLOBALS['DATABASE']->uniquequery("SELECT id_owner, der_metal, der_crystal, der_deuterium,(der_metal + der_crystal + der_deuterium) as der_total FROM ".PLANETS." WHERE `id` = '".$this->_fleet['fleet_end_id']."';");        
        $senderUser		= $GLOBALS['DATABASE']->getFirstRow("SELECT * FROM ".USERS." WHERE id = ".$this->_fleet['fleet_owner'].";");
		$targetUser		= $GLOBALS['DATABASE']->getFirstRow("SELECT * FROM ".USERS." WHERE id = ".$this->_fleet['fleet_target_owner'].";");        
        if(!$UsedPlanet || $Target2['id_owner'] != 9999)
		{
			$this->setState(FLEET_RETURN);
		}else{
		$Target				 = $GLOBALS['DATABASE']->uniquequery("SELECT id, id_owner, der_metal, der_crystal, der_deuterium,(der_metal + der_crystal + der_deuterium) as der_total FROM ".PLANETS." WHERE `id` = '".$this->_fleet['fleet_end_id']."';");
		$FleetRecord         = explode(";", $this->_fleet['fleet_array']);
		$RecyclerCapacity    = 0;
		$OtherFleetCapacity  = 0;
                
                
		foreach ($FleetRecord as $Item => $Group)
		{
			if (empty($Group))
				continue;
				
			$Class        = explode (",", $Group);
			if ($Class[0] == 209 || $Class[0] == 219 || $Class[0] == 223)
				$RecyclerCapacity   += $pricelist[$Class[0]]['capacity'] * $Class[1];
			else
				$OtherFleetCapacity += 0;
		}
		
		$temporary = array('der_metal' => $Target['der_metal'],'der_crystal' => $Target['der_crystal'],'der_deuterium' => $Target['der_deuterium']);
		
		$RecycledGoods	= array('der_metal' => 0, 'der_crystal' => 0, 'der_deuterium' => 0);
		$IncomingFleetGoods = $this->_fleet['fleet_resource_metal'] + $this->_fleet['fleet_resource_crystal'] + $this->_fleet['fleet_resource_deuterium'];
		if ($IncomingFleetGoods > $OtherFleetCapacity)
			$RecyclerCapacity -= ($IncomingFleetGoods - $OtherFleetCapacity);

		if ($Target['der_total'] <= $RecyclerCapacity) {
			$RecycledGoods['der_metal']   = $Target['der_metal'];
			$RecycledGoods['der_crystal'] = $Target['der_crystal'];
			$RecycledGoods['der_deuterium'] = $Target['der_deuterium'];
			$temporary['der_metal'] -= $Target['der_metal'];
			$temporary['der_crystal'] -= $Target['der_crystal'];
			$temporary['der_deuterium'] -= $Target['der_deuterium'];
			
		} elseif (($Target['der_metal'] > $RecyclerCapacity / 2) && ($Target['der_crystal'] > $RecyclerCapacity / 2)&& ($Target['der_deuterium'] > $RecyclerCapacity / 2)) {
			$RecycledGoods['der_metal']   = $RecyclerCapacity / 2;
			$RecycledGoods['der_crystal'] = $RecyclerCapacity / 2;
			$RecycledGoods['der_deuterium'] = $RecyclerCapacity / 2;
			
			$temporary['der_metal'] -= $RecyclerCapacity / 2;
			$temporary['der_crystal'] -= $RecyclerCapacity / 2;
			$temporary['der_deuterium'] -= $RecyclerCapacity / 2;
			
		} elseif ($Target['der_metal'] > $Target['der_crystal']) {
			$RecycledGoods['der_crystal'] = $Target['der_crystal'];
			$temporary['der_crystal'] -= $Target['der_crystal'];
			if ($Target['der_metal'] > ($RecyclerCapacity - $RecycledGoods['der_crystal'])){
				$RecycledGoods['der_metal'] = $RecyclerCapacity - $RecycledGoods['der_crystal'];
				$temporary['der_metal'] -= $RecyclerCapacity - $RecycledGoods['der_crystal'];}
			else{
				$RecycledGoods['der_metal'] = $Target['der_metal'];
				$temporary['der_metal'] -= $Target['der_metal'];
				}
		} else {
			$RecycledGoods['der_metal'] = $Target['der_metal'];
			$temporary['der_metal'] -= $Target['der_metal'];
			if ($Target['der_crystal'] > ($RecyclerCapacity - $RecycledGoods['der_metal'])){
				$RecycledGoods['der_crystal'] = $RecyclerCapacity - $RecycledGoods['der_metal'];
				$temporary['der_crystal'] -= $RecyclerCapacity - $RecycledGoods['der_metal'];
				}
			else{
				$RecycledGoods['der_crystal'] = $Target['der_crystal'];
				$temporary['der_crystal'] -= $Target['der_crystal'];
				}
		}		
		if($Target['id_owner'] = 9999 && $Target['id'] != 706 && empty($temporary['der_metal']) && empty($temporary['der_crystal']) && empty($temporary['der_deuterium'])){
			$GLOBALS['DATABASE']->query("DELETE from ".PLANETS." where `id` = '".$this->_fleet['fleet_end_id']."';");
			
		}else{
		$GLOBALS['DATABASE']->query("UPDATE ".PLANETS." SET `der_metal` = `der_metal` - ".$RecycledGoods['der_metal'].", `der_crystal` = `der_crystal` - ".$RecycledGoods['der_crystal'].", `der_deuterium` = `der_deuterium` - ".$RecycledGoods['der_deuterium']." WHERE `id` = '".$this->_fleet['fleet_end_id']."';");

                }
				
        if($RecycledGoods['der_metal'] < 0) { 
		$RecycledGoods['der_metal'] = 0;
		}
		if($RecycledGoods['der_crystal'] < 0) { 
		$RecycledGoods['der_crystal'] = 0;
		}
		if($RecycledGoods['der_deuterium'] < 0) { 
		$RecycledGoods['der_deuterium'] = 0;
		}
        $GLOBALS['DATABASE']->query("UPDATE ".FLEETS." set `fleet_resource_metal` = `fleet_resource_metal` + ".$RecycledGoods['der_metal'].", `fleet_resource_crystal` = `fleet_resource_crystal` + ".$RecycledGoods['der_crystal'].", `fleet_resource_deuterium` = `fleet_resource_deuterium` + ".$RecycledGoods['der_deuterium']." where `fleet_id` = ".$this->_fleet['fleet_id']." ;");
		

					
		 $LNG			= $this->getLanguage($senderUser['lang']);
		
		if($RecycledGoods['der_metal'] + $RecycledGoods['der_crystal'] + $RecycledGoods['der_deuterium'] == 0){
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
							  pretty_number($RecycledGoods['der_metal']), $LNG['tech'][901], 
							  pretty_number($RecycledGoods['der_crystal']), $LNG['tech'][902],
							  pretty_number($RecycledGoods['der_deuterium']), $LNG['tech'][903]
		);
	}
		
		
		
		SendSimpleMessage($this->_fleet['fleet_owner'], 0, $this->_fleet['fleet_start_time'], 5, $LNG['sys_mess_tower'], $LNG['sys_recy_report'], $Message);
		
		
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
		global $LANG;
		$LNG				= $this->getLanguage(NULL, $this->_fleet['fleet_owner']);
		
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
            '.$LNG['fleet_aster_1'].' '.date('d/m/Y H:i:s', TIMESTAMP).'<br>
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
            '.$LNG['fleet_aster_2'].' '.date('d/m/Y H:i:s', TIMESTAMP).'<br>
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
	
		SendSimpleMessage($this->_fleet['fleet_owner'], 0, $this->_fleet['fleet_end_time'], 5, $LNG['sys_mess_tower'], $LNG['sys_mess_fleetback'], $Message);

		$this->RestoreFleet();
	}
}
?>