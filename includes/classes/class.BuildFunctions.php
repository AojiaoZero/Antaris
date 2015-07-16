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
 * @info $Id: class.BuildFunctions.php 2641 2013-03-24 13:43:52Z slaver7 $
 * @link http://2moons.cc/
 */

class BuildFunctions
{
	
	static $bonusList	= array(
		'Attack',
		'Defensive',
		'Shield',
		'BuildTime',
		'ResearchTime',
		'ShipTime',
		'DefensiveTime',
		'Resource',
		'Energy',
		'ResourceStorage',
		'ShipStorage',
		'FlyTime',
		'FleetSlots',
		'Planets',
		'SpyPower',
		'Expedition',
		'GateCoolTime',
		'MoreFound',
	);

	public static function getBonusList()
	{
		return self::$bonusList;
	}
	
	public static function getRestPrice($USER, $PLANET, $Element, $elementPrice = NULL)
	{
		global $resource;
		
		if(!isset($elementPrice)) {
			$elementPrice	= self::getElementPrice($USER, $PLANET, $Element);
		}
		
		$overflow	= array();
		
		foreach ($elementPrice as $resType => $resPrice) {
			$avalible			= isset($PLANET[$resource[$resType]]) ? $PLANET[$resource[$resType]] : $USER[$resource[$resType]];
			$overflow[$resType] = max($resPrice - $avalible, 0);
		}

		return $overflow;
	}
	
	public static function getElementPrice($USER, $PLANET, $Element, $forDestroy = false, $forLevel = NULL) { 
		global $pricelist, $resource, $reslist;

       	if (in_array($Element, $reslist['fleet']) || in_array($Element, $reslist['defense']) || in_array($Element, $reslist['missile'])) {
			$elementLevel = $forLevel;
		} elseif (isset($forLevel)) {
			$elementLevel = $forLevel;
		} elseif (isset($PLANET[$resource[$Element]])) {
			$elementLevel = $PLANET[$resource[$Element]];
		} elseif (isset($USER[$resource[$Element]])) {
			$elementLevel = $USER[$resource[$Element]];
		} else {
			return array();
		}
		
		$price	= array();
		foreach ($reslist['ressources'] as $resType)
		{
			if (!isset($pricelist[$Element]['cost'][$resType])) {
				continue;
			}
			$ressourceAmount	= $pricelist[$Element]['cost'][$resType];
			
			if ($ressourceAmount == 0) {
				continue;
			}
			
			$price[$resType]	= $ressourceAmount;
			
			if(isset($pricelist[$Element]['factor']) && $pricelist[$Element]['factor'] != 0 && $pricelist[$Element]['factor'] != 1) {
				$price[$resType]	*= pow($pricelist[$Element]['factor'], $elementLevel);
			}
			
			if($forLevel && (in_array($Element, $reslist['fleet']) || in_array($Element, $reslist['defense']) || in_array($Element, $reslist['missile']))) {
				$price[$resType]	*= $elementLevel;
			}
			
			if($forDestroy === true) {
				$price[$resType]	/= 2;
			}
		}
		
		return $price; 
	}
	
	public static function isTechnologieAccessible($USER, $PLANET, $Element)
	{
		global $requeriments, $resource;
		
		if(!isset($requeriments[$Element]))
			return true;		

		foreach($requeriments[$Element] as $ReqElement => $EleLevel)
		{
			if (
				(isset($USER[$resource[$ReqElement]]) && $USER[$resource[$ReqElement]] < $EleLevel) || 
				(isset($PLANET[$resource[$ReqElement]]) && $PLANET[$resource[$ReqElement]] < $EleLevel)
			) {
				return false;
			}
		}
		return true;
	}
	
	public static function getBuildingTime($USER, $PLANET, $Element, $elementPrice = NULL, $forDestroy = false, $forLevel = NULL)
	{
		global $resource, $reslist, $requeriments;
		$MinTech = 0.00005 * $PLANET['technician_used'];
		$MinScien = 0.00005 * $PLANET['scientis_used'];
		$Siege = 0;
		if($PLANET['siege_on'] > TIMESTAMP){
		$Siege = 0.30;	
		}
		$Fastmode = 0;
		if($USER['mode_rapide'] > TIMESTAMP){
		$Fastmode = 0.20;	
		}
		$CONF	= Config::getAll(NULL, $USER['universe']);

        $time   = 0;

        if(!isset($elementPrice)) {
			$elementPrice	= self::getElementPrice($USER, $PLANET, $Element, $forDestroy, $forLevel);
		}
		
		$elementCost	= 0;
		
		if(isset($elementPrice[901])) {
			$elementCost	+= $elementPrice[901];
		}
		
		if(isset($elementPrice[902])) {
			$elementCost	+= $elementPrice[902];
		}
		
		if(isset($elementPrice[903])) {
			$elementCost	+= $elementPrice[903];
		}
		
		if(isset($elementPrice[904])) {
			$elementCost	+= $elementPrice[904];
		}
		
		if	   (in_array($Element, $reslist['build'])) {
			$time	= $elementCost / (Config::get('game_speed') * (1 + $PLANET[$resource[14]])) * (1 + $USER['factor']['BuildTime']);
			$time	*= 1- $MinTech;
			$time	*=  1-$Siege;
			$time	*=  1-$Fastmode;
		} elseif (in_array($Element, $reslist['fleet'])) {
			$time	= $elementCost / (Config::get('game_speed') * (1 + $PLANET[$resource[14]] / 2) * (1 + $PLANET[$resource[21]] * 0.08)) * (1 + $USER['factor']['ShipTime']);	
			$time	*=  1-$Fastmode;
		} elseif (in_array($Element, $reslist['defense'])) {
			$time	= $elementCost / (Config::get('game_speed') * (1 + $PLANET[$resource[14]] / 2) * (1 + $PLANET[$resource[46]] * 0.08)) * (1 + $USER['factor']['DefensiveTime']);
			$time	*=  1-$Fastmode;
		} elseif (in_array($Element, $reslist['tech'])) {
			if(is_numeric($USER['intergalactic_tech']))
			{
				$Level	= $PLANET[$resource[31]];
			} else {
				$Level = 0;
				foreach($USER['intergalactic_tech'] as $Levels)
				{
					if(!isset($requeriments[$Element][31]) || $Levels >= $requeriments[$Element][31])
						$Level += $Levels;
				}
			}
			
			$time	= $elementCost / (1000 * (1 + $Level)) / (Config::get('game_speed') / 2500) * (1 + $USER['factor']['ResearchTime']);
			$time	*=  1-$MinScien;
			$time	*=  1-$Siege;
			$time	*=  1-$Fastmode;
		}
		
		if($forDestroy) {
			$time	= floor($time * 1300);
		} else {
			$time	= floor($time * 3600);
		}
		
		return max($time, Config::get('min_build_time'));
	}
	
	public static function isElementBuyable($USER, $PLANET, $Element, $elementPrice = NULL, $forDestroy = false, $forLevel = NULL)
	{
		$rest	= self::getRestPrice($USER, $PLANET, $Element, $elementPrice, $forDestroy, $forLevel);
		return count(array_filter($rest)) === 0;
	}
	
	public static function getMaxConstructibleElements($USER, $PLANET, $Element, $elementPrice = NULL)
	{
		global $resource, $reslist;
		
		if(!isset($elementPrice)) {
			$elementPrice	= self::getElementPrice($USER, $PLANET, $Element);
		}

		$maxElement	= array();
		
		foreach($elementPrice as $resourceID => $price)
		{
			if(isset($PLANET[$resource[$resourceID]]))
			{
				$maxElement[]	= floor($PLANET[$resource[$resourceID]] / $price);
			}
			elseif(isset($USER[$resource[$resourceID]]))
			{
				$maxElement[]	= floor($USER[$resource[$resourceID]] / $price);
			}
			else
			{
				throw new Exception("Unknown Ressource ".$resourceID." at element ".$Element.".");
			}
		}
		
		if(in_array($Element, $reslist['one'])) {
			$maxElement[]	= 1;
		}
		
		return min($maxElement);
	}
	
	public static function getMaxConstructibleRockets($USER, $PLANET, $Missiles = NULL)
	{
		global $resource, $reslist;

		if(!isset($Missiles))
		{		
			$Missiles	= array();
			
			foreach($reslist['missile'] as $elementID)
			{
				$Missiles[$elementID]	= $PLANET[$resource[$elementID]];
			}
		}
		
		$BuildArray  	  	= !empty($PLANET['b_hangar_id']) ? unserialize($PLANET['b_hangar_id']) : array();
		$MaxMissiles   		= $PLANET[$resource[44]] * 10 * max(Config::get('silo_factor'), 1);

		foreach($BuildArray as $ElementArray) {
			if(isset($Missiles[$ElementArray[0]]))
				$Missiles[$ElementArray[0]] += $ElementArray[1];
		}
		
		$ActuMissiles  = $Missiles[502] + (2 * $Missiles[503]);
		$MissilesSpace = max(0, $MaxMissiles - $ActuMissiles);
		
		return array(
			502	=> $MissilesSpace,
			503	=> floor($MissilesSpace / 2),
		);
	}
	
	public static function getAvalibleEffect($Element)
	{
		global $pricelist, $LNG;
			
		$elementEffect	= $LNG['gameeffect'][$Element];
		
		
		return $elementEffect;
	}
	
	public static function getAvalibleBonus($Element)
	{
		global $pricelist;
			
		$elementBonus	= array();
		
		foreach(self::$bonusList as $bonus)
		{
			$temp	= (float) $pricelist[$Element]['bonus'][$bonus][0];
			if(empty($temp))
			{
				continue;
			}
			
			$elementBonus[$bonus]	= $pricelist[$Element]['bonus'][$bonus];
		}
		
		return $elementBonus;
	}
}