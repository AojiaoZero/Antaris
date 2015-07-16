<?php

class ShowTowerPage extends AbstractPage
{
            
	function __construct() 
	{
		parent::__construct();
	}
	function delete(){
	global $USER, $PLANET, $LNG, $UNI, $CONF,$resource,$pricelist;
	$planetid		= HTTP::_GP('planetid', '');
	$this->tplObj->loadscript('overview.actions.js');
	if($planetid == ''){
	$this->printMessage("<span class='rouge'>Incorect String!</span>", true, array('game.php?page=Tower', 2));
	}
	$isAllowed = $GLOBALS['DATABASE']->query("SELECT id_owner FROM ".PLANETS." WHERE id = ".$planetid." AND destruyed = '0';");
	if($GLOBALS['DATABASE']->numRows($isAllowed) == 0){
	$this->printMessage("<span class='rouge'>No data found!</span>", true, array('game.php?page=Tower', 2));
	}
	while($x = $GLOBALS['DATABASE']->fetch_array($isAllowed)){
	if($x['id_owner'] != $USER['id']){
	$this->printMessage("<span class='rouge'>The planet is not yours!</span>", true, array('game.php?page=Tower', 2));
	}elseif($planetid == $USER['id_planet']){
	$this->printMessage("<span class='rouge'>You can not delete your main planet!</span>", true, array('game.php?page=Tower', 2));
	}
	}
	$this->tplObj->assign_vars(
	array(
   	'antaris_headpost' => $PLANET['antaris_headpost'],  
	'headquarters_antaris' => $PLANET['headquarters_antaris'], 
	));
	$this->display("page.tower.delete.tpl");
	}
	function show(){
	global $USER, $PLANET, $LNG, $UNI, $CONF,$resource,$pricelist;
	if(!empty($USER['urlaubs_modus'])){
		$this->printMessage($LNG['vmodeblock'], true, array('game.php?page=Overview', 2));
		die();
	}
	$allowDelete = 0;
	if($PLANET['id'] == $USER['id_planet']){
	$allowDelete = 1;
	}
	$this->tplObj->assign_vars(
	array(
    'antaris_headpost' => $PLANET['antaris_headpost'],  
	'headquarters_antaris' => $PLANET['headquarters_antaris'], 
	'namer' => $PLANET['name'],                                
    'galaxy' => $PLANET['galaxy'],                                
    'system' => $PLANET['system'],                                
    'planet' => $PLANET['planet'],   			
    'planetidd' => $PLANET['id'],  
	'planetimage' => $PLANET['image'], 		
    'allowDelete' => $allowDelete,   			
	));
	$this->display("page.tower.default.tpl");
	}
	function portal(){
	global $USER, $PLANET, $LNG, $UNI, $CONF,$resource,$pricelist;
	$allowPortal = 0;
	if($USER['energy_tech'] >= 6 && $USER['control_room_tech'] >= 5 && $USER['particle_tech'] >= 4){
	$allowPortal = 1;
	}
	if (!empty($_POST))
	{
	$cmdd		= HTTP::_GP('cmdd', '', UTF8_SUPPORT);
	$isAllowed = $GLOBALS['DATABASE']->query("SELECT * FROM ".PLANETS." WHERE id_owner = ".$USER['id']." AND teleport_portal = '0';");
	if($cmdd == "portal"){
	if($PLANET['teleport_portal_timer'] > TIMESTAMP){
	$this->printMessage("<span class='rouge'>You did not respect the timers!</span>", true, array('game.php?page=Tower&mode=portal', 2));
	}else{
	$GLOBALS['DATABASE']->query("UPDATE ".PLANETS." SET teleport_portal = '1', teleport_portal_timer = ".(TIMESTAMP + 24 * 60 * 60)." WHERE id = '".$PLANET['id']."'");
	$this->printMessage("<span class='vert'>Your portal is activated!</span>", true, array('game.php?page=Tower&mode=portal', 2));
	}
	}elseif($cmdd == "force"){
	if($PLANET['teleport_portal'] == 0){
	$this->printMessage("<span class='rouge'>Portal is not activated</span>", true, array('game.php?page=Tower&mode=portal', 2));
	}elseif($PLANET['force_field_timer'] > TIMESTAMP){
	$this->printMessage("<span class='rouge'>You did not respect the timers!</span>", true, array('game.php?page=Tower&mode=portal', 2));
	}else{
	$GLOBALS['DATABASE']->query("UPDATE ".PLANETS." SET force_field_timer = ".(TIMESTAMP + 24 * 60 * 60).", force_field_timer_bis = ".(TIMESTAMP + 48 * 60 * 60)." WHERE id = '".$PLANET['id']."'");
	$this->printMessage("<span class='vert'>Your force field is activated!</span>", true, array('game.php?page=Tower&mode=portal', 2));
	}
	}elseif($cmdd == "desportal"){
	if($GLOBALS['DATABASE']->numRows($isAllowed) < 3){
	$GLOBALS['DATABASE']->query("UPDATE ".PLANETS." SET  teleport_portal  = '0', teleport_portal_timer = ".(TIMESTAMP + 24 * 60 * 60)." WHERE id = '".$PLANET['id']."'");
	$this->printMessage("<span class='rouge'>The portal is succesfully desactivated", true, array('game.php?page=Tower&mode=portal', 2));
	}else{
	$this->printMessage("<span class='rouge'>You have already 3 portals closed</span>", true, array('game.php?page=Tower&mode=portal', 2));
	}
	}
	}
	$showMessagePortal = 0;
	if($PLANET['teleport_portal'] == 1 && $PLANET['teleport_portal_timer'] > TIMESTAMP){
	$showMessagePortal = 1;
	}elseif($PLANET['teleport_portal'] == 1 && $PLANET['teleport_portal_timer'] < TIMESTAMP){
	$showMessagePortal = 2;
	}elseif($PLANET['teleport_portal'] == 0 && $PLANET['teleport_portal_timer'] > TIMESTAMP){
	$showMessagePortal = 3;
	}else{
	$showMessagePortal = 0;
	}
	$showMessageForce = 0;
	if($PLANET['force_field_timer_bis'] > TIMESTAMP && $PLANET['force_field_timer'] > TIMESTAMP){
	$showMessageForce = 1;
	}elseif($PLANET['force_field_timer_bis'] > TIMESTAMP && $PLANET['force_field_timer'] < TIMESTAMP){
	$showMessageForce = 2;
	}elseif($PLANET['force_field_timer_bis'] < TIMESTAMP){
	$showMessageForce = 0;
	}
	$this->tplObj->assign_vars(
	array(
	'showMessagePortal' => $showMessagePortal,  
	'showMessageForce' => $showMessageForce,  
	'antaris_headpost' => $PLANET['antaris_headpost'],  
	'headquarters_antaris' => $PLANET['headquarters_antaris'],                                  
	'allowPortal' => $allowPortal,                                  
	'energy_tech' => $USER['energy_tech'],                                  
	'control_room_tech' => $USER['control_room_tech'],                                  
	'particle_tech' => $USER['particle_tech'],                                  
	'TIMESTAMP' => TIMESTAMP,                                  
	'teleport_portal' => $PLANET['teleport_portal'],                                  
	'force_field_timer_show' => $PLANET['force_field_timer'],     
	'force_field_timer_end' =>  str_replace(' ', '&nbsp;', _date($LNG['php_tdformat'], $PLANET['force_field_timer']), $USER['timezone']),	
	'force_field_timer' =>  str_replace(' ', '&nbsp;', _date($LNG['php_tdformat'], $PLANET['force_field_timer_bis']), $USER['timezone']),                                 
	'teleport_portal_timer' =>  str_replace(' ', '&nbsp;', _date($LNG['php_tdformat'], $PLANET['teleport_portal_timer']), $USER['timezone']),                
	));
	$this->display("page.tower.portal.tpl");
	}
	function siege(){
	global $USER, $PLANET, $LNG, $UNI, $CONF,$resource,$pricelist;
	if($PLANET['headquarters_antaris'] == 0){
	$this->printMessage("<span class='rouge'>you dont met the requirements!</span>", true, array('game.php?page=siege', 2));
	}else{
	if (!empty($_POST)){
	$methode		= HTTP::_GP('methode', '', UTF8_SUPPORT);
	if($methode == "reactor"){
	if($PLANET['elyrium_reactor'] < 1){
	$this->printMessage("<span class='rouge'>You need more elyrium reactors</span>", true, array('game.php?page=Tower&mode=siege', 2));
	}else{
	$GLOBALS['DATABASE']->query("UPDATE ".PLANETS." SET  siege_on  = ".(TIMESTAMP + 24*60*60).", elyrium_reactor = elyrium_reactor - '1' WHERE id = '".$PLANET['id']."'");
	$this->printMessage("<span class='vert'>Headquarters is succesfully feeded</span>", true, array('game.php?page=Tower&mode=siege', 2));
	}
	}else{
	if($PLANET['energy_modulator'] < 1){
	$this->printMessage("<span class='rouge'>You need more energy modulators</span>", true, array('game.php?page=Tower&mode=siege', 2));
	}else{
	$GLOBALS['DATABASE']->query("UPDATE ".PLANETS." SET  siege_on  = ".(TIMESTAMP + 31*24*60*60).", energy_modulator = energy_modulator - '1' WHERE id = '".$PLANET['id']."'");
	$this->printMessage("<span class='vert'>Headquarters is succesfully feeded</span>", true, array('game.php?page=Tower&mode=siege', 2));
	}
	}
	}
	$showMessage=0;
	if($PLANET['siege_on'] > TIMESTAMP){
	$showMessage=1;
	}
	$this->tplObj->assign_vars(
	array(
	'antaris_headpost' => $PLANET['antaris_headpost'],  
	'headquarters_antaris' => $PLANET['headquarters_antaris'],                                      
	'siege_timer_time' => $PLANET['siege_on'],                                      
	'showMessage' => $showMessage,                        
	'timing' => TIMESTAMP,                        
	'siege_timer' =>  str_replace(' ', '&nbsp;', _date($LNG['php_tdformat'], $PLANET['siege_on']), $USER['timezone']),  
	));
	$this->display("page.tower.siege.tpl");
	}
	}
	  
	
	function construct(){
	global $USER, $PLANET, $LNG, $UNI, $CONF,$resource,$pricelist;
		
	if (!empty($_POST)){
	$cmdd		= HTTP::_GP('cmdd', '', UTF8_SUPPORT);
	$nb_technicien		= HTTP::_GP('nb_technicien', '');
	$nb_scientifique		= HTTP::_GP('nb_scientifique', '');
	$former_amount		= HTTP::_GP('former_amount', '');
	
	$nb_technicien = str_replace('.', '', $nb_technicien);
	$nb_technicien = str_replace(' ', '', $nb_technicien);
	$nb_scientifique = str_replace('.', '', $nb_scientifique);
	$nb_scientifique = str_replace(' ', '', $nb_scientifique);
	
	$MaxUsine = pow(2.0,$PLANET['robot_factory'])*5309;
	$MaxUsine2 = pow(2.0,$PLANET['laboratory'])*5309;
	
	if($cmdd == "technic"){
	if($former_amount < $nb_technicien){
	$newAmount = $nb_technicien - $former_amount;
	if($PLANET['technician'] - $newAmount >= 0 && $newAmount < $MaxUsine){
	$PLANET['technician'] -= $newAmount;
	$GLOBALS['DATABASE']->query("UPDATE ".PLANETS." SET  technician_used  = technician_used + ".$newAmount.", technician = technician - ".$newAmount." WHERE id = '".$PLANET['id']."'");
	$this->printMessage("<span class='vert'>change succesfully made</span>", true, array('game.php?page=Tower&mode=construct', 2));
	}elseif($newAmount > $MaxUsine){
	$this->printMessage("<span class='rouge'>You hired to much technicians</span>", true, array('game.php?page=Tower&mode=construct', 2));
	}else{
	$this->printMessage("<span class='rouge'>you dont have enough technicians</span>", true, array('game.php?page=Tower&mode=construct', 2));
	}
	}elseif($former_amount > $nb_technicien){
	$newAmount = $former_amount - $nb_technicien;
	if($PLANET['technician_used'] - $newAmount >= 0 && $newAmount < $MaxUsine){
	$PLANET['technician'] += $newAmount;
	$GLOBALS['DATABASE']->query("UPDATE ".PLANETS." SET  technician_used  = technician_used - ".$newAmount.", technician = technician + ".$newAmount." WHERE id = '".$PLANET['id']."'");
	$this->printMessage("<span class='vert'>change succesfully made</span>", true, array('game.php?page=Tower&mode=construct', 2));
	}elseif($newAmount > $MaxUsine){
	$this->printMessage("<span class='rouge'>You hired to much technicians</span>", true, array('game.php?page=Tower&mode=construct', 2));
	}else{
	$this->printMessage("<span class='rouge'>you dont have enough technicians used</span>", true, array('game.php?page=Tower&mode=construct', 2));
	}
	}elseif($former_amount == $nb_technicien){
	//continue
	}
	  
	}else{
	if($former_amount < $nb_scientifique){
	$newAmount = $nb_scientifique - $former_amount;
	if($PLANET['scientist'] - $newAmount >= 0 && $newAmount < $MaxUsine2){
	$PLANET['scientist'] -= $newAmount;
	$GLOBALS['DATABASE']->query("UPDATE ".PLANETS." SET  scientis_used  = scientis_used + ".$newAmount.", scientist = scientist - ".$newAmount." WHERE id = '".$PLANET['id']."'");
	$this->printMessage("<span class='vert'>change succesfully made</span>", true, array('game.php?page=Tower&mode=construct', 2));
	}elseif($newAmount > $MaxUsine2){
	$this->printMessage("<span class='rouge'>You hired to much scientist</span>", true, array('game.php?page=Tower&mode=construct', 2));
	}else{
	$this->printMessage("<span class='rouge'>you dont have enough scientis</span>", true, array('game.php?page=Tower&mode=construct', 2));
	}
	}elseif($former_amount > $nb_scientifique){
	$newAmount = $former_amount - $nb_scientifique;
	if(($PLANET['scientis_used'] - $newAmount) >= 0 && $newAmount < $MaxUsine2){
	$PLANET['scientist'] += $newAmount;
	$GLOBALS['DATABASE']->query("UPDATE ".PLANETS." SET  scientis_used  = scientis_used - ".$newAmount.", scientist = scientist + ".$newAmount." WHERE id = '".$PLANET['id']."'");
	$this->printMessage("<span class='vert'>change succesfully made</span>", true, array('game.php?page=Tower&mode=construct', 2));
	}elseif($newAmount > $MaxUsine2){
	$this->printMessage("<span class='rouge'>You hired to much scientist</span>", true, array('game.php?page=Tower&mode=construct', 2));
	}else{
	$this->printMessage("<span class='rouge'>you dont have enough scientis used</span>", true, array('game.php?page=Tower&mode=construct', 2));
	}
	}elseif($former_amount == $nb_scientifique){
	//continue
	}
	
	}
	}
	$MaxUsine = pow(2.0,$PLANET['robot_factory'])*5309;
	$MaxUsine2 = pow(2.0,$PLANET['laboratory'])*5309;
	$this->tplObj->assign_vars(
	array(
	'MaxUsine' => pretty_number($MaxUsine),  
	'MaxUsine2' => pretty_number($MaxUsine2),  
	'antaris_headpost' => $PLANET['antaris_headpost'],  
	'headquarters_antaris' => $PLANET['headquarters_antaris'],  
	'robot_factory' => $PLANET['robot_factory'],  
	'laboratory' => $PLANET['laboratory'],  
	'technicien' => pretty_number($PLANET['technician']),  
	'scientist' => pretty_number($PLANET['scientist']),  
	'technician_used' => pretty_number($PLANET['technician_used']),  
	'technician_used_bis' => $PLANET['technician_used'],  
	'scientis_used' => pretty_number($PLANET['scientis_used']),  
	'scientis_used_bis' => $PLANET['scientis_used'],  
	'reduce_build' => $PLANET['technician_used']*0.00005,  
	'reduce_tech' => $PLANET['scientis_used']*0.00005,  
	
	));
	$this->display("page.tower.construct.tpl");
	}
	
	
	
	
	
	
	function outpost(){
		global $USER, $PLANET, $LNG, $UNI, $CONF,$resource,$pricelist;
		
		if($USER['id'] != 1){
		$this->printMessage('<span class="rouge">This function will be avaible in version 1.2 of Antaris Legacy</span>',  true, array('game.php?page=overview', 3)); 	
		}
		
		if($PLANET['antaris_headpost'] == 0){
		$this->printMessage("<span class='rouge'>you dont met the requirements!</span>", true, array('game.php?page=Tower', 2));
		}
		$this->tplObj->assign_vars(
				array(
               'antaris_headpost' => $PLANET['antaris_headpost'],  
			   'headquarters_antaris' => $PLANET['headquarters_antaris'], 			   
                                        )
		);
		$this->display("page.tower.outpost.tpl");
	}
	
	function newimage(){
	global $USER, $PLANET, $LNG, $UNI, $CONF,$resource,$pricelist;
		
	$this->tplObj->assign_vars(array(
    'antaris_headpost' => $PLANET['antaris_headpost'],  
	'headquarters_antaris' => $PLANET['headquarters_antaris'], 			   	   
    ));
	$this->display("page.tower.newimage.tpl");
	}
	function newimagecheck(){
	global $USER, $PLANET, $LNG, $UNI, $CONF,$resource,$pricelist;
	$newImage		= HTTP::_GP('imageid', '');	
	$GLOBALS['DATABASE']->query("UPDATE ".PLANETS." SET  image  = '".$newImage."' WHERE id = '".$PLANET['id']."'");
	$this->sendJSON('OK');	
	
	}
}