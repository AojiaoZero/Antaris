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
 * @info $Id: class.ShowGalaxyPage.php 2640 2013-03-23 19:23:26Z slaver7 $
 * @link http://2moons.cc/
 */

require_once('includes/classes/class.FleetFunctions.php');
require_once('includes/classes/class.GalaxyRows.php');

class ShowGalaxyPage extends AbstractPage
{
    public static $requireModule = MODULE_RESEARCH;

	function __construct() 
	{
		parent::__construct();
	}
	
	public function getInformation()
	{
	global $USER;
	$planetID 		= HTTP::_GP('planetID', 0);
	$targetData	= $GLOBALS['DATABASE']->getFirstRow("SELECT planet.id_owner as id_owner, 
										planet.id as ids, 
										planet.name as name, 
										planet.galaxy as galaxy, 
										planet.system as system, 
										planet.planet as planet,
										planet.planet_type as planet_type, 
										total_points, total_rank, onlinetime, urlaubs_modus, banaday, authattack, user_deleted, username
										FROM ".PLANETS." planet
										INNER JOIN ".USERS." user ON planet.id_owner = user.id
										LEFT JOIN ".STATPOINTS." as stat ON stat.id_owner = user.id AND stat.stat_type = '1' 
										WHERE planet.id = ".$planetID.";");
										
	$this->sendJSON(array('pplanet' => $targetData['planet'], 'pname' => $targetData['name'], 'powner' => $this->getUsername($targetData['id_owner']), 'ppoints' => $targetData['total_points'], 'prank' => $targetData['total_rank']));

	}
	
	public function spaceportal()
	{
	global $USER;
	$this->initTemplate();
	$this->setWindow('ajax');
	$planetID 		= HTTP::_GP('planetID', 0);
	
	if (empty($planetID)) {
	$this->sendData('rouge', $LNG['fa_planet_not_exist']);
	}
	$targetData	= $GLOBALS['DATABASE']->getFirstRow("SELECT planet.id_owner as id_owner, 
										planet.id as ids, 
										planet.name as name, 
										planet.galaxy as galaxy, 
										planet.system as system, 
										planet.planet as planet,
										planet.planet_type as planet_type, 
										total_points, onlinetime, urlaubs_modus, banaday, authattack, user_deleted, username
										FROM ".PLANETS." planet
										INNER JOIN ".USERS." user ON planet.id_owner = user.id
										LEFT JOIN ".STATPOINTS." as stat ON stat.id_owner = user.id AND stat.stat_type = '1' 
										WHERE planet.id = ".$planetID.";");
		$userComp = array();
		$Acepting = 0;
		$GetuserComp = $GLOBALS['DATABASE']->query("SELECT * FROM `uni1_fleets_manage` WHERE userID = ".$USER['id']." ORDER by manageID ASC;");
		$num_rows = $GLOBALS['DATABASE']->numRows($GetuserComp);
				if($num_rows != 0){
					$Acepting = 1;
		while($xb = $GLOBALS['DATABASE']->fetch_array($GetuserComp)){
		$userComp[$xb['manageID']]	= array(
			'manage_name'		=> $xb['manage_name'],
			);
		}									
		}								
	$this->tplObj->loadscript('galaxy.js');									
	$this->tplObj->assign_vars(array(
			'space_name'				=> $targetData['name'],
			'userComp' => $userComp,
			'Acepting' => $Acepting,
			'space_ids'				=> $targetData['ids'],
			'space_galaxy'				=> $targetData['galaxy'],
			'space_system'				=> $targetData['system'],
			'space_planet'				=> $targetData['planet'],
			'space_id_owner'				=> $this->getUsername($targetData['id_owner']),
		));
	
	$this->display('page.galaxy.spaceportal.tpl');	
	}
	
	public function space()
	{
	global $USER;
	$this->initTemplate();
	$this->setWindow('ajax');
	$planetID 		= HTTP::_GP('planetID', 0);
	
	if (empty($planetID)) {
	$this->sendData('rouge', $LNG['fa_planet_not_exist']);
	}
	$targetData	= $GLOBALS['DATABASE']->getFirstRow("SELECT planet.id_owner as id_owner, 
										planet.id as ids, 
										planet.name as name, 
										planet.galaxy as galaxy, 
										planet.system as system, 
										planet.planet as planet,
										planet.planet_type as planet_type, 
										total_points, onlinetime, urlaubs_modus, banaday, authattack, user_deleted, username
										FROM ".PLANETS." planet
										INNER JOIN ".USERS." user ON planet.id_owner = user.id
										LEFT JOIN ".STATPOINTS." as stat ON stat.id_owner = user.id AND stat.stat_type = '1' 
										WHERE planet.id = ".$planetID.";");
		$userComp = array();
		$Acepting = 0;
		$GetuserComp = $GLOBALS['DATABASE']->query("SELECT * FROM `uni1_fleets_manage` WHERE userID = ".$USER['id']." ORDER by manageID ASC;");
		$num_rows = $GLOBALS['DATABASE']->numRows($GetuserComp);
				if($num_rows != 0){
					$Acepting = 1;
		while($xb = $GLOBALS['DATABASE']->fetch_array($GetuserComp)){
		$userComp[$xb['manageID']]	= array(
			'manage_name'		=> $xb['manage_name'],
			);
		}									
		}								
	$this->tplObj->loadscript('galaxy.js');									
	$this->tplObj->assign_vars(array(
			'space_name'				=> $targetData['name'],
			'userComp' => $userComp,
			'Acepting' => $Acepting,
			'space_ids'				=> $targetData['ids'],
			'space_galaxy'				=> $targetData['galaxy'],
			'space_system'				=> $targetData['system'],
			'space_planet'				=> $targetData['planet'],
			'space_id_owner'				=> $this->getUsername($targetData['id_owner']),
		));
	
	$this->display('page.galaxy.space.tpl');	
	}
		public function showAttack()
	{
	$this->initTemplate();
	$this->setWindow('ajax');
									
									
	global $USER, $PLANET, $resource, $LNG, $reslist, $CONF;

		$the_gid = HTTP::_GP('value', '');
		$the_gid1 = HTTP::_GP('value1', '');
	
		$galaxyRows	= new GalaxyRows;
		$galaxyRows->setGalaxy(1);
		$galaxyRows->setSystem($the_gid1);
		$Result	= $galaxyRows->getGalaxyData();

        $this->tplObj->loadscript('galaxy.js');
        $this->tplObj->assign_vars(array(
			'the_gid'				=> $the_gid,
			'GalaxyRows'				=> $Result,
			'userIDsss'					=> $USER['id'],
			'spyShips'					=> array(210 => $USER['spio_anz']),
			'settings_fleetactions'		=> $USER['settings_fleetactions'],
			'current_galaxy'			=> $PLANET['galaxy'],
			'current_system'			=> $PLANET['system'],
			'current_planet'			=> $PLANET['planet'],
			'planet_type' 				=> $PLANET['planet_type'],
			'galaxy_space'				=> $USER['galaxy_space'],

		));
	
	$this->display('page.galaxy.showattack.tpl');	
	}
	
	public function showEmpty()
	{
	$this->initTemplate();
	$this->setWindow('ajax');
									
									
	global $USER, $PLANET, $resource, $LNG, $reslist, $CONF;

		$the_gid = HTTP::_GP('value', '');
		$the_gid1 = HTTP::_GP('value1', '');
		
		$galaxy			= 1;
		$system			= $the_gid1;
		$planet			= $the_gid;
		
		
		$galaxyRows	= new GalaxyRows;
		$galaxyRows->setGalaxy(1);
		$galaxyRows->setSystem($the_gid1);
		$Result	= $galaxyRows->getGalaxyData();

        $this->tplObj->loadscript('galaxy.js');
        $this->tplObj->assign_vars(array(
			'the_gid'				=> $the_gid,
			'GalaxyRows'				=> $Result,
			'userIDsss'					=> $USER['id'],
			'spyShips'					=> array(210 => $USER['spio_anz']),
			'settings_fleetactions'		=> $USER['settings_fleetactions'],
			'current_galaxy'			=> $PLANET['galaxy'],
			'current_system'			=> $PLANET['system'],
			'current_planet'			=> $PLANET['planet'],
			'galaxy'					=> $galaxy,
			'system'					=> $system,
			'planet'					=> $planet,
			'planet_type' 				=> $PLANET['planet_type'],

		));
	
	$this->display('page.galaxy.showempty.tpl');	
	}

	
	public function showDebris()
	{
	$this->initTemplate();
	$this->setWindow('ajax');
									
									
	global $USER, $PLANET, $resource, $LNG, $reslist, $CONF;

		$the_gid1 = HTTP::_GP('value1', '');
	
		$galaxyRows	= new GalaxyRows;
		$galaxyRows->setGalaxy(1);
		$galaxyRows->setSystem($the_gid1);
		$Result	= $galaxyRows->getGalaxyData();

        $this->tplObj->loadscript('galaxy.js');
        $this->tplObj->assign_vars(array(
			'GalaxyRows'				=> $Result,
			'userIDsss'					=> $USER['id'],
			'spyShips'					=> array(210 => $USER['spio_anz']),
			'settings_fleetactions'		=> $USER['settings_fleetactions'],
			'current_galaxy'			=> $PLANET['galaxy'],
			'current_system'			=> $PLANET['system'],
			'current_planet'			=> $PLANET['planet'],
			'planet_type' 				=> $PLANET['planet_type'],
			'maxfleetcount'				=> FleetFunctions::GetCurrentFleets($USER['id']),
			'fleetmax'					=> FleetFunctions::GetMaxFleetSlots($USER),
			'currentmip'				=> $PLANET[$resource[503]],
			'grecyclers'   				=> $PLANET[$resource[219]],
			'recyclers'   				=> $PLANET[$resource[209]],
			'spyprobes'   				=> $PLANET[$resource[210]],

		));
	
	$this->display('page.galaxy.showdebris.tpl');	
	}
	
	
	
	public function show()
	{
		global $USER, $PLANET, $resource, $LNG, $reslist, $CONF;

		$action 		= HTTP::_GP('action', '');
		$galaxyLeft		= HTTP::_GP('galaxyLeft', '');
		$galaxyRight	= HTTP::_GP('galaxyRight', '');
		$systemLeft		= HTTP::_GP('systemLeft', '');
		$systemRight	= HTTP::_GP('systemRight', '');
		$galaxy			= min(max(HTTP::_GP('galaxy', (int) $PLANET['galaxy']), 1), Config::get('max_galaxy'));
		$system			= min(max(HTTP::_GP('system', (int) $PLANET['system']), 1), Config::get('max_system'));
		$planet			= min(max(HTTP::_GP('planet', (int) $PLANET['planet']), 1), Config::get('max_planets'));
		$type			= HTTP::_GP('type', 1);
		$current		= HTTP::_GP('current', 0);
		
        if (!empty($galaxyLeft))
            $galaxy	= max($galaxy - 1, 1);
        elseif (!empty($galaxyRight))
            $galaxy	= min($galaxy + 1, Config::get('max_galaxy'));

        if (!empty($systemLeft))
            $system	= max($system - 1, 1);
        elseif (!empty($systemRight))
            $system	= min($system + 1, Config::get('max_system'));

		if ($galaxy != $PLANET['galaxy'] || $system != $PLANET['system'])
		{
			if($PLANET['elyrium'] < Config::get('deuterium_cost_galaxy'))
			{	
				$this->printMessage('<span class="rouge">'.$LNG['gl_no_deuterium_to_view_galaxy'].'</span>', array("game.php?page=galaxy", 3));
				exit;
			} else {
				$PLANET['elyrium']	-= Config::get('deuterium_cost_galaxy');
            }
		}

        $targetDefensive    = $reslist['defense'];
        $targetDefensive[]	= 502;
		$MissleSelector[0]	= $LNG['gl_all_defenses'];
		
		foreach($targetDefensive  as $Element)
		{	
			$MissleSelector[$Element] = $LNG['tech'][$Element];
		}
				
		$galaxyRows	= new GalaxyRows;
		$galaxyRows->setGalaxy($galaxy);
		$galaxyRows->setSystem($system);
		$Result	= $galaxyRows->getGalaxyData();

        $this->tplObj->loadscript('galaxy.js');
        $this->tplObj->assign_vars(array(
			'GalaxyRows'				=> $Result,
			'planetcount'				=> sprintf($LNG['gl_populed_planets'], count($Result)),
			'action'					=> $action,
			'galaxy'					=> $galaxy,
			'system'					=> $system,
			'planet'					=> $planet,
			'type'						=> $type,
			'current'					=> $current,
			'maxfleetcount'				=> FleetFunctions::GetCurrentFleets($USER['id']),
			'fleetmax'					=> FleetFunctions::GetMaxFleetSlots($USER),
			'galaxy_space'				=> $USER['galaxy_space'],
			'currentmip'				=> $PLANET[$resource[503]],
			'grecyclers'   				=> $PLANET[$resource[219]],
			'recyclers'   				=> $PLANET[$resource[209]],
			'spyprobes'   				=> $PLANET[$resource[210]],
			'missile_count'				=> sprintf($LNG['gl_missil_to_launch'], $PLANET[$resource[503]]),
			'spyShips'					=> array(210 => $USER['spio_anz']),
			'settings_fleetactions'		=> $USER['settings_fleetactions'],
			'current_galaxy'			=> $PLANET['galaxy'],
			'current_system'			=> $PLANET['system'],
			'current_planet'			=> $PLANET['planet'],
			'planet_type' 				=> $PLANET['planet_type'],
            'max_planets'               => Config::get('max_planets'),
			'MissleSelector'			=> $MissleSelector,
			'ShortStatus'				=> array(
				'vacation'					=> $LNG['gl_short_vacation'],
				'banned'					=> $LNG['gl_short_ban'],
				'inactive'					=> $LNG['gl_short_inactive'],
				'longinactive'				=> $LNG['gl_short_long_inactive'],
				'noob'						=> $LNG['gl_short_newbie'],
				'strong'					=> $LNG['gl_short_strong'],
				'enemy'						=> $LNG['gl_short_enemy'],
				'friend'					=> $LNG['gl_short_friend'],
				'member'					=> $LNG['gl_short_member'],
			),
		));
		
		$this->display('page.galaxy.default.tpl');
	}
}