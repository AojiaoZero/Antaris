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
 * @info $Id: ShowMessageListPage.php 2632 2013-03-18 19:05:14Z slaver7 $
 * @link http://2moons.cc/
 */

if (!allowedTo(str_replace(array(dirname(__FILE__), '\\', '/', '.php'), '', __FILE__))) throw new Exception("Permission error!");

function ShowNewsFeedPage()
{
	global $LNG;
	
	
	if (!empty($_POST))
	{
	
	$code			= HTTP::_GP('code', 0);
	$GLOBALS['DATABASE']->query("UPDATE uni1_newsfeed SET accepted = '1', valid_until = ".(TIMESTAMP + 24*60*60)." WHERE feedID = ".$code."  ;");
	$userInfo = $GLOBALS['DATABASE']->query("SELECT username FROM uni1_newsfeed WHERE feedID = ".$code." ;");
	$userInfo = $GLOBALS['DATABASE']->fetch_array($userInfo);
	$GLOBALS['DATABASE']->query("UPDATE uni1_users SET hln_post = ".(TIMESTAMP + 36*60*60)." WHERE username = '".$userInfo['username']."'  ;");
	
	}
	$messageRaw	= $GLOBALS['DATABASE']->query("SELECT * 
		FROM uni1_newsfeed  
		ORDER BY date DESC
		LIMIT 30;");
	
	while($messageRow = $GLOBALS['DATABASE']->fetch_array($messageRaw))
	{
	if($messageRow['valid_until'] == 0){
	$valid_util = "not validated yet";
	}else{
	$valid_util = str_replace(' ', '&nbsp;', _date($LNG['php_tdformat'], $messageRow['valid_until']), $USER['timezone']);
	}
	
		$messageList[$messageRow['feedID']]	= array(
			'fid'		=> $messageRow['feedID'],
			'username'		=> $messageRow['username'],
			'date'		=> str_replace(' ', '&nbsp;', _date($LNG['php_tdformat'], $messageRow['date']), $USER['timezone']),
			'message'		=> $messageRow['message'],
			'accepted'		=> $messageRow['accepted'],
			'valid_until'		=> $valid_util,
		);
	}	
	
	$template 	= new template();

	$template->assign_vars(array(
		'messageList'	=> $messageList,

	));
				
	$template->show('NewsFeed.tpl');
}

