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
 * @info $Id: class.ShowSearchPage.php 2632 2013-03-18 19:05:14Z slaver7 $
 * @link http://2moons.cc/
 */

class ShowPlanetcloakPage extends AbstractPage
{
	
	
	function __construct() {
		parent::__construct();
	}

	function buy()
	{
		global $USER, $LNG, $THEME;
		$days   = HTTP::_GP('planetcloak', '');
		if($days == ''){
		$this->printMessage('<span class="rouge">please select the option you want to purchase</span>', true, array('game.php?page=Planetcloak', 2));
		}elseif($days == 'one'){
		if($USER['darkmatter'] < 1){
		$this->printMessage('<span class="rouge">You dont have enough credits to purchase this option</span>', true, array('game.php?page=Planetcloak', 2));
		}elseif($USER['planet_cloak_countdown'] > TIMESTAMP){
		$this->printMessage('<span class="rouge">Countdown is not finished</span>', true, array('game.php?page=Planetcloak', 2));
		}else{
		$USER['darkmatter'] -= 1;
		$GLOBALS['DATABASE']->query("Update ".USERS." SET `planet_cloak` = ".(TIMESTAMP + 24 * 60 * 60).", `planet_cloak_countdown` = ".(TIMESTAMP + 8 * 24 * 60 * 60)." WHERE `id` = ".$USER['id'].";");
		//$GLOBALS['DATABASE']->query("INSERT INTO uni1_planetcloak_log VALUES ('".$GLOBALS['DATABASE']->GetInsertID()."','".$USER['id']."','".TIMESTAMP."','1');");
		$GLOBALS['DATABASE']->query("INSERT INTO `uni1_achats_log` VALUES (null, '".TIMESTAMP."',  '".$USER['id']."', 'Pcloak(1)', '1');");
		$this->printMessage('<span class="vert">You succesfully activated planet cloak for 1 days</span>', true, array('game.php?page=Planetcloak', 2));
		}
		}elseif($days == 'seven'){
		if($USER['darkmatter'] < 3){
		$this->printMessage('<span class="rouge">You dont have enough credits to purchase this option</span>', true, array('game.php?page=Planetcloak', 2));
		}elseif($USER['planet_cloak_countdown'] > TIMESTAMP){
		$this->printMessage('<span class="rouge">Countdown is not finished</span>', true, array('game.php?page=Planetcloak', 2));
		}else{
		$USER['darkmatter'] -= 3;
		$GLOBALS['DATABASE']->query("Update ".USERS." SET `planet_cloak` = ".(TIMESTAMP + 7 * 24 * 60 * 60).", `planet_cloak_countdown` = ".(TIMESTAMP + 37 * 24 * 60 * 60)." WHERE `id` = ".$USER['id'].";");
		//$GLOBALS['DATABASE']->query("INSERT INTO uni1_planetcloak_log VALUES ('".$GLOBALS['DATABASE']->GetInsertID()."','".$USER['id']."','".TIMESTAMP."','5');");
		$GLOBALS['DATABASE']->query("INSERT INTO `uni1_achats_log` VALUES (null, '".TIMESTAMP."',  '".$USER['id']."', 'Pcloak(7)', '3');");
		$this->printMessage('<span class="vert">You succesfully activated planet cloak for 7 days</span>', true, array('game.php?page=Planetcloak', 2));
		}
		}
		
		
		$this->tplObj->assign_vars(array(
		
		));
		
		$this->display('page.planetcloak.default.tpl');
	}
	
	function show()
	{
		global $USER, $LNG, $THEME;
		
		if(!empty($USER['urlaubs_modus'])){
		$this->printMessage($LNG['vmodeblock'], true, array('game.php?page=Overview', 2));
		die();
	}
	
	
		$showCountdown = 0;
		if($USER['planet_cloak'] < TIMESTAMP && $USER['planet_cloak_countdown'] > TIMESTAMP){
		$showCountdown = 1;
		}
		
		$this->tplObj->loadscript("jquery.countdown.js");
		$this->tplObj->assign_vars(array(
		'cloak_active' => ((!empty($USER['planet_cloak']) && $USER['planet_cloak'] > TIMESTAMP) ? ($USER['planet_cloak'] - TIMESTAMP) : 0),
		'cloak_active_countdown' => ((!empty($USER['planet_cloak_countdown']) && $USER['planet_cloak_countdown'] > TIMESTAMP) ? ($USER['planet_cloak_countdown'] - TIMESTAMP) : 0),
		'showCountdown' => $showCountdown,
		));
		
		$this->display('page.planetcloak.default.tpl');
	}
}