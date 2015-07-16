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

class EventSocialCronJob
{
	function run()
	{
	$CONF	= Config::getAll(NULL, ROOT_UNI);
	if($CONF['globaleventsocial'] < TIMESTAMP){ 
	$getEvent = rand(1,2); 
	$langObjects	= array();
	switch($getEvent){
	case '1':	
	$query = $GLOBALS['DATABASE']->query("SELECT id, lang FROM uni1_users;");
	while($x = $GLOBALS['DATABASE']->fetch_array($query)){
	if(!isset($langObjects[$x['lang']])){
	$langObjects[$x['lang']]	= new Language($x['lang']);
	$langObjects[$x['lang']]->includeData(array('L18N', 'INGAME', 'TECH', 'CUSTOM'));
	}
	$LNG			= $langObjects[$x['lang']];
	$message = '<div class="citation">
        <div class="guillemet ouvrir">«</div>
        <div class="guillemet fermer">»</div>
        <ul style="text-align : left;">
        '.$LNG['ls_eventcron_1'].'
        </ul>
    </div>';
   SendSimpleMessage($x['id'], 0, TIMESTAMP, 7, $LNG['ls_eventcron_2'], $LNG['sys_asteroid_2'], $message);
   }
	
	break;
	case '2':
	$query = $GLOBALS['DATABASE']->query("SELECT id, lang FROM uni1_users;");
	while($x = $GLOBALS['DATABASE']->fetch_array($query)){
	if(!isset($langObjects[$x['lang']])){
	$langObjects[$x['lang']]	= new Language($x['lang']);
	$langObjects[$x['lang']]->includeData(array('L18N', 'INGAME', 'TECH', 'CUSTOM'));
	}
	$LNG			= $langObjects[$x['lang']];	
	$message = '<div class="citation">
        <div class="guillemet ouvrir">«</div>
        <div class="guillemet fermer">»</div>
        <ul style="text-align : left;">
        '.$LNG['ls_eventcron_7'].'
        </ul>
    </div>
	<div class="explication_utilisateur">
        '.$LNG['ls_eventcron_8'].'
            </div>
	';
	SendSimpleMessage($x['id'], 0, TIMESTAMP, 7, $LNG['ls_eventcron_9'], $LNG['sys_asteroid_2'], $message);
	}
	break;
	
	
	}
	$newevkaka = TIMESTAMP + 5*60;
	$GLOBALS['DATABASE']->query("UPDATE ".CONFIG." SET globaleventsocial = '".$newevkaka."' where `uni` = '1';");
	
	}	
}
}