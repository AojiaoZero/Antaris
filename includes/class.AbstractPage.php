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
 * @info $Id: class.AbstractPage.php 2643 2013-03-26 17:13:31Z slaver7 $
 * @link http://2moons.cc/
 */

abstract class AbstractPage 
{
	protected $tplObj;
	protected $ecoObj;
	protected $window;
	protected $disableEcoSystem = false;
	
	protected function __construct() {
		
		if(!AJAX_REQUEST)
		{
			$this->setWindow('full');
			if(!$this->disableEcoSystem)
			{
				$this->ecoObj	= new ResourceUpdate();
				$this->ecoObj->CalcResource();
			}
			$this->initTemplate();
		} else {
			$this->setWindow('ajax');
		}
	}
	public function getUsername($ID) 
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
	
	public function getAvatar($username) 
	{
	global $UNI;
	$avatar = '';
	$stats_sql	=	"SELECT avatar FROM ".USERS." WHERE `universe` = '".$UNI."' AND `username` = '".$username."';";
	$query = $GLOBALS['DATABASE']->query($stats_sql);
	 while ($StatRow = $GLOBALS['DATABASE']->fetch_array($query))
      {
	  $avatar = $StatRow['avatar'];
	  }
	
	return $avatar;
	}
	
	public function redeemCode($ID) 
	{
	global $UNI;
	$code = '';
	$stats_sql	=	'SELECT rewardCode FROM uni1_reward WHERE `universe` = '.$UNI.' AND `rewardId` = '.$ID.';';
	$query = $GLOBALS['DATABASE']->query($stats_sql);
	 while ($StatRow = $GLOBALS['DATABASE']->fetch_array($query))
      {
	  $code = $StatRow['rewardCode'];
	  }
	
	return $code;
	}
	
	protected function initTemplate() {
		if(isset($this->tplObj))
			return true;
			
		$this->tplObj	= new template;
		list($tplDir)	= $this->tplObj->getTemplateDir();
		$this->tplObj->setTemplateDir($tplDir.'game/');
		return true;
	}
	
	protected function setWindow($window) {
		$this->window	= $window;
	}
		
	protected function getWindow() {
		return $this->window;
	}
	
	protected function getQueryString() {
		$queryString	= array();
		$page			= HTTP::_GP('page', '');
		
		if(!empty($page)) {
			$queryString['page']	= $page;
		}
		
		$mode			= HTTP::_GP('mode', '');
		if(!empty($mode)) {
			$queryString['mode']	= $mode;
		}
		
		return http_build_query($queryString);
	}
	
	protected function getCronjobsTodo()
	{
		require_once 'includes/classes/Cronjob.class.php';
		
		$this->tplObj->assign_vars(array(	
			'cronjobs'		=> Cronjob::getNeedTodoExecutedJobs()
		));
	}
	
	protected function getNavigationData() 
    {
		global $PLANET, $LNG, $USER, $THEME, $resource, $reslist;
		
		if($PLANET[$resource[43]] > 0) {
			$this->tplObj->loadscript("gate.js");
		}
		
		$this->tplObj->loadscript("topnav.js");
			
		$PlanetSelect	= array();
		
		if(isset($USER['PLANETS'])) {
			$USER['PLANETS']	= getPlanets($USER);
		}
		
		foreach($USER['PLANETS'] as $CurPlanetID => $PlanetQuery)
		{
			$PlanetSelect[$PlanetQuery['id']]	= $PlanetQuery['name'].(($PlanetQuery['planet_type'] == 3) ? " (" . $LNG['fcm_moon'] . ")":"")." [".$PlanetQuery['galaxy'].":".$PlanetQuery['system'].":".$PlanetQuery['planet']."]";
		}
		
		$resourceTable	= array();
		$resourceSpeed	= Config::get('resource_multiplier');
		foreach($reslist['resstype'][1] as $resourceID)
		{
			$resourceTable[$resourceID]['name']			= $resource[$resourceID];
			$resourceTable[$resourceID]['current']		= $PLANET[$resource[$resourceID]];
			$resourceTable[$resourceID]['max']			= $PLANET[$resource[$resourceID].'_max'];
			
			if($USER['urlaubs_modus'] == 1 || $PLANET['planet_type'] != 1)
			{
				$resourceTable[$resourceID]['production']	= $PLANET[$resource[$resourceID].'_perhour'];
			}
			else
			{
				$resourceTable[$resourceID]['production']	= $PLANET[$resource[$resourceID].'_perhour'] + Config::get($resource[$resourceID].'_basic_income') * $resourceSpeed;
			}
		}

		foreach($reslist['resstype'][2] as $resourceID)
		{
			$resourceTable[$resourceID]['name']			= $resource[$resourceID];
			$resourceTable[$resourceID]['used']			= $PLANET[$resource[$resourceID].'_used'];
			$resourceTable[$resourceID]['max']			= $PLANET[$resource[$resourceID]];
		}

		
		
		
		$themeSettings	= $THEME->getStyleSettings();
		
		$this->tplObj->assign_vars(array(	
			'PlanetSelect'		=> $PlanetSelect,
			'new_message' 		=> $USER['messages'],
			'vacation'			=> $USER['urlaubs_modus'] ? _date($LNG['php_tdformat'], $USER['urlaubs_until'], $USER['timezone']) : false,
			'delete'			=> $USER['db_deaktjava'] ? sprintf($LNG['tn_delete_mode'], _date($LNG['php_tdformat'], $USER['db_deaktjava'] + (Config::get('del_user_manually') * 86400)), $USER['timezone']) : false,
			'darkmatter'		=> $USER['darkmatter'],
			'current_pid'		=> $PLANET['id'],
			'image'				=> $PLANET['image'],
			'resourceTable'		=> $resourceTable,
			'shortlyNumber'		=> $themeSettings['TOPNAV_SHORTLY_NUMBER'],
			'closed'			=> !Config::get('game_disable'),
			'hasBoard'			=> filter_var(Config::get('forum_url'), FILTER_VALIDATE_URL, FILTER_FLAG_SCHEME_REQUIRED),
			'hasAdminAccess'	=> isset($_SESSION['admin_login']),
		));
	}
	
	protected function GetOnlineData() 
    {
		global $USER, $THEME, $CONF;
		$balken = $GLOBALS['DATABASE']->countquery("SELECT COUNT(*) FROM ".USERS." WHERE universe = 1 AND onlinetime > '".(TIMESTAMP - 15 * 60 )."';");	$länge2 = 365/$CONF['users_amount'];	$länge  = $balken*$länge2;
        $balken1 = $GLOBALS['DATABASE']->countquery("SELECT COUNT(*) FROM ".BANNED." WHERE universe = 1 ;");
		$länge2 = 365/$CONF['users_amount'];	$länge  = $balken*$länge2;
		
        $this->tplObj->assign_vars(array(
        'reg_user'			        => $CONF['users_amount'] - $balken1,	    
		'online_users'              => $balken,		'balken',   	
		'servertime'				=> _date("H:i:s", TIMESTAMP, $USER['timezone']),	
		));
	}
	
	protected function GetPlanetData() 
    {
		global $USER, $THEME, $CONF, $PLANET;
		if($USER['planet_sort'] == 0) {
			$Order	= "id ";
		} elseif($USER['planet_sort'] == 1) {
			$Order	= "galaxy, system, planet, planet_type ";
		} elseif ($USER['planet_sort'] == 2) {
			$Order	= "name ";	
		}
		$Order .= ($USER['planet_sort_order'] == 1) ? "DESC" : "ASC" ;
		$AllPlanetas = array();
		$GetAll = $GLOBALS['DATABASE']->query("SELECT * FROM ".PLANETS." WHERE id_owner = ".$USER['id']." AND destruyed = '0' ORDER BY ordernumber ASC;");
		if($GLOBALS['DATABASE']->numRows($GetAll)>0){
		while($x = $GLOBALS['DATABASE']->fetch_array($GetAll)){
        $AllPlanetas[] = $x;
		}
		}
		
        $this->tplObj->assign_vars(array(
        'AllPlanetas'			        => $AllPlanetas,	    	
        'pidas'			        => $PLANET['id'],	    	
        'allTimes'			        => TIMESTAMP,	    	
		));
	}
	
	protected function GetPlanetDataBis() 
    {
		global $USER, $THEME, $CONF, $PLANET;
		if($USER['planet_sort'] == 0) {
			$Order	= "id ";
		} elseif($USER['planet_sort'] == 1) {
			$Order	= "galaxy, system, planet, planet_type ";
		} elseif ($USER['planet_sort'] == 2) {
			$Order	= "name ";	
		}
		$Order .= ($USER['planet_sort_order'] == 1) ? "DESC" : "ASC" ;
		$AllPlanetsBis = array();
		
		
		
		
		$GetAll1 = $GLOBALS['DATABASE']->query("SELECT * FROM ".PLANETS." WHERE id != ".$PLANET['id']." AND id_owner = ".$USER['id']." AND destruyed = '0' ORDER BY ".$Order.";");
		if($GLOBALS['DATABASE']->numRows($GetAll1)>0){
		while($xrp = $GLOBALS['DATABASE']->fetch_array($GetAll1)){
        $AllPlanetsBis[] = $xrp;
		}
		}
		
        $this->tplObj->assign_vars(array(
        'AllPlanetsBis'			        => $AllPlanetsBis,	    	
		));
	}

	protected function getPageData() 
    {
		global $USER, $THEME;
		$time = microtime();
		$time = explode(' ', $time);
		$time = $time[1] + $time[0];
		$start = $time;
		if($this->getWindow() === 'full') {
			$this->getNavigationData();
			$this->getCronjobsTodo();
			$this->GetOnlineData();
			$this->GetPlanetData();
			$this->GetPlanetDataBis();
		}
		
		$dateTimeServer		= new DateTime("now");
		if(isset($USER['timezone'])) {
			try {
				$dateTimeUser	= new DateTime("now", new DateTimeZone($USER['timezone']));
			} catch (Exception $e) {
				$dateTimeUser	= $dateTimeServer;
			}
		} else {
			$dateTimeUser	= $dateTimeServer;
		}
		
		$time = microtime();
		$time = explode(' ', $time);
		$time = $time[1] + $time[0];
		$finish = $time;
		$total_time = round(($finish - $start), 4);

        $this->tplObj->assign_vars(array(
            'TIMESTM'				=> TIMESTAMP,
            'total_time'				=> $total_time,
            'vmode'				=> $USER['urlaubs_modus'],
			'authlevel'			=> $USER['authlevel'],
			'userID'			=> $USER['id'],
			'bodyclass'			=> $this->getWindow(),
            'game_name'			=> Config::get('game_name'),
            'uni_name'			=> Config::get('uni_name'),
			'ga_active'			=> Config::get('ga_active'),
			'ga_key'			=> Config::get('ga_key'),
			'debug'				=> Config::get('debug'),
			'VERSION'			=> Config::get('VERSION'),
			'date'				=> explode("|", date('Y\|n\|j\|G\|i\|s\|Z', TIMESTAMP)),
			'REV'				=> substr(Config::get('VERSION'), -4),
			'Offset'			=> $dateTimeUser->getOffset() - $dateTimeServer->getOffset(),
			'queryString'		=> $this->getQueryString(),
			'themeSettings'		=> $THEME->getStyleSettings(),
		));
	}
	
	protected function printMessage($Message, $fullSide = true, $redirect = NULL) {
		global $USER, $THEME;
		$this->tplObj->assign_vars(array(
			'mes'		=> $Message,
		));
		
		if(isset($redirect)) {
			$this->tplObj->gotoside($redirect[0], $redirect[1]);
		}
		
		if(!$fullSide) {
			$this->setWindow('popup');
		}
		
		if($USER['user_deleted'] == 1 || $USER['banaday'] > TIMESTAMP){
		$this->display('error2.default.tpl');
		}else{
		$this->display('error.default.tpl');
		}
		
	}
	
	protected function save() {		
		if(isset($this->ecoObj)) {
			$this->ecoObj->SavePlanetToDB();
		}
	}
	
	protected function display($file) {
		global $THEME, $LNG;
		
		$this->save();
		
		if($this->getWindow() !== 'ajax') {
			$this->getPageData();
		}
		
		$this->tplObj->assign_vars(array(
            'lang'    		=> $LNG->getLanguage(),
            'dpath'			=> $THEME->getTheme(),
			'scripts'		=> $this->tplObj->jsscript,
			'execscript'	=> implode("\n", $this->tplObj->script),
			'basepath'		=> PROTOCOL.HTTP_HOST.HTTP_BASE,
		));

		$this->tplObj->assign_vars(array(
			'LNG'			=> $LNG,
		), false);
		
		$this->tplObj->display('extends:layout.'.$this->getWindow().'.tpl|'.$file);
		exit;
	}
	
	protected function sendJSON($data) {
		$this->save();
		echo json_encode($data);
		exit;
	}
	
	protected function redirectTo($url) {
		$this->save();
		HTTP::redirectTo($url);
		exit;
	}
}