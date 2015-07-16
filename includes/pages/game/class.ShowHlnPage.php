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
 * @info $Id: class.ShowResourcesPage.php 2632 2013-03-18 19:05:14Z slaver7 $
 * @link http://2moons.cc/
 */

class ShowHlnPage extends AbstractPage
{
	public static $requireModule = 0;

	function __construct() 
	{
		parent::__construct();
	}
	
	function hlnSend()
	{
		global $LNG, $ProdGrid, $resource, $reslist, $CONF, $pricelist, $USER, $PLANET;
		$feed		= HTTP::_GP('message', '', UTF8_SUPPORT);
		
		if($USER['hln_post'] < TIMESTAMP){
		$GLOBALS['DATABASE']->query("INSERT INTO `uni1_newsfeed` VALUES ('".$GLOBALS['DATABASE']->GetInsertID()."', '".$USER['id']."', '".TIMESTAMP."', '".$feed."', '0', '0') ;");
		$GLOBALS['DATABASE']->query("UPDATE uni1_users SET hln_post = ".(TIMESTAMP + 36 * 3600)." WHERE id = ".$USER['id'].";");
		SendSimpleMessage(1, 1, TIMESTAMP, 1, "Live Feed System", "New feed", 'There is a new feed waiting on aprouval');
		$this->printMessage("<span class='vert'>Feed has been posted and is waiting on aprouval!</span>", true, array('game.php?page=overview', 2));
		}

	}
	
	function show()
	{
		global $LNG, $ProdGrid, $resource, $reslist, $CONF, $pricelist, $USER, $PLANET;
		
			$messageList = array();
			$GetAll = $GLOBALS['DATABASE']->query("SELECT * FROM `uni1_newsfeed` WHERE accepted = '1' AND valid_until > ".(TIMESTAMP)." ORDER BY date DESC LIMIT 6;");
			if($GLOBALS['DATABASE']->numRows($GetAll)>0){
			while($messageRow = $GLOBALS['DATABASE']->fetch_array($GetAll))
	{
		
		$messageList[$messageRow['feedID']]	= array(
			'fid'		=> $messageRow['feedID'],
			'username'		=> $this->getUsername($messageRow['username']),
			'date'		=> str_replace(' ', '&nbsp;', _date($LNG['php_tdformat'], $messageRow['date']), $USER['timezone']),
			'message'		=> $messageRow['message'],
		);
	}	
			}
		
		$isWaiting	= $GLOBALS['DATABASE']->getFirstCell("SELECT COUNT(*) FROM uni1_newsfeed WHERE username = ".$USER['id']." AND accepted = '0';");
		$ShowText = 0;
		if($isWaiting > 0){
		$ShowText = 1;	
		}elseif($USER['hln_post'] > TIMESTAMP){
		$ShowText = 2;	
		}
		$this->tplObj->loadscript('hln.js');
		$this->tplObj->assign_vars(array(	
		'messageList' => $messageList,
		'ShowText' => $ShowText,
		));
		
		$this->display('page.hln.default.tpl');
	}
}
