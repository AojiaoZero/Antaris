<?php

class ShowGestionPage extends AbstractPage
{
            
	function __construct() 
	{
		parent::__construct();
	}
	
	function order(){
	global $USER, $PLANET, $LNG, $UNI, $CONF,$resource,$pricelist;
	
	$GetAll990 = $GLOBALS['DATABASE']->query("SELECT id FROM ".PLANETS." WHERE id_owner = ".$USER['id']." AND destruyed = '0' ;");
	$GetAll990 = $GLOBALS['DATABASE']->numRows($GetAll990);
	
	
	if (!empty($_POST)){
	$message = '';
	foreach ($_POST as $var => $val)
{


    if (strpos($var, 'classement_') !== false)
    {
        // Là tu sais que c'est un de tes nombreux select et $val égal l'ordre que ton user a défini pour cet élement
        $id = str_replace('classement_', '', $var);
        $ordre = $val;
		$message .= $ordre;
		$GLOBALS['DATABASE']->query("UPDATE ".PLANETS." SET ordernumber = ".$ordre." WHERE id = ".$id.";");
    }
}
	}
	$GetAll = $GLOBALS['DATABASE']->query("SELECT * FROM `uni1_planets` WHERE id_owner = ".$USER['id']." AND destruyed = '0' ORDER BY ordernumber ASC;");
	
	
	if($GLOBALS['DATABASE']->numRows($GetAll)>0){
	while($messageRow = $GLOBALS['DATABASE']->fetch_array($GetAll))
	{
	$messageList[$messageRow['id']]	= array(
			'orderID'		=> $messageRow['id'],
			'name'		=> $messageRow['name'],
			'galaxy'		=> $messageRow['galaxy'],
			'system'		=> $messageRow['system'],
			'planet'		=> $messageRow['planet'],
			'ordernumber'		=> $messageRow['ordernumber'],
		);
	}}
	$this->tplObj->assign_vars(
	array(
	'messageList' => $messageList,
	'GetAll990' => $GetAll990,
    ));
	$this->display("page.gestion.order.tpl");
	}

	
	function show(){
	global $USER, $PLANET, $LNG, $UNI, $CONF,$resource,$pricelist;
	$GetAll = $GLOBALS['DATABASE']->query("SELECT * FROM `uni1_planets` WHERE id_owner = ".$USER['id']." AND destruyed = '0' ORDER by ordernumber ASC;");
	$number = 1;
	if($GLOBALS['DATABASE']->numRows($GetAll)>0){
	while($messageRow = $GLOBALS['DATABASE']->fetch_array($GetAll))
	{
	
	if ($messageRow['b_building'] - TIMESTAMP > 0) {
			$Queue			= unserialize($messageRow['b_building_id']);
			$buildInfo['buildings']	= array(
				'id'		=> $Queue[0][0],
				'level'		=> $Queue[0][1],
				'timeleft'	=> $messageRow['b_building'] - TIMESTAMP,
				'time'		=> $messageRow['b_building'],
				'starttime'	=> pretty_time($messageRow['b_building'] - TIMESTAMP),
			);
		}
		else {
			$buildInfo['buildings']	= false;
		}
		
		/* As FR#206 (http://tracker.2moons.cc/view.php?id=206), i added the shipyard and research status here, but i add not them the template. */
		
		if (!empty($messageRow['b_hangar_id'])) {
			
			$Queue	= unserialize($messageRow['b_hangar_id']);
			//$time	= BuildFunctions::getBuildingTime($USER, $messageRow['id'], $Queue[0][0]) * $Queue[0][1];
			$time	= BuildFunctions::getBuildingTime($USER, 1, $Queue[0][0]) * $Queue[0][1];
			$buildInfo['fleet']	= array(
				'id'		=> $Queue[0][0],
				'level'		=> $Queue[0][1],
				'timeleft'	=> $time - $messageRow['b_hangar'],
				'time'		=> $time,
				'starttime'	=> pretty_time($time - $messageRow['b_hangar']),
			);
		}
		else {
			$buildInfo['fleet']	= false;
		}
		
		if (!empty($messageRow['b_defense_id'])) {
			
			$Queue	= unserialize($messageRow['b_defense_id']);
			//$time	= BuildFunctions::getBuildingTime($USER, $messageRow['id'], $Queue[0][0]) * $Queue[0][1];
			$time	= BuildFunctions::getBuildingTime($USER, 1, $Queue[0][0]) * $Queue[0][1];
			$buildInfo['defense']	= array(
				'id'		=> $Queue[0][0],
				'level'		=> $Queue[0][1],
				'timeleft'	=> $time - $messageRow['b_defense'],
				'time'		=> $time,
				'starttime'	=> pretty_time($time - $messageRow['b_defense']),
			);
		}
		else {
			$buildInfo['defense']	= false;
		}
		
		if ($USER['b_tech'] - TIMESTAMP > 0) {
			$Queue			= unserialize($USER['b_tech_queue']);
			$buildInfo['tech']	= array(
				'id'		=> $Queue[0][0],
				'level'		=> $Queue[0][1],
				'timeleft'	=> $USER['b_tech'] - TIMESTAMP,
				'time'		=> $USER['b_tech'],
				'starttime'	=> pretty_time($USER['b_tech'] - TIMESTAMP),
			);
		}
		else {
			$buildInfo['tech']	= false;
		}
		
	$messageList[$messageRow['id']]	= array(
			'buildInfo'		=> $buildInfo,
			'name'		=> $messageRow['name'],
			'galaxy'		=> $messageRow['galaxy'],
			'system'		=> $messageRow['system'],
			'planet'		=> $messageRow['planet'],
			'plid'		=> $messageRow['id'],
			'gmetal'		=> pretty_number($messageRow['metal']),
			'gcrystal'		=> pretty_number($messageRow['crystal']),
			'gdeuterium'		=> pretty_number($messageRow['deuterium']),
			'gelyrium'		=> pretty_number($messageRow['elyrium']),
			'gmetalpircent'		=> round($messageRow['metal'] * 100 / $messageRow['metal_max']),
			'gcrystalpircent'		=> round($messageRow['crystal'] * 100 / $messageRow['crystal_max']),
			'gdeuteriumpircent'		=> round($messageRow['deuterium'] * 100 / $messageRow['deuterium_max']),
			'gelyriumpircent'		=> round($messageRow['elyrium'] * 100 / $messageRow['elyrium_max']),
			'energypircent'		=> round(abs($messageRow['energy'] * ($messageRow['energy'] - abs($messageRow['energy_used'])) / 2) ),
			'field_current'		=> $messageRow['field_current'],
			'field_max'		=> $messageRow['field_max'],
			'teleport_portal'		=> $messageRow['teleport_portal'],
			'image'		=> $messageRow['image'],
			'force_field_timer'		=> $messageRow['force_field_timer'],
			'energy'		=> $messageRow['energy'],
			'energy_used'		=> $messageRow['energy_used'],
			'metal_mine_porcent'		=> $messageRow['metal_mine_porcent']*10,
			'crystal_mine_porcent'		=> $messageRow['crystal_mine_porcent']*10,
			'deuterium_sintetizer_porcent'		=> $messageRow['deuterium_sintetizer_porcent']*10,
			'elyrium_mine_porcent'		=> $messageRow['elyrium_mine_porcent']*10,
			'number'		=> $number++,
		);
	}}	    
	    
	$this->tplObj->assign_vars(
	array(
	'messageList' => $messageList,							
	'timinger' => TIMESTAMP,							
    ));
	$this->display("page.gestion.default.tpl");
	}
}