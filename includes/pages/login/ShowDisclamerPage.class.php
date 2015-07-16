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
 * @info $Id: ShowDisclamerPage.class.php 2416 2012-11-10 00:12:51Z slaver7 $
 * @link http://2moons.cc/
 */


class ShowDisclamerPage extends AbstractPage
{
	public static $requireModule = 0;

	function __construct() 
	{
		parent::__construct();
		$this->setWindow('light');
	}
	function send() {
	
	$username 	= HTTP::_GP('username', '', UTF8_SUPPORT);
	$prenom 	= HTTP::_GP('prenom', '', UTF8_SUPPORT);
	$email 	= HTTP::_GP('email', '');
	$sujet 	= HTTP::_GP('sujet', 0);
	$message 	= HTTP::_GP('message', '');
	$errors 	= array();
	if(!PlayerUtil::isMailValid($email)) {
			$errors[]	= t('registerErrorMailInvalid');
	}
	if(empty($email)) {
			$errors[]	= t('registerErrorMailEmpty');
		}
	if(empty($username)) {
			$errors[]	= t('registerErrorMailEmpty');
		}
	if(empty($message)) {
			$errors[]	= t('registerErrorMailEmpty');
		}
		
		
	if (!empty($errors)) {
		$this->printMessage(implode("<br>\r\n", $errors), NULL, array(array(
		'label'	=> t('registerBack'),
		'url'	=> 'javascript:window.history.back()',
		)));
	}
	require('includes/classes/Mail.class.php');
	$MailRAW		= $GLOBALS['LNG']->getTemplate('email_vaild_contact');
			$MailContent	= str_replace(array(
				'{NAME}',
				'{FIRSTNAME}',
				'{EMAIL}',
				'{SUBJECT}',
				'{MESSAGE}',
				'{IP}',
			), array(
				$username,
				$prenom,
				$email,
				$sujet,
				$message,
				$_SERVER['REMOTE_ADDR'],
			), $MailRAW);
			$to ='(EMAIL)';
			$headers = 'From: '.$email.'' . "\r\n";
			$headers .= 'Reply-To: '.$email.'' . "\r\n";
			$headers .= "MIME-Version: 1.0\r\n";
			$headers .= "Content-Type: text/html; charset=ISO-8859-1\r\n";
			//Mail::send($to, $username, Config::get('game_name'), $MailContent);
			mail('(EMAIL)', Config::get('game_name'), $MailContent, $headers);
			$this->redirectTo('index.php?page=disclamer');
	}
	
	
	function show() {
	$this->assign(array(
	
	));
	$this->render('page.disclamer.default.tpl');
	}
}
