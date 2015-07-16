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


class ShowResumePage extends AbstractPage
{
	public static $requireModule = 0;

	function __construct() 
	{
		parent::__construct();
		$this->setWindow('light');
	}
	function getCode(){
$code=rand(1000,9999);
$_SESSION['code']=$code;
$im = imagecreatetruecolor(50, 24);
$bg = imagecolorallocate($im, 22, 86, 165); //background color blue
$fg = imagecolorallocate($im, 255, 255, 255);//text color white
imagefill($im, 0, 0, $bg);
imagestring($im, 5, 5, 5,  $code, $fg);
header("Cache-Control: no-cache, must-revalidate");
header('Content-type: image/png');
imagepng($im);
imagedestroy($im);
}

	function take() 
	{
	global $LNG; 
	$idc		= HTTP::_GP('tid', 0);	
	$universeSelect	= array();	
		$referralData	= array('id' => 0, 'name' => '');
		$accountName	= "";
		
		$externalAuth	= HTTP::_GP('externalAuth', array());
		$referralID 	= HTTP::_GP('referralID', 0);
		
		$uniAllConfig	= Config::getAll('universe');
		
		foreach($uniAllConfig as $uniID => $uniConfig)
		{
			$universeSelect[$uniID]	= $uniConfig['uni_name'].($uniConfig['game_disable'] == 0 || $uniConfig['reg_closed'] == 1 ? t('uni_closed') : '');
		}
		
		if(!isset($externalAuth['account'], $externalAuth['method']))
		{
			$externalAuth['account']	= 0;
			$externalAuth['method']		= '';
		}
		else
		{
			$externalAuth['method']		= strtolower(str_replace(array('_', '\\', '/', '.', "\0"), '', $externalAuth['method']));
		}
		
		if(!empty($externalAuth['account']) && file_exists('includes/extauth/'.$externalAuth['method'].'.class.php'))
		{
			require('includes/extauth/'.$externalAuth['method'].'.class.php');
			$methodClass	= ucwords($externalAuth['method']).'Auth';
			$authObj		= new $methodClass;
			
			if(!$authObj->isActiveMode()) {
				$this->redirectTo('index.php?code=5');
			}
			
			if(!$authObj->isVaild()) {
				$this->redirectTo('index.php?code=4');
			}
			
			$accountData	= $authObj->getAccountData();
			$accountName	= $accountData['name'];
		}
		
		if(Config::get('ref_active') == 1 && !empty($referralID))
		{
			$referralAccountName	= $GLOBALS['DATABASE']->getFirstCell("SELECT username FROM ".USERS." WHERE id = ".$referralID." AND universe = ".$GLOBALS['UNI'].";");
			
			if(!empty($referralAccountName))
			{
				$referralData	= array('id' => $referralID, 'name' => $referralAccountName);
			}
		}
	$stats_sql	=	'SELECT u.*, s.total_points, p.name, a.ally_tag, a.ally_name FROM '.USERS.' as u
                INNER JOIN '.STATPOINTS.' as s ON s.id_owner = u.id
                LEFT JOIN '.ALLIANCE.' as a ON a.id = u.ally_id
                LEFT JOIN '.PLANETS.' as p ON p.id = u.id_planet
                WHERE s.`universe` = 1 AND u.id = '.$idc.';';
	$query = $GLOBALS['DATABASE']->query($stats_sql);
	
	
	
                
                while ($StatRow = $GLOBALS['DATABASE']->fetch_array($query))
                {
				
                    
                        $onlinetile		= $StatRow['onlinetime'];
                        $namse		= $StatRow['username'];
                        $points	= pretty_number($StatRow['total_points']);
                        $avatar	= $StatRow['avatar'];
                        $galaxy	= $StatRow['galaxy'];
                        $system	= $StatRow['system'];
                        $planet	= $StatRow['planet'];
                        $planetname	= $StatRow['name'];
                
                
		}
	if($GLOBALS['DATABASE']->numRows($query)>0 && $onlinetile < TIMESTAMP - 90*24*3600){
		$this->assign(array(
		'namse'				=> $namse,
		'points'				=> $points,
		'avatars'				=> $avatar,
		'galaxys'				=> $galaxy,
		'systems'				=> $system,
		'planets'				=> $planet,
		'planetname'				=> $planetname,
		'idc'				=> $idc,
		));
		
		$this->render('page.register.take.tpl');
		}elseif($GLOBALS['DATABASE']->numRows($query)>0 && $onlinetile > TIMESTAMP - 90*24*3600){
		
		$this->assign(array(
		'referralData'		=> $referralData,
			'accountName'		=> $accountName,
			'externalAuth'		=> $externalAuth,
			'universeSelect'	=> $universeSelect,
			'registerRulesDesc'	=> t('registerRulesDesc', '<a href="index.php?page=rules">'.t('menu_rules').'</a>')
		));
		
		$this->render('page.register.default.tpl');
		
		}elseif($GLOBALS['DATABASE']->numRows($query)==0){
		
		$this->assign(array(
		'referralData'		=> $referralData,
			'accountName'		=> $accountName,
			'externalAuth'		=> $externalAuth,
			'universeSelect'	=> $universeSelect,
			'registerRulesDesc'	=> t('registerRulesDesc', '<a href="index.php?page=rules">'.t('menu_rules').'</a>')
		));
		
		$this->render('page.register.default.tpl');
		
		}
	}
	
	
	function show() 
	{
	global $LNG;
	
	$stats_sql	=	'SELECT DISTINCT u.*, s.total_points, p.name, a.ally_tag, a.ally_name FROM '.USERS.' as u
                LEFT JOIN '.STATPOINTS.' as s ON s.id_owner = u.id
                LEFT JOIN '.ALLIANCE.' as a ON a.id = u.ally_id
                LEFT JOIN '.PLANETS.' as p ON p.id = u.id_planet
                WHERE u.`universe` = 1 AND u.onlinetime < '.(TIMESTAMP - 90 * 24 * 3600).';';

    $query = $GLOBALS['DATABASE']->query($stats_sql);
		
		$RangeList	= array();

                while ($StatRow = $GLOBALS['DATABASE']->fetch_array($query))
                {
				
                    $RangeList[]	= array(
                        'id'		=> $StatRow['id'],
                        'name'		=> $StatRow['username'],
                        'points'	=> pretty_number($StatRow['total_points']),
                        'allyid'	=> $StatRow['ally_id'],
                        'onlinetimes'	=> _date($LNG['php_tdformat'], $StatRow['onlinetime']),
                        'avatar'	=> $StatRow['avatar'],
                        'allyname'	=> $StatRow['ally_name'],
                        'galaxy'	=> $StatRow['galaxy'],
                        'system'	=> $StatRow['system'],
                        'planet'	=> $StatRow['planet'],
                        'planetname'	=> $StatRow['name'],
                        'allytag'	=> $StatRow['ally_tag'],
                    );
                }
				$GLOBALS['DATABASE']->free_result($query);
		
		$this->assign(array(
		'RangeList'				=> $RangeList,
		));
		
		$this->render('page.resume.default.tpl');
	}
	
	function send() 
	{
		$userName 		= HTTP::_GP('username', '', UTF8_SUPPORT);
		$password 		= HTTP::_GP('password', '', true);
		$password2 		= HTTP::_GP('passwordReplay', '', true);
		$captcha 		= HTTP::_GP('captcha', '');
		$mailAddress 	= HTTP::_GP('email', '');
		$rulesChecked	= HTTP::_GP('reglement', 0);
		$condition 		= HTTP::_GP('condition', 0);
		$id_reprise 		= HTTP::_GP('id_reprise', 0);
		$nom_planete 		= HTTP::_GP('nom_planete', '');
		
		$stats_sql	=	'SELECT DISTINCT u.*, s.total_points, p.name, a.ally_tag, a.ally_name FROM '.USERS.' as u
                INNER JOIN '.STATPOINTS.' as s ON s.id_owner = u.id
                LEFT JOIN '.ALLIANCE.' as a ON a.id = u.ally_id
                LEFT JOIN '.PLANETS.' as p ON p.id = u.id_planet
                WHERE s.`universe` = 1 AND u.id = '.$id_reprise.';';
		$query = $GLOBALS['DATABASE']->query($stats_sql);		
		
		$errors 	= array();
		
		if(Config::get('reg_closed') == 1) {
			$this->printMessage(t('registerErrorUniClosed'), NULL, array(array(
				'label'	=> t('registerBack'),
				'url'	=> 'javascript:window.history.back()',
			)));
		}
		
		if($_SESSION['code'] != $captcha) {
			$errors[]	= t('registerErrorCaptchas');
		}
		while ($StatRow = $GLOBALS['DATABASE']->fetch_array($query))
        {
		if($StatRow['onlinetime'] > TIMESTAMP - 90 * 24 * 3600)	{
		$errors[]	= t('cannottakeover');	
		}
		}		
		
		
		if(empty($userName)) {
			$errors[]	= t('registerErrorUsernameEmpty');
		}
		if(empty($nom_planete)) {
			$errors[]	= t('registerErrorPlanetnameEmpty');
		}
		if(strlen($nom_planete) > 18){
			$errors[]	= t('registerErrorPlanetnametolong');
		}
		if(strlen($nom_planete) < 5){
			$errors[]	= t('registerErrorPlanetnametoshort');
		}
		if(!PlayerUtil::isNameValid($userName)) {
			$errors[]	= t('registerErrorUsernameChar');
		}
		
		if(strlen($userName) < 3) {
			$errors[]	= t('registerErroruserNameLength');
		}
		if(strlen($userName) > 16) {
			$errors[]	= t('registerErroruserNameLength');
		}
		
		if(strlen($password) < 6) {
			$errors[]	= t('registerErrorPasswordLength');
		}
		if(strlen($password) > 32) {
			$errors[]	= t('registerErrorPasswordLength');
		}
			
		if($password != $password2) {
			$errors[]	= t('registerErrorPasswordSame');
		}
			
		if(!PlayerUtil::isMailValid($mailAddress)) {
			$errors[]	= t('registerErrorMailInvalid');
		}
		
		if(!PlayerUtil::valid_mail($mailAddress)) {
			$errors[]	= t('registerErrorMailInvalid2');
		}
			
		if(empty($mailAddress)) {
			$errors[]	= t('registerErrorMailEmpty');
		}
		
		
		if($rulesChecked != 1) {
			$errors[]	= t('registerErrorRules');
		}
		
		if($condition != 1) {
			$errors[]	= t('registerErrorTerms');
		}
		
		$countUsername	= $GLOBALS['DATABASE']->getFirstCell("SELECT (
			SELECT COUNT(*) 
			FROM ".USERS." 
			WHERE universe = ".$GLOBALS['UNI']."
			AND username = '".$GLOBALS['DATABASE']->escape($userName)."'
		) + (
			SELECT COUNT(*)
			FROM ".USERS_VALID."
			WHERE universe = ".$GLOBALS['UNI']."
			AND username = '".$GLOBALS['DATABASE']->escape($userName)."'
		);");
		
		$countMail		= $GLOBALS['DATABASE']->getFirstCell("SELECT (
			SELECT COUNT(*)
			FROM ".USERS."
			WHERE universe = ".$GLOBALS['UNI']."
			AND (
				email = '".$GLOBALS['DATABASE']->escape($mailAddress)."'
				OR email_2 = '".$GLOBALS['DATABASE']->escape($mailAddress)."'
			)
		) + (
			SELECT COUNT(*)
			FROM ".USERS_VALID."
			WHERE universe = ".$GLOBALS['UNI']."
			AND email = '".$GLOBALS['DATABASE']->escape($mailAddress)."'
		);");
		
		if($countUsername!= 0) {
			$errors[]	= t('registerErrorUsernameExist');
		}
			
		if($countMail != 0) {
			$errors[]	= t('registerErrorMailExist');
		}
			
		if (!empty($errors)) {
			$this->printMessage(implode("<br>\r\n", $errors), NULL, array(array(
				'label'	=> t('registerBack'),
				'url'	=> 'javascript:window.history.back()',
			)));
		}
		
		
		$validationKey	= md5(uniqid('2m'));
	
		$SQL = "UPDATE ".USERS." SET
				`username` = '".$GLOBALS['DATABASE']->escape($userName)."',
				`password` = '".PlayerUtil::cryptPassword($password)."',
				`email` = '".$GLOBALS['DATABASE']->escape($mailAddress)."',
				`email_2` = '".$GLOBALS['DATABASE']->escape($mailAddress)."',
				`register_time` = '".TIMESTAMP."',
				`ip_at_reg` = '".$_SERVER['REMOTE_ADDR']."',
				`validationKey` = '".$validationKey."',
				`lang` = 'en',
				`sexe` = '',
				`date_of_birth` = '0',
				`ref_id` = 0,
				`ref_bonus` = 0,
				`ref_bonus` = 0,
				`urlaubs_modus` = 0,
				`urlaubs_until` = 0 WHERE id = '".$id_reprise."';";
				
		$GLOBALS['DATABASE']->query($SQL);
		
		$validationID	= $GLOBALS['DATABASE']->GetInsertID();
		$vertifyURL	= 'index.php?page=vertifyr&k='.$validationKey;
		
		
			require('includes/classes/Mail.class.php');
			$MailSubject 	= t('registerMailVertifyTitle');
			$MailRAW		= $GLOBALS['LNG']->getTemplate('email_vaild_reg');
			$MailContent	= str_replace(array(
				'{USERNAME}',
				'{PASSWORD}',
				'{GAMENAME}',
				'{VERTIFYURL}',
				'{GAMEMAIL}',
				'{EMAIL}',
				'{REGISTERIP}',
				'{PLANETNAME}',
			), array(
				$userName,
				$password,
				Config::get('game_name').' - '.Config::get('uni_name'),
				HTTP_PATH.$vertifyURL,
				Config::get('smtp_sendmail'),
				$mailAddress,
				$_SERVER['REMOTE_ADDR'],
				$nom_planete,
			), $MailRAW);
			
			$headers = 'From: (EMAIL)' . "\r\n";
			$headers .= 'Reply-To: (EMAIL)' . "\r\n";
			$headers .= "MIME-Version: 1.0\r\n";
			$headers .= "Content-Type: text/html; charset=ISO-8859-1\r\n";
			//mail($mailAddress, t('registerMailVertifyTitle', Config::get('game_name')), $MailContent, $headers);
			Mail::send($mailAddress, $userName, t('registerMailVertifyTitle', Config::get('game_name')), $MailContent);
			
			$this->printMessage(t('registerSendComplete'));
		
	}	
}