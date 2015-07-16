<?php

/**
 *  2Moons
 *  Copyright (C) 2012 Jan
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
 * @author Jan <info@2moons.cc>
 * @copyright 2006 Perberos <ugamela@perberos.com.ar> (UGamela)
 * @copyright 2008 Chlorel (XNova)
 * @copyright 2012 Jan <info@2moons.cc> (2Moons)
 * @license http://www.gnu.org/licenses/gpl.html GNU GPLv3 License
 * @version 2.0.$Revision: 2242 $ (2012-11-31)
 * @info $Id: ShowIndexPage.class.php 2496 2013-01-01 13:26:23Z slaver7 $
 * @link http://2moons.cc/
 */

class ShowIndexPage extends AbstractPage
{
	function __construct() 
	{
		parent::__construct();
		$this->setWindow('light');
	}
	
	function show() 
	{
		global $LNG;
		
		$referralID		= HTTP::_GP('ref', 0);
		if(!empty($referralID))
		{
			$this->redirectTo('index.php?page=register&referralID='.$referralID);
		}
	
		$universeSelect	= array();		
		$uniAllConfig	= Config::getAll('universe');
		
		foreach($uniAllConfig as $uniID => $uniConfig)
		{
			$universeSelect[$uniID]	= $uniConfig['uni_name'].($uniConfig['game_disable'] == 0 ? t('uni_closed') : '');
		}
		
		$Code	= HTTP::_GP('code', 0);
		$loginCode	= false;
		if(isset($LNG['login_error_'.$Code]))
		{
			$loginCode	= $LNG['login_error_'.$Code];
		}

		$referralUniversum	= 0;
		$referralUserID		= 0;
					
		if(Config::get('ref_active'))
		{
			$referralUserID		= HTTP::_GP('ref', 0);
			if(!empty($referralUserID))
			{
				$referralUniversum	= $GLOBALS['DATABASE']->getFirstRow("SELECT universe FROM ".USERS." WHERE id = ".$referralUserID.";");
				if(!isset($referralUniversum))
				{
					$referralUniversum	= 0;
					$referralUserID		= 0;
				}
			}
		}
		
		$newsResult	= $GLOBALS['DATABASE']->query("SELECT id, date, title, text, user FROM ".NEWS." ORDER BY id DESC LIMIT 5;");
		$newsList	= array();
		
		$Rank = 1;
		while ($newsRow = $GLOBALS['DATABASE']->fetchArray($newsResult))
		{
			
			$newsList[]	= array(
				'Rank' => $Rank++,
				'id' => $newsRow['id'],
				'title' => $newsRow['title'],
				'from' 	=> $newsRow['user'],
				'text' 	=> $newsRow['text'],
				'date' 	=> _date($LNG['php_tdformat'], $newsRow['date'], $newsRow['user']),
			);
		}
		
		$uniResult	= $GLOBALS['DATABASE']->query("SELECT users_amount, COUNT(DISTINCT inac.id) as inactive, COUNT(planet.id) as planet
	FROM ".CONFIG." conf
	LEFT JOIN ".USERS." as inac ON uni = inac.universe AND inac.onlinetime < ".(TIMESTAMP - INACTIVE)."
	LEFT JOIN ".PLANETS." as planet ON uni = planet.universe
	GROUP BY conf.uni, inac.universe, planet.universe
	ORDER BY uni ASC;");
	
	while($uniRow = $GLOBALS['DATABASE']->fetch_array($uniResult)) {
	$users_amount = $uniRow['users_amount'];
	$active = $uniRow['users_amount'] - $uniRow['inactive'];
	}
		
		$this->assign(array(
			'newsList'		=> $newsList,
			'referralUserID'		=> $referralUserID,
			'referralUniversum'		=> $referralUniversum,
			'universeSelect'		=> $universeSelect,
			'code'					=> $loginCode,
			'users_amount'	=> $users_amount,
			'descHeader'			=> t('loginWelcome', Config::get('game_name')),
			'descText'				=> t('loginServerDesc', Config::get('game_name')),
			'loginInfo'				=> t('loginInfo', '<a href="index.php?page=rules">'.t('menu_rules').'</a>')
		));
		
		$this->render('page.index.default.tpl');
	}
}