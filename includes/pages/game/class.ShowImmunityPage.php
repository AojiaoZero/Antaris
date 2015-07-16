<?php

class ShowImmunityPage extends AbstractPage
{
    public static $requireModule = 0;

	function __construct() 
	{
		parent::__construct();
	}
	
	
	function buy(){
	global $USER, $PLANET, $LNG, $UNI, $CONF,$resource,$pricelist;
	$mode   = HTTP::_GP('immunity', '');
	$fleets = $GLOBALS['DATABASE']->getFirstCell("SELECT COUNT(*) FROM ".FLEETS." WHERE `fleet_owner` = ".$USER['id']." OR `fleet_target_owner` = ".$USER['id'].";");
	
	if($mode == ''){
		$this->printMessage('<span class="rouge">please select the option you want to purchase</span>', true, array('game.php?page=Immunity', 2));
	}elseif($mode == 'three'){
	if($USER['darkmatter'] < 1){
	$this->printMessage('<span class="rouge">You dont have enough credits to purchase this option</span>', true, array('game.php?page=Immunity', 2));
	}elseif($USER['next_immunity'] > TIMESTAMP){
	$this->printMessage('<span class="rouge">Countdown is not finished</span>', true, array('game.php?page=Immunity', 2));
	}if($fleets != 0){
    $this->printMessage("<span class='rouge'>Fleet mouvement!</span>", true, array('game.php?page=Immunity', 2));
    die();
    }else{
	$USER['darkmatter'] -= 1;
    $GLOBALS['DATABASE']->query("Update ".USERS." SET `immunity_until` = ".(TIMESTAMP + 60*60*24*3).", `next_immunity` = ".(TIMESTAMP + 10*60*60*24)." WHERE `id` = ".$USER['id']." ;");
	$GLOBALS['DATABASE']->query("INSERT INTO `uni1_achats_log` VALUES (null, '".TIMESTAMP."',  '".$USER['id']."', 'Immunity(3)', '1');");
	$this->printMessage("<span class='vert'>You succesfully activated the immunity function on your account</span>", true, array('game.php?page=immunity', 3));
    die();
    }
	}
	}

	function show(){
	global $USER, $PLANET, $LNG, $UNI, $CONF,$resource,$pricelist;
	if(!empty($USER['urlaubs_modus'])){
		$this->printMessage($LNG['vmodeblock'], true, array('game.php?page=Overview', 2));
		die();
	}
	$showCountdown = 0;
	if($USER['immunity_until'] < TIMESTAMP && $USER['next_immunity'] > TIMESTAMP){
	$showCountdown = 1;
	}
	
	$this->tplObj->loadscript('countdown.js');
		$this->tplObj->assign_vars(
				array(
       'immunity_active' => ((!empty($USER['immunity_until']) && $USER['immunity_until'] > TIMESTAMP) ? ($USER['immunity_until'] - TIMESTAMP) : 0),
		'immunity_active_cooldown' => ((!empty($USER['next_immunity']) && $USER['next_immunity'] > TIMESTAMP) ? ($USER['next_immunity'] - TIMESTAMP) : 0),
	   'showCountdown' => $showCountdown,
                                 )
		);
		$this->display("page.immunity.default.tpl");
	}
}
