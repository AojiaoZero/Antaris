<?php

/**
 *  2Moons
 *  Copyright (C) 2011 Jan Kröpke
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
 * @copyright 2009 Lucky
 * @copyright 2011 Jan Kröpke <info@2moons.cc>
 * @license http://www.gnu.org/licenses/gpl.html GNU GPLv3 License
 * @version 1.7.0 (2011-12-10)
 * @info $Id: ReferralCronjob.class.php 2527 2013-01-03 19:06:30Z slaver7 $
 * @link http://code.google.com/p/2moons/
 */

class EventCronJob
{
	function run()
	{
	$CONF	= Config::getAll(NULL, ROOT_UNI);
	if($CONF['globalevent'] < TIMESTAMP){
	$getEvent = rand(1,4); 
	$langObjects	= array();
	switch($getEvent){
	case '1':	
    $totalPremiums = $GLOBALS['DATABASE']->query("SELECT id, lang FROM ".USERS.";");
    while($x = $GLOBALS['DATABASE']->fetch_array($totalPremiums)){
	if(!isset($langObjects[$x['lang']])){
	$langObjects[$x['lang']]	= new Language($x['lang']);
	$langObjects[$x['lang']]->includeData(array('L18N', 'INGAME', 'TECH', 'CUSTOM'));
	}
	$LNG			= $langObjects[$x['lang']];	
	$message = '<div class="citation">
        <div class="guillemet ouvrir">«</div>
        <div class="guillemet fermer">»</div>
        <ul style="text-align : left;">
        '.$LNG['ls_eventcron_3'].'
        </ul>
    </div>';
	SendSimpleMessage($x['id'], 0, TIMESTAMP, 7, $LNG['ls_eventcron_4'], $LNG['sys_asteroid_2'], $message);
	}
	$totalPremiums1 = $GLOBALS['DATABASE']->query("SELECT DISTINCT `id_planet` FROM ".USERS.";");
    while($omt = $GLOBALS['DATABASE']->fetch_array($totalPremiums1)){
    $GLOBALS['DATABASE']->query("UPDATE ".PLANETS." p INNER JOIN ".USERS." u ON p.id_owner = u.id SET 
    `light_hunter` = `light_hunter` + 1500,
    `crusher` = `crusher` + 700,
	`battle_ship` = `battle_ship` + 200
    WHERE p.universe = '1' AND p.id = ".$omt['id_planet']." AND u.urlaubs_modus = 0 AND p.planet_type = 1 AND u.onlinetime > ".(TIMESTAMP - 60*60*24*7).";");
	}
	break;
	
	case '2':	
    $totalPremiums = $GLOBALS['DATABASE']->query("SELECT id, lang FROM ".USERS.";");
    while($x = $GLOBALS['DATABASE']->fetch_array($totalPremiums)){
	if(!isset($langObjects[$x['lang']])){
	$langObjects[$x['lang']]	= new Language($x['lang']);
	$langObjects[$x['lang']]->includeData(array('L18N', 'INGAME', 'TECH', 'CUSTOM'));
	}
	$LNG			= $langObjects[$x['lang']];	
	$message = '<div class="citation">
        <div class="guillemet ouvrir">«</div>
        <div class="guillemet fermer">»</div>
        <ul style="text-align : left;">
        '.$LNG['ls_eventcron_6'].'
        </ul>
    </div>';
	SendSimpleMessage($x['id'], 0, TIMESTAMP, 7, $LNG['ls_eventcron_5'], $LNG['sys_asteroid_2'], $message);
	}
	$totalPremiums1 = $GLOBALS['DATABASE']->query("SELECT DISTINCT `id_planet` FROM ".USERS.";");
    while($omt = $GLOBALS['DATABASE']->fetch_array($totalPremiums1)){
    $GLOBALS['DATABASE']->query("UPDATE ".PLANETS." p INNER JOIN ".USERS." u ON p.id_owner = u.id SET 
    `civil` = `civil` + 1000,
    `technician` = `technician` + 500,
	`scientist` = `scientist` + 500,
	`soldier` = `soldier` + 50,
	`adv_soldier` = `adv_soldier` + 10
    WHERE p.universe = '1' AND p.id = ".$omt['id_planet']." AND u.urlaubs_modus = 0 AND p.planet_type = 1 AND u.onlinetime > ".(TIMESTAMP - 60*60*24*7).";");
	}
	break;
	
	case '3':	
    $totalPremiums = $GLOBALS['DATABASE']->query("SELECT id, lang FROM ".USERS.";");
    while($x = $GLOBALS['DATABASE']->fetch_array($totalPremiums)){
	if(!isset($langObjects[$x['lang']])){
	$langObjects[$x['lang']]	= new Language($x['lang']);
	$langObjects[$x['lang']]->includeData(array('L18N', 'INGAME', 'TECH', 'CUSTOM'));
	}
	$LNG			= $langObjects[$x['lang']];	
	$message = '<div class="citation">
        <div class="guillemet ouvrir">«</div>
        <div class="guillemet fermer">»</div>
        <ul style="text-align : left;">
        '.$LNG['ls_eventcron_6'].'
        </ul>
    </div>';
	SendSimpleMessage($x['id'], 0, TIMESTAMP, 7, $LNG['ls_eventcron_5'], $LNG['sys_asteroid_2'], $message);
	}
	$totalPremiums1 = $GLOBALS['DATABASE']->query("SELECT DISTINCT `id_planet` FROM ".USERS.";");
    while($omt = $GLOBALS['DATABASE']->fetch_array($totalPremiums1)){
    $GLOBALS['DATABASE']->query("UPDATE ".PLANETS." p INNER JOIN ".USERS." u ON p.id_owner = u.id SET 
    `archaeologist` = `archaeologist` + 100,
    `diplomat` = `diplomat` + 200,
	`scientist` = `scientist` + 175,
	`soldier` = `soldier` + 100
    WHERE p.universe = '1' AND p.id = ".$omt['id_planet']." AND u.urlaubs_modus = 0 AND p.planet_type = 1 AND u.onlinetime > ".(TIMESTAMP - 60*60*24*7).";");
	}
	break;
	
	case '4':	
    $totalPremiums = $GLOBALS['DATABASE']->query("SELECT id, lang FROM ".USERS.";");
    while($x = $GLOBALS['DATABASE']->fetch_array($totalPremiums)){
	if(!isset($langObjects[$x['lang']])){
	$langObjects[$x['lang']]	= new Language($x['lang']);
	$langObjects[$x['lang']]->includeData(array('L18N', 'INGAME', 'TECH', 'CUSTOM'));
	}
	$LNG			= $langObjects[$x['lang']];	
	$message = '<div class="citation">
        <div class="guillemet ouvrir">«</div>
        <div class="guillemet fermer">»</div>
        <ul style="text-align : left;">
        '.$LNG['ls_eventcron_3'].'
        </ul>
    </div>';
	SendSimpleMessage($x['id'], 0, TIMESTAMP, 7, $LNG['ls_eventcron_4'], $LNG['sys_asteroid_2'], $message);
	}
	$totalPremiums1 = $GLOBALS['DATABASE']->query("SELECT DISTINCT `id_planet` FROM ".USERS.";");
    while($omt = $GLOBALS['DATABASE']->fetch_array($totalPremiums1)){
    $GLOBALS['DATABASE']->query("UPDATE ".PLANETS." p INNER JOIN ".USERS." u ON p.id_owner = u.id SET 
    `recycler` = `recycler` + 400,
    `big_ship_cargo` = `big_ship_cargo` + 400,
	`battle_ship` = `battle_ship` + 150
    WHERE p.universe = '1' AND p.id = ".$omt['id_planet']." AND u.urlaubs_modus = 0 AND p.planet_type = 1 AND u.onlinetime > ".(TIMESTAMP - 60*60*24*7).";");
	}
	break;
	}
	
	}
	$newevkaka = TIMESTAMP + 5*60;
	$GLOBALS['DATABASE']->query("UPDATE ".CONFIG." SET globalevent = '".$newevkaka."' where `uni` = '1';");
	
	}	
}
