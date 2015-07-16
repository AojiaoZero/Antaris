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

class AsteroidCronJob
{
	function randRange($min, $max, $count){
    $range = array();
	$i=0;
    while($i++ < $count){
        while(in_array($num = mt_rand($min, $max), $range)){}
			$range[] = $num;
    }
    return $range;
	}
	
	function run()
	{
	$CONF	= Config::getAll(NULL, ROOT_UNI);
	if($CONF['asteroid_event'] < TIMESTAMP){
		$GLOBALS['DATABASE']->query("DELETE FROM ".PLANETS." where `id_owner` = '".Asteroid_Id."' AND `id` != '706' ;");
		$galaxy = 1;
		$system = $this->randRange(1,500,50);
		foreach($system as $System_Element){
		$planets = rand(1,10);
		$cautare = $GLOBALS['DATABASE']->query("SELECT *FROM ".PLANETS." where `galaxy` = '".$galaxy."' and `system` = '".$System_Element."' and `planet` = '".$planets."' AND `universe` = '1';");
		if($GLOBALS['DATABASE']->numRows($cautare)==0){
		$metal_rand = rand(1,Config::get('asteroid_metal'));
		$crystal_rand = rand(1,Config::get('asteroid_crystal'));
		$deuterium_rand= rand(1,Config::get('asteroid_deuterium'));
		$GLOBALS['DATABASE']->query("INSERT INTO ".PLANETS."(`name`,`id_owner`,`universe`,`galaxy`,`system`,`planet`,`planet_type`,`image`,`diameter`,`der_metal`,`der_crystal`,`der_deuterium`,`last_update`) 
		VALUES('Asteroid','".Asteroid_Id."','1','".$galaxy."','".$System_Element."','".$planets."','1','asteroid','9800','".$metal_rand."','".$crystal_rand."','".$deuterium_rand."','".TIMESTAMP."');");
		}
		}
		
		$totalPremiums = $GLOBALS['DATABASE']->query("SELECT `id`, `lang` FROM ".USERS.";");
		$langObjects	= array();
		while($xy = $GLOBALS['DATABASE']->fetch_array($totalPremiums)){
		if(!isset($langObjects[$xy['lang']]))
			{
				$langObjects[$xy['lang']]	= new Language($xy['lang']);
				$langObjects[$xy['lang']]->includeData(array('L18N', 'INGAME', 'TECH', 'CUSTOM'));
			}
			$LNG			= $langObjects[$xy['lang']];
		$message = '<div style="text-align : justify;">
        '.$LNG['sys_asteroid_3'].'
    </div>
  
    <div class="citation">
        <div class="guillemet ouvrir">«</div>
        <div class="guillemet fermer">»</div>
        
        
        <ul style="text-align : left;">
        '.$LNG['sys_asteroid_4'].'
        </ul>
    </div>
        
    <div class="explication_utilisateur">
        '.$LNG['ls_fts_colo_9'].'
    </div>';
		
		SendSimpleMessage($xy['id'], 0, TIMESTAMP, 7, $LNG['sys_asteroid_1'], $LNG['sys_asteroid_2'], $message);
		}
		$newevkaka = TIMESTAMP + 5*60;
		$GLOBALS['DATABASE']->query("UPDATE ".CONFIG." SET asteroid_event = '".$newevkaka."' where `uni` = '1';");
		}
		
}
}