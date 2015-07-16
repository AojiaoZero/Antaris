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
 * @info $Id: ShowLostPasswordPage.class.php 2645 2013-03-26 18:58:25Z slaver7 $
 * @link http://2moons.cc/
 */


class ShowNewsletterPage extends AbstractPage
{
	public static $requireModule = 0;

	function __construct() 
	{
		parent::__construct();
		$this->setWindow('light');
	}
	
	function show() 
	{
		$message = '';
	if (!empty($_POST)){
	$email = HTTP::_GP('email', '');	
	
	$EmailData 					= $GLOBALS['DATABASE']->getFirstRow("SELECT email FROM emails WHERE email='".$email."';");	
	if (!isset($EmailData)){
	$GLOBALS['DATABASE']->query("INSERT INTO emails SET email = '".$email."', lang = 'en';");
	$message = '<div style="margin : 15px auto 0px auto; text-align : center;" class="vert">You signed up for the newsletter with the address « '.$email.' ».</div>';
	}else{
	$message = '<div style="margin : 15px auto 0px auto; text-align : center;" class="rouge">the adress « '.$email.' » is already registered with our newsletter.</div>';	
	}
	
	}
		
		$this->assign(array(
		'message' => $message,
		));
		
		$this->render('page.newsletter.default.tpl');
	}
	

}