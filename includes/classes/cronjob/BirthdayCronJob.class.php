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

class BirthdayCronJob
{
	function getUsernames($ID){
	global $UNI;
	$username = '';
	$stats_sql	=	'SELECT username FROM '.USERS.' WHERE `universe` = '.$UNI.' AND `id` = '.$ID.';';
	$query = $GLOBALS['DATABASE']->query($stats_sql);
	while ($StatRow = $GLOBALS['DATABASE']->fetch_array($query))
    {
	$username = $StatRow['username'];
	}
	return $username;
	}

	function run(){
	$CONF	= Config::getAll(NULL, ROOT_UNI);
	if($CONF['birthday_event'] < TIMESTAMP){
	$totalPremiums = $GLOBALS['DATABASE']->query("SELECT `id`, `lang` FROM ".USERS." WHERE date_of_birth < ".(TIMESTAMP)." AND date_of_birth != '0' AND year = '2015';");
	$langObjects	= array();
	while($xy = $GLOBALS['DATABASE']->fetch_array($totalPremiums)){
	if(!isset($langObjects[$xy['lang']])){
	$langObjects[$xy['lang']]	= new Language($xy['lang']);
	$langObjects[$xy['lang']]->includeData(array('L18N', 'INGAME', 'TECH', 'CUSTOM'));
	}
	$LNG			= $langObjects[$xy['lang']];
	$message = '<div class="citation">
        <div class="guillemet ouvrir">«</div>
        <div class="guillemet fermer">»</div>
        <ul style="text-align : left;">
        '.$LNG['ls_eventcron_12'].'
        </ul>
    </div>';
		
	SendSimpleMessage($xy['id'], 0, TIMESTAMP, 7, sprintf($LNG['ls_eventcron_10'],$this->getUsernames($xy['id'])), $LNG['ls_eventcron_11'], $message);
	$GLOBALS['DATABASE']->query("UPDATE ".USERS." SET year = '2016' where `id` = '".$xy['id']."';");
	}
	$newevkaka = TIMESTAMP + 5*60;
	$GLOBALS['DATABASE']->query("UPDATE ".CONFIG." SET birthday_event = '".$newevkaka."' where `uni` = '".$UNI."';");
	}
		
}
}