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
 * @info $Id: class.ShowPlayerCardPage.php 2632 2013-03-18 19:05:14Z slaver7 $
 * @link http://2moons.cc/
 */


class ShowPlayerCardPage extends AbstractPage
{
    public static $requireModule = MODULE_PLAYERCARD;
	
	protected $disableEcoSystem = true;

	function __construct() 
	{
		parent::__construct();
	}
	
	function show()
	{
		global $USER, $PLANET, $LNG, $UNI;
		
		
		
		$PlayerID 	= HTTP::_GP('id', 1);
			
		$query 		= $GLOBALS['DATABASE']->getFirstRow("SELECT 
						u.user_deleted, u.immunity_until, u.onlinetime, u.banaday, u.urlaubs_modus, u.multi_spotted, u.username, u.galaxy, u.system, u.sexe, u.planet, u.date_of_birth, u.register_time, u.avatar, u.wons, u.loos, u.draws, u.kbmetal, u.kbcrystal, u.lostunits, u.desunits, u.ally_id, 
						p.name, 
						s.tech_rank, s.tech_points, s.popu_rank, s.popu_points, s.build_rank, s.build_points, s.defs_rank, s.defs_points, s.fleet_rank, s.fleet_points, s.total_rank, s.total_points, 
						a.ally_name, a.ally_tag 
						FROM ".USERS." u 
						INNER JOIN ".PLANETS." p ON p.id = u.id_planet 
						LEFT JOIN ".STATPOINTS." s ON s.id_owner = u.id AND s.stat_type = 1 
						LEFT JOIN ".ALLIANCE." a ON a.id = u.ally_id
						WHERE u.id = ".$PlayerID." AND u.universe = ".$UNI.";");

		$totalfights = $query['wons'] + $query['loos'] + $query['draws'];
		
		if ($totalfights == 0) {
			$siegprozent                = 0;
			$loosprozent                = 0;
			$drawsprozent               = 0;
		} else {
			$siegprozent                = 100 / $totalfights * $query['wons'];
			$loosprozent                = 100 / $totalfights * $query['loos'];
			$drawsprozent               = 100 / $totalfights * $query['draws'];
		}
		
		$IsNoobProtec		= CheckNoobProtec($USER, $query, $query);
		$Class		 		= array();
 
		if ($query['user_deleted'] == 1)
		{
			$Class		 	= array('supprimer_serveur');

		}
		elseif ($query['banaday'] > TIMESTAMP && $query['urlaubs_modus'] == 1)
		{
			$Class		 	= array('banni_serveur', 'violet');
		}
		elseif ($query['banaday'] > TIMESTAMP)
		{
			$Class		 	= array('banni_serveur');
		}
		elseif ($query['multi_spotted'] == 1)
		{
			$Class		 	= array('bleu');
		}
		elseif ($query['urlaubs_modus'] == 1)
		{
			$Class		 	= array('violet');
		}
		elseif ($query['immunity_until'] > TIMESTAMP)
		{
			$Class		 	= array('jaune');
		}
		elseif ($IsNoobProtec['NoobPlayer'])
		{
			$Class		 	= array('vert');
		}
		elseif ($IsNoobProtec['StrongPlayer'])
		{
			$Class		 	= array('rouge');
		}

		$this->tplObj->assign_vars(array(	
			'class'			=> $Class,
			'id'			=> $PlayerID,
			'yourid'		=> $USER['id'],
			'name'			=> $query['username'],
			'avatar'			=> $query['avatar'],
			'homeplanet'	=> $query['name'],
			'galaxy'		=> $query['galaxy'],
			'system'		=> $query['system'],
			'sexe'		=> $query['sexe'],
			'planet'		=> $query['planet'],
			'allyid'		=> $query['ally_id'],
			'date_of_birth'		=> $query['date_of_birth'],
			'tech_rank'     => pretty_number($query['tech_rank']),
			'tech_points'   => pretty_number($query['tech_points']),
			'pop_rank'     => pretty_number($query['popu_rank']),
			'pop_points'   => pretty_number($query['popu_points']),
			'build_rank'    => pretty_number($query['build_rank']),
			'build_points'  => pretty_number($query['build_points']),
			'defs_rank'     => pretty_number($query['defs_rank']),
			'defs_points'   => pretty_number($query['defs_points']),
			'fleet_rank'    => pretty_number($query['fleet_rank']),
			'fleet_points'  => pretty_number($query['fleet_points']),
			'total_rank'    => pretty_number($query['total_rank']),
			'total_points'  => pretty_number($query['total_points']),
			'allyname'		=> $query['ally_name'],
			'allytag'		=> $query['ally_tag'],
			'ddates'			=> date('m.d.y', $query['register_time']) ,
			'playerdestory' => sprintf($LNG['pl_destroy'], $query['username']),
			'wons'          => pretty_number($query['wons']),
			'loos'          => pretty_number($query['loos']),
			'draws'         => pretty_number($query['draws']),
			'kbmetal'       => pretty_number($query['kbmetal']),
			'kbcrystal'     => pretty_number($query['kbcrystal']),
			'lostunits'     => pretty_number($query['lostunits']),
			'desunits'      => pretty_number($query['desunits']),
			'totalfights'   => pretty_number($totalfights),
			'siegprozent'   => round($siegprozent, 2),
			'loosprozent'   => round($loosprozent, 2),
			'drawsprozent'  => round($drawsprozent, 2),
		));
		
		$this->display('page.playerCard.default.tpl');
	}
}