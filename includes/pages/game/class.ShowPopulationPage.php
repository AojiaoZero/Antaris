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

class ShowPopulationPage extends AbstractPage
{
	public static $requireModule = MODULE_RESSOURCE_LIST;

	function __construct() 
	{
		parent::__construct();
	}
	
	function comfirm()
	{
		global $USER, $PLANET, $LNG, $resource, $dpath, $reslist, $CONF;
		
		$population_301		= HTTP::_GP('population_301', 0);
		$population_302		= HTTP::_GP('population_302', 0);
		$population_303		= HTTP::_GP('population_303', 0);
		$population_304		= HTTP::_GP('population_304', 0);
		$population_305		= HTTP::_GP('population_305', 0);
		$population_306		= HTTP::_GP('population_306', 0);
		$population_307		= HTTP::_GP('population_307', 0);
		$population_308		= HTTP::_GP('population_308', 0);
		$cost_population_301		= $population_301 * 1;
		$cost_population_302		= $population_302 * 3;
		$cost_population_303		= $population_303 * 4;
		$cost_population_304		= $population_304 * 50;
		$cost_population_305		= $population_305 * 20;
		$cost_population_306		= $population_306 * 12;
		$cost_population_307		= $population_307 * 44;
		$cost_population_308		= $population_308 * 4;
		$MaxPoints = $PLANET['formation'];
		$TotalCost = $cost_population_301 + $cost_population_302 + $cost_population_303 + $cost_population_304 + $cost_population_305 + $cost_population_306 + $cost_population_307 + $cost_population_308;
		if($TotalCost > $MaxPoints){
		$this->printMessage("<span class='rouge'>Your barracks do not produce enough training unit to make these changes.</span>", true, array('game.php?page=immunity', 3));	
		}else{
		$GLOBALS['DATABASE']->query("Update ".PLANETS." SET `civil_prod` = ".$population_301.", `technician_prod` = ".$population_302.", `scientist_prod` = ".$population_303.", `archaeologist_prod` = ".$population_304.", `diplomat_prod` = ".$population_305.", `soldier_prod` = ".$population_306.", `adv_soldier_prod` = ".$population_307.", `pilot_prod` = ".$population_308.", `formation_used` = ".$TotalCost." WHERE `id` = ".$PLANET['id']." ;");
		$this->printMessage("<span class='vert'>You succesfully edited your formation units production</span>", true, array('game.php?page=immunity', 3));
		}
	
	
	}
	
	function show()
	{
		global $USER, $PLANET, $LNG, $resource, $dpath, $reslist, $CONF;
		
	
		$elementIDs	= $reslist['population'];
		
		foreach($elementIDs as $Element)
		{	
		
			$AllTech = array();
   
			$GetAll = $GLOBALS['DATABASE']->query("SELECT * FROM `uni1_vars_requriements` WHERE elementID = ".$Element." ;");
			if($GLOBALS['DATABASE']->numRows($GetAll)>0){
			while($x = $GLOBALS['DATABASE']->fetch_array($GetAll)){
			$AllTech[] = $x;
			}
			}
			
			$costRessources		= BuildFunctions::getElementPrice($USER, $PLANET, $Element, false, false);
			$Produced = 0;
			$Cost = 0;
			if($Element == 301){
			$Cost = 1;	
			}elseif($Element == 302){
			$Cost = 3;	
			}elseif($Element == 303){
			$Cost = 4;
			}elseif($Element == 304){
			$Cost = 50;	
			}elseif($Element == 305){
			$Cost = 20;	
			}elseif($Element == 306){
			$Cost = 12;	
			}elseif($Element == 307){
			$Cost = 44;	
			}elseif($Element == 308){
			$Cost = 4;	
			}
			if($Element != 309){
			$Produced = $PLANET[$resource[$Element].'_prod'];
			$TotalCost = $Produced * $Cost;
			}
			
			
			$elementList[$Element]	= array(
				'amount'				=> pretty_number(round($PLANET[$resource[$Element]])),
				'costRessources'				=> $costRessources,
				'Produced'				=> $Produced,
				'TotalCost'				=> $TotalCost,
				'id'				=> $Element,
				'AllTech'		=> $AllTech,
				'techacc' => BuildFunctions::isTechnologieAccessible($USER, $PLANET, $Element),
			);
		}
		
		
		$this->tplObj->loadscript("population.js");
		$this->tplObj->assign_vars(array(	
			'notused' => pretty_number($PLANET['formation'] - $PLANET['formation_used']),
			'elementList' => $elementList,
			'formation' => pretty_number($PLANET['formation']),
			'formationBis' => $PLANET['formation'],
		));
		
		$this->display('page.population.default.tpl');
	}
}
