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
 * @info $Id: InactiveMailCronjob.class.php 2661 2013-04-01 20:28:54Z slaver7 $
 * @link http://code.google.com/p/2moons/
 */

class DoJobCronjob
{
	
	function getUsernames($ID) 
	{
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
	
	function run()
	{
		global $LNG;
		$CONF	= Config::getAll(NULL, ROOT_UNI);
		$GLOBALS['DATABASE']->query("UPDATE `uni1_transport_player` SET `legal` = 0 WHERE `delete` > 0 ;");
		
		
		$query = $GLOBALS['DATABASE']->query("SELECT `senderID`, `receiverID` FROM `uni1_transport_player` WHERE `time` < ".(TIMESTAMP - 72 * 3600)." AND `delete` = 0 AND `legal` = 1;");
		
		while($x = $GLOBALS['DATABASE']->fetch_array($query)){
		$xD = $GLOBALS['DATABASE']->query("SELECT * FROM uni1_banned WHERE longer > ".(TIMESTAMP)." AND who = '".$this->getUsernames($x['senderID'])."';");
		$xDs = $GLOBALS['DATABASE']->query("SELECT * FROM uni1_banned WHERE longer > ".(TIMESTAMP)." AND who = '".$this->getUsernames($x['receiverID'])."';");
		if($GLOBALS['DATABASE']->numRows($xD)==0){
		$SQL      = "INSERT INTO uni1_banned SET ";
		$SQL     .= "`who` = '".$this->getUsernames($x['senderID'])."', ";
		$SQL     .= "`theme` = '2.2. The rate of trade / Push', ";
		$SQL     .= "`time` = '".TIMESTAMP."', ";
		$SQL     .= "`longer` = '".(TIMESTAMP + 72*3600)."', ";
		$SQL     .= "`author` = 'Antaris-Bot', ";
		$SQL     .= "`universe` = '1', ";
		$SQL     .= "`email` = '(EMAIL)';";
		
		$SQ     = "UPDATE uni1_users SET ";
		$SQ    .= "`bana` = '1', ";
		$SQ    .= "`banaday` = '".(TIMESTAMP + 72*3600)."', ";
		$SQ	.= "`urlaubs_modus` = '1'";
		$SQ    .= "WHERE ";
		$SQ    .= "`id` = '". $x['senderID'] ."';";
		$GLOBALS['DATABASE']->query($SQL);
		$GLOBALS['DATABASE']->query($SQ);
		SendSimpleMessage(1, 0, TIMESTAMP, 7, 'Overide Push rule ['.$this->getUsernames($x['senderID']).'-'.$this->getUsernames($x['receiverID']).']', 'Automatic sentence' , $message);
		}
		if($GLOBALS['DATABASE']->numRows($xDs)==0){
		$SQL      = "INSERT INTO uni1_banned SET ";
		$SQL     .= "`who` = '".$this->getUsernames($x['receiverID'])."', ";
		$SQL     .= "`theme` = '2.2. The rate of trade / Push', "; 
		$SQL     .= "`time` = '".TIMESTAMP."', ";
		$SQL     .= "`longer` = '".(TIMESTAMP + 72*3600)."', ";
		$SQL     .= "`author` = 'Antaris-Bot', ";
		$SQL     .= "`universe` = '1', ";
		$SQL     .= "`email` = '(EMAIL)';";
		$SQ     = "UPDATE uni1_users SET ";
		$SQ    .= "`bana` = '1', ";
		$SQ    .= "`banaday` = '".(TIMESTAMP + 72*3600)."', ";
		$SQ	.= "`urlaubs_modus` = '1'";
		$SQ    .= "WHERE ";
		$SQ    .= "`id` = '". $x['receiverID'] ."';";
		$GLOBALS['DATABASE']->query($SQL);
		$GLOBALS['DATABASE']->query($SQ);
		}
		}
		
			
		
	}
}