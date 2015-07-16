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

class ShowResourcesPage extends AbstractPage
{
	public static $requireModule = MODULE_RESSOURCE_LIST;

	function __construct() 
	{
		parent::__construct();
	}
	
	
	function send()
	{
		global $LNG, $resource, $USER, $PLANET;
		$name   = HTTP::_GP('name', '', UTF8_SUPPORT);
		$action   = HTTP::_GP('action', '', UTF8_SUPPORT);
		$amount   = HTTP::_GP('amount', 0);
		
		if($name == 'metal_prod'){
		$dbname = 'metal_mine_porcent';
		$dbname2 = 'metal_mine_extract_porcent';
		$Value = $amount / 10;
		}elseif($name == 'crystal_prod'){
		$dbname = 'crystal_mine_porcent';
		$dbname2 = 'crystal_mine_extract_porcent';
		$Value = $amount / 10;
		}elseif($name == 'deuterium_prod'){
		$dbname = 'deuterium_sintetizer_porcent';
		$dbname2 = 'deuterium_sintetizer_extract_porcent';
		$Value = $amount / 10;
		}elseif($name == 'elyrium_prod'){
		$dbname = 'elyrium_mine_porcent';
		$dbname2 = 'elyrium_mine_extract_porcent';
		$Value = $amount / 10;
		}
		
		
		if ($USER['urlaubs_modus'] == 0)
		{
			
			$updateSQL	= array();
			
			$FieldName = $dbname;
				if (!isset($PLANET[$FieldName]))
					return false;
			$FieldName2 = $dbname2;
				if (!isset($PLANET[$FieldName2]))
					return false;
				if($Value < 0)
			return false;
		
				$updateSQL[]	= $FieldName." = '".((int) $Value)."'";
				$updateSQL[]	.= $FieldName2." = '".((int) $Value)."'";
				
				$PLANET[$FieldName]	= $Value;
				$PLANET[$FieldName2]	= $Value;
				$this->ecoObj->PLANET[$FieldName]	= $Value;
				$this->ecoObj->PLANET[$FieldName2]	= $Value;
			

			if(!empty($updateSQL))
			{
				$GLOBALS['DATABASE']->query("UPDATE ".PLANETS." SET ".$FieldName." = '".((int) $Value)."', ".$FieldName2." = '".((int) $Value)."' WHERE `id` = ".$PLANET['id'] .";");
				
				$this->ecoObj->ReBuildCache();
				$this->ecoObj->PLANET['eco_hash'] = $this->ecoObj->CreateHash();
				$PLANET = $this->ecoObj->PLANET;
			}
		}
		$this->save();
		
	}
	
	function show()
	{
		global $LNG, $ProdGrid, $resource, $reslist, $CONF, $pricelist, $USER, $PLANET;
		//if($USER['id'] != 1){
		//$this->printMessage("<span class='rouge'>This page is under maintenace, come back in some minutes</span>", true, array('game.php?page=overview', 2));		
		//}
		if($USER['urlaubs_modus'] == 1 || $PLANET['planet_type'] != 1)
		{
			$basicIncome[901]	= 0;
			$basicIncome[902]	= 0;
			$basicIncome[903]	= 0;
			$basicIncome[904]	= 0;
			$basicIncome[911]	= 0;
		}
		else
		{		
			$basicIncome[901]	= Config::get($resource[901].'_basic_income');
			$basicIncome[902]	= Config::get($resource[902].'_basic_income');
			$basicIncome[903]	= Config::get($resource[903].'_basic_income');
			$basicIncome[904]	= Config::get($resource[904].'_basic_income');
			$basicIncome[911]	= Config::get($resource[911].'_basic_income');
		}
		
		$temp	= array(
			901	=> array(
				'plus'	=> 0,
				'minus'	=> 0,
			),
			902	=> array(
				'plus'	=> 0,
				'minus'	=> 0,
			),
			903	=> array(
				'plus'	=> 0,
				'minus'	=> 0,
			),
			904	=> array(
				'plus'	=> 0,
				'minus'	=> 0,
			),
			911	=> array(
				'plus'	=> 0,
				'minus'	=> 0,
			)
		);
		
		$BuildTemp		= $PLANET['temp_max'];
		$BuildEnergy	= $USER[$resource[113]];
		
		$ressIDs		= array_merge(array(), $reslist['resstype'][1], $reslist['resstype'][2]);
		
		if($PLANET['energy_used'] != 0) {
			$prodLevel	= min(1, $PLANET['energy'] / abs($PLANET['energy_used']));
		} else {
			$prodLevel	= 0;
		}
		
		$prodList = array(4,10,1,2,3,48,7,8,9,11);
		foreach($prodList as $ProdID)
		{	
			$BuildLevelFactor	= $PLANET[$resource[$ProdID].'_porcent'];
			$BuildLevel 		= $PLANET[$resource[$ProdID]];
		
			$productionList[$ProdID]	= array(
				'production'	=> array(901 => 0, 902 => 0, 903 => 0, 904 => 0, 911 => 0),
				'elementLevel'	=> $PLANET[$resource[$ProdID]],
				'prodLevel'		=> $PLANET[$resource[$ProdID].'_porcent'] * 10,
			);
			
			foreach($ressIDs as $ID) 
			{
				if(!isset($ProdGrid[$ProdID]['production'][$ID]))
					continue;
					
				$Production	= eval(ResourceUpdate::getProd($ProdGrid[$ProdID]['production'][$ID]));
				
				if($ID != 911)
				{
					$Production	*= $prodLevel * 20;
				}
				else
				{
					$Production	*= Config::get('energySpeed');
				}
				
				$productionList[$ProdID]['production'][$ID]	= $Production;
				
				if($Production > 0) {
					if($PLANET[$resource[$ID]] == 0) continue;
					
					$temp[$ID]['plus']	+= $Production;
				} else {
					$temp[$ID]['minus']	+= $Production;
				}
			}
		}
				
		$storage	= array(
			901 => shortly_number($PLANET[$resource[901].'_max']),
			902 => shortly_number($PLANET[$resource[902].'_max']),
			903 => shortly_number($PLANET[$resource[903].'_max']),
			904 => shortly_number($PLANET[$resource[904].'_max']),
		);
		
		$basicProduction	= array(
			901 => $basicIncome[901] * Config::get('resource_multiplier'),
			902 => $basicIncome[902] * Config::get('resource_multiplier'),
			903	=> $basicIncome[903] * Config::get('resource_multiplier'),
			904	=> $basicIncome[904] * Config::get('resource_multiplier'),
			911	=> $basicIncome[911] * Config::get('energySpeed'),
		);
		
		$totalProduction	= array(
			901 => $PLANET[$resource[901].'_perhour'] + $basicProduction[901],
			902 => $PLANET[$resource[902].'_perhour'] + $basicProduction[902],
			903	=> $PLANET[$resource[903].'_perhour'] + $basicProduction[903],
			904	=> $PLANET[$resource[904].'_perhour'] + $basicProduction[904],
			911	=> $PLANET[$resource[911]] + $basicProduction[911] + $PLANET[$resource[911].'_used'],
		);
		
		$bonusProduction	= array(
			901 => $temp[901]['plus'] * ($USER['factor']['Resource'] + 0.02 * $USER[$resource[131]]),
			902 => $temp[902]['plus'] * ($USER['factor']['Resource'] + 0.02 * $USER[$resource[132]]),
			903	=> $temp[903]['plus'] * ($USER['factor']['Resource'] + 0.02 * $USER[$resource[133]]),
			904	=> $temp[904]['plus'] * ($USER['factor']['Resource'] + 0.02 * $USER[$resource[133]]),
			911	=> $temp[911]['plus'] * $USER['factor']['Energy'],
		);
		
		$dailyProduction	= array(
			901 => $totalProduction[901] * 24,
			902 => $totalProduction[902] * 24,
			903	=> $totalProduction[903] * 24,
			904	=> $totalProduction[904] * 24,
			911	=> $totalProduction[911],
		);
		
		$weeklyProduction	= array(
			901 => $totalProduction[901] * 168,
			902 => $totalProduction[902] * 168,
			903	=> $totalProduction[903] * 168,
			904	=> $totalProduction[904] * 168,
			911	=> $totalProduction[911],
		);
		
		$CivilProduction	= array(
			901 => $totalProduction[901] / 100 * 0.0002 * $PLANET['civil'],
			902 => $totalProduction[902] / 100 * 0.0002 * $PLANET['civil'],
			903	=> $totalProduction[903] / 100 * 0.0002 * $PLANET['civil'],
			904	=> $totalProduction[904] / 100 * 0.0002 * $PLANET['civil'],
			911	=> 0,
		);
	
			
		$prodSelector	= array();
		
		foreach(range(0, 10) as $procent) {
			$prodSelector[$procent]	= ($procent * 10).'%';
		}
		
		$this->tplObj->loadscript('resource.js');
		$this->tplObj->assign_vars(array(	
			'header'			=> sprintf($LNG['rs_production_on_planet'], $PLANET['name']),
			'prodSelector'		=> $prodSelector,
			'productionList'	=> $productionList,
			'basicProduction'	=> $basicProduction,
			'totalProduction'	=> $totalProduction,
			'bonusProduction'	=> $bonusProduction,
			'dailyProduction'	=> $dailyProduction,
			'weeklyProduction'	=> $weeklyProduction,
			'CivilProduction'	=> $CivilProduction,
			'storage'			=> $storage,
			'colo_metal'		=> $PLANET['colo_metal'],
			'colo_crystal'		=> $PLANET['colo_crystal'],
			'colo_deut'		=> $PLANET['colo_deut'],
			'colo_elyrium'		=> $PLANET['colo_elyrium'],
			'metalprod'		=> $PLANET['metal_mine_porcent'] * 10,
			'crystalprod'		=> $PLANET['crystal_mine_porcent'] * 10,
			'deutprod'		=> $PLANET['deuterium_sintetizer_porcent'] * 10,
			'elyriumprod'		=> $PLANET['elyrium_mine_porcent'] * 10,
		));
		
		$this->display('page.resources.default.tpl');
	}
}
