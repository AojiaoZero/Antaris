<?php

class ShowAchievementsPage extends AbstractPage
{
            
	function __construct() 
	{
	parent::__construct();
	}
	
	function show(){
	global $USER, $PLANET, $LNG, $UNI, $CONF,$resource,$pricelist;

	if($USER['date_of_birth'] != 0 && $USER['sexe'] != null && $USER['achievement_todo'] == 1){
	$PLANET['metal'] += 100;
	$PLANET['crystal'] += 100;
	$GLOBALS['DATABASE']->query("UPDATE ".USERS." SET achievement_todo = '2' WHERE id = ".$USER['id']." ;");
	}
	if($PLANET['solar_plant'] >= 1 && $USER['achievement_todo'] == 2){
	$PLANET['metal'] += 100;
	$PLANET['crystal'] += 50;
	$PLANET['deuterium'] += 20;
	$GLOBALS['DATABASE']->query("UPDATE ".USERS." SET achievement_todo = '3' WHERE id = ".$USER['id']." ;");
	}
	if($PLANET['metal_mine'] >= 1 && $USER['achievement_todo'] == 3){
	$PLANET['metal'] += 75;
	$GLOBALS['DATABASE']->query("UPDATE ".USERS." SET achievement_todo = '4' WHERE id = ".$USER['id']." ;");
	}
	if($PLANET['crystal_mine'] >= 1 && $PLANET['deuterium_sintetizer'] >= 1 && $PLANET['elyrium_mine'] >= 1 && $USER['achievement_todo'] == 4){
	$PLANET['metal'] += 500;
	$PLANET['crystal'] += 300;
	$PLANET['deuterium'] += 25;
	$GLOBALS['DATABASE']->query("UPDATE ".USERS." SET achievement_todo = '5' WHERE id = ".$USER['id']." ;");
	}
	if($PLANET['metal_mine'] >= 5 && $PLANET['crystal_mine'] >= 5 && $PLANET['deuterium_sintetizer'] >= 4 && $PLANET['elyrium_mine'] >= 3 && $USER['achievement_todo'] == 5){
	$PLANET['metal'] += 4000;
	$PLANET['crystal'] += 3000;
	$PLANET['deuterium'] += 1500;
	$PLANET['elyrium'] += 1000;
	$GLOBALS['DATABASE']->query("UPDATE ".USERS." SET achievement_todo = '6' WHERE id = ".$USER['id']." ;");
	}
	if($PLANET['robot_factory'] >= 3 && $USER['achievement_todo'] == 6){
	$PLANET['metal'] += 3000;
	$PLANET['crystal'] += 2200;
	$PLANET['deuterium'] += 300;
	$PLANET['elyrium'] += 150;
	$GLOBALS['DATABASE']->query("UPDATE ".USERS." SET achievement_todo = '7' WHERE id = ".$USER['id']." ;");
	}
	if($PLANET['laboratory'] >= 3 && $USER['achievement_todo'] == 7){
	$PLANET['metal'] += 2500;
	$PLANET['crystal'] += 5000;
	$PLANET['deuterium'] += 650;
	$PLANET['elyrium'] += 150;
	$GLOBALS['DATABASE']->query("UPDATE ".USERS." SET achievement_todo = '8' WHERE id = ".$USER['id']." ;");
	}
	if($PLANET['metal_store'] >= 1 && $PLANET['crystal_store'] >= 1 && $USER['defence_tech'] >= 2 && $USER['achievement_todo'] == 8){
	$PLANET['metal'] += 10000;
	$PLANET['crystal'] += 3000;
	$GLOBALS['DATABASE']->query("UPDATE ".USERS." SET achievement_todo = '9' WHERE id = ".$USER['id']." ;");
	}
	if($PLANET['barracks'] >= 2 && $USER['control_room_tech'] >= 3 && $USER['achievement_todo'] == 9){
	$PLANET['metal'] += 1500;
	$PLANET['crystal'] += 1500;
	$GLOBALS['DATABASE']->query("UPDATE ".USERS." SET achievement_todo = '10' WHERE id = ".$USER['id']." ;");
	}
	if($USER['energy_tech'] >= 6 && $USER['control_room_tech'] >= 5 && $USER['particle_tech'] >= 4 && $USER['achievement_todo'] == 10){
	$PLANET['metal'] += 35850;
	$PLANET['crystal'] += 31000;
	$PLANET['deuterium'] += 21475;
	$PLANET['elyrium'] += 9625;
	$GLOBALS['DATABASE']->query("UPDATE ".USERS." SET achievement_todo = '11' WHERE id = ".$USER['id']." ;");
	}
	if($PLANET['barracks'] >= 6 && $PLANET['scientist'] >= 10 && $PLANET['soldier'] >= 100 && $USER['achievement_todo'] == 11){
	$PLANET['metal'] += 30000;
	$PLANET['crystal'] += 30000;
	
	$GLOBALS['DATABASE']->query("UPDATE ".USERS." SET achievement_todo = '12' WHERE id = ".$USER['id']." ;");
	}
	$iPlanetCount 	= $GLOBALS['DATABASE']->getFirstCell("SELECT COUNT(*) FROM ".PLANETS." WHERE `id_owner` = '". $USER['id'] ."' AND `planet_type` = '1' AND `destruyed` = '0';");
	if($iPlanetCount >= 2 && $USER['achievement_todo'] == 12){
	if($USER['mode_chaine'] < TIMESTAMP){
	$GLOBALS['DATABASE']->query("UPDATE ".USERS." SET mode_chaine = '".(TIMESTAMP + 5 * 24 * 3600)."', achievement_todo = '13' WHERE id = ".$USER['id']." ;");
	}else{
	$GLOBALS['DATABASE']->query("UPDATE ".USERS." SET mode_chaine = mode_chaine + '".(5 * 24 * 3600)."', achievement_todo = '13' WHERE id = ".$USER['id']." ;");
	}
	}
	if($PLANET['hangar'] >= 2 && $USER['infrastructure_tech'] >= 2 && $USER['combustion_tech'] >= 2 && $USER['energy_tech'] >= 2 && $USER['achievement_todo'] == 13){
	$PLANET['metal'] += 1000;
	$PLANET['crystal'] += 900;
	$PLANET['deuterium'] += 575;
	$PLANET['elyrium'] += 450;
	$GLOBALS['DATABASE']->query("UPDATE ".USERS." SET achievement_todo = '14' WHERE id = ".$USER['id']." ;");
	}
	$total  = $GLOBALS['DATABASE']->query("SELECT SUM(small_ship_cargo + big_ship_cargo + light_hunter + heavy_hunter + crusher + battle_ship + colonizer + recycler + spy_sonde + bomber_ship + destructor + dearth_star + battleship + lune_noir + ev_transporter + star_crasher + giga_recykler + dm_ship) as ships from ".PLANETS." where `id_owner` = '".$USER['id']."' ;");
	$total  = $GLOBALS['DATABASE']->fetch_array($total);
	if($total['ships'] >= 1 && $USER['achievement_todo'] == 14){
	if($USER['mode_rapide'] < TIMESTAMP){
	$USER['darkmatter'] +=5;
	$GLOBALS['DATABASE']->query("UPDATE ".USERS." SET mode_rapide = '".(TIMESTAMP + 5 * 24 * 3600)."', achievement_todo = '15' WHERE id = ".$USER['id']." ;");
	}else{
	$USER['darkmatter'] +=5;
	$GLOBALS['DATABASE']->query("UPDATE ".USERS." SET mode_rapide = mode_rapide + '".(5 * 24 * 3600)."', achievement_todo = '15' WHERE id = ".$USER['id']." ;");
	}
	$GLOBALS['DATABASE']->query("INSERT INTO `uni1_paysafecard_log` VALUES ('".$GLOBALS['DATABASE']->GetInsertID()."', '".$USER['id']."',  '".TIMESTAMP."', '".$LNG['achat_succes_11']."', '0','5', '".$LNG['achat_succes_10']."', '1', '0');");
	
	} 
	
	$this->tplObj->loadscript('achievements.js');
	$this->tplObj->assign_vars(
	array(
    'achievement_todo' => $USER['achievement_todo'],                         
	));
	$this->display("page.achievements.default.tpl");
	}
}