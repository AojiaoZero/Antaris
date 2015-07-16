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

class ShowExplorationsPage extends AbstractPage
{
	public static $requireModule = MODULE_RESSOURCE_LIST;

	function __construct() 
	{
		parent::__construct();
	}
	function expoFound()
	{
		global $LNG, $ProdGrid, $resource, $reslist, $CONF, $pricelist, $USER, $PLANET;
		
		foreach($reslist['items'] as $ID => $Element)
		{
				$itemsList[$Element]	= array(
				'level'				=> $USER[$resource[$Element]],
			);
		}
		
		$this->tplObj->assign_vars(array(	
		'itemsList'		=> $itemsList,
		));
		
		$this->display('page.explorations.found.tpl');
	}
	function expoBusy()
	{
		global $LNG, $ProdGrid, $resource, $reslist, $CONF, $pricelist, $USER, $PLANET;
		
		$multiData = array();
		$GeExplorations = $GLOBALS['DATABASE']->query("SELECT * FROM `uni1_explorations` WHERE userID = ".$USER['id']." ORDER BY emd_time;");
		$GeExplorationsCount =$GLOBALS['DATABASE']->getFirstCell("SELECT COUNT(*) FROM `uni1_explorations` WHERE userID = ".$USER['id'].";");
		while($xb = $GLOBALS['DATABASE']->fetch_array($GeExplorations)){
		if($xb['categorie'] == 1){
		$Cat = 'Réussite';
		}elseif($xb['categorie'] == 2){
		$Cat = 'Neutre';
		}elseif($xb['categorie'] == 3){
		$Cat = 'Echec PCP';
		}elseif($xb['categorie'] == 4){
		$Cat = 'Echec';
		}else{
		$Cat = '';	
		}	
		
		if($xb['subcategorie'] == 1){
		$SubCat = 'Objets rares';	
		}elseif($xb['subcategorie'] == 2){
		$SubCat = 'Découverte d\'une technologie';	
		}elseif($xb['subcategorie'] == 3){
		$SubCat = 'Offre commerciale';	
		}elseif($xb['subcategorie'] == 4){
		$SubCat = 'Ressource';	
		}elseif($xb['subcategorie'] == 5){
		$SubCat = 'Population';	
		}elseif($xb['subcategorie'] == 6){
		$SubCat = 'Découverte d\'appareil';	
		}elseif($xb['subcategorie'] == 7){
		$SubCat = 'Antaris';	
		}elseif($xb['subcategorie'] == 8){
		$SubCat = 'Modulateur énergétique';	
		}elseif($xb['subcategorie'] == 9){
		$SubCat = 'Joyeux noël';	
		}elseif($xb['subcategorie'] == 10){
		$SubCat = 'Perte totale de l\'équipe';	
		}elseif($xb['subcategorie'] == 11){
		$SubCat = 'Perte partielle de l\'équipe';	
		}else{
		$SubCat = '<span class="cyan">N/A</span>';
		}
			
		$multiData[$xb['explorationID']]	= array(
		'Cat'		=> $Cat,	
		'SubCat'		=> $SubCat,	
		'state'		=> $xb['state'],	
		'start_planet_name'		=> $xb['start_planet_name'],	
		'start_system'		=> $xb['start_system'],	
		'start_planet'		=> $xb['start_planet'],	
		'end_planet_name'		=> $xb['end_planet_name'],	
		'emd_time'		=> ((!empty($xb['emd_time']) && $xb['emd_time'] > TIMESTAMP) ? ($xb['emd_time'] - TIMESTAMP) : 0),	
		);
		}
		
		
		
		$this->tplObj->loadscript("jquery.countdown.js");
		$this->tplObj->assign_vars(array(	
		'multiData' => $multiData,
		'GeExplorationsCount' => $GeExplorationsCount,
		));
		$this->display('page.explorations.busy.tpl');
	}
	
	
	function details()
	{
		global $LNG, $ProdGrid, $resource, $reslist, $CONF, $pricelist, $USER, $PLANET;
		$explorationID	= HTTP::_GP('explorationID', '');
		$GeExplorations = $GLOBALS['DATABASE']->query("SELECT * FROM `uni1_explorations` WHERE explorationID = ".$explorationID."");
		while($xb = $GLOBALS['DATABASE']->fetch_array($GeExplorations)){
		$explorationID		= $xb['explorationID'];
		$state		= $xb['state'];
		$type_of_search		= $xb['type_of_search'];
		$start_planet_name		= $xb['start_planet_name'];	
		$start_system		= $xb['start_system'];
		$start_planet		= $xb['start_planet'];	
		$population_array		= $xb['population_array'];	
		$image		= $xb['image'];	
		$end_planet_name		= $xb['end_planet_name'];	
		$emd_time		= date('d/m/Y H:i:s', $xb['emd_time']);	
		$start_time		= date('d/m/Y H:i:s', $xb['start_time']);	
		if($xb['categorie'] == 1){
		$Cat = 'Réussite';
		}elseif($xb['categorie'] == 2){
		$Cat = 'Neutre';
		}elseif($xb['categorie'] == 3){
		$Cat = 'Echec PCP';
		}elseif($xb['categorie'] == 4){
		$Cat = 'Echec';
		}else{
		$Cat = '';	
		}	
		
		if($xb['subcategorie'] == 1){
		$SubCat = 'Objets rares';	
		}elseif($xb['subcategorie'] == 2){
		$SubCat = 'Découverte d\'une technologie';	
		}elseif($xb['subcategorie'] == 3){
		$SubCat = 'Offre commerciale';	
		}elseif($xb['subcategorie'] == 4){
		$SubCat = 'Ressource';	
		}elseif($xb['subcategorie'] == 5){
		$SubCat = 'Population';	
		}elseif($xb['subcategorie'] == 6){
		$SubCat = 'Découverte d\'appareil';	
		}elseif($xb['subcategorie'] == 7){
		$SubCat = 'Antaris';	
		}elseif($xb['subcategorie'] == 8){
		$SubCat = 'Modulateur énergétique';	
		}elseif($xb['subcategorie'] == 9){
		$SubCat = 'Joyeux noël';	
		}elseif($xb['subcategorie'] == 10){
		$SubCat = 'Perte totale de l\'équipe';	
		}elseif($xb['subcategorie'] == 11){
		$SubCat = 'Perte partielle de l\'équipe';	
		}else{
		$SubCat = 'N/A';
		}
		}
		$FleetRec		= explode(';', $population_array);
		foreach($FleetRec as $Item => $Group)
			{

				$Ship    = explode(',', $Group);
				
				$multiData[]	= array(
				'Name' => $LNG['tech'][$Ship[0]],
				'Amount' => pretty_number($Ship[1]),
				);	
			}
		
		if($type_of_search == 1){
		$Speed = 'Rapide';
		}elseif($type_of_search == 2){
		$Speed = 'Intermediare';
		}elseif($type_of_search == 3){
		$Speed = 'Longue';
		}
		
	
		
		$this->tplObj->assign_vars(array(	
		'SubCat' => $SubCat,
		'Cat' => $Cat,
		'imaget' => $image,
		'explorationID' => $explorationID,
		'multiData' => $multiData,
		'state' => $state,
		'Speed' => $Speed,
		'start_planet_name' => $start_planet_name,
		'start_system' => $start_system,
		'start_planet' => $start_planet,
		'end_planet_name' => $end_planet_name,
		'emd_time' => $emd_time,
		'start_time' => $start_time,
		));
		$this->display('page.explorations.details.tpl');
	}
	
	function sendExpo()
	{
		global $LNG, $ProdGrid, $resource, $reslist, $CONF, $pricelist, $USER, $PLANET;
		
		$Type_search	= HTTP::_GP('type_fouille', '');
		$Popu		= array();
		
		$endtime = 0;
		if($Type_search == 1){
		$endtime = rand(7200,9000);
		}elseif($Type_search == 2){
		$endtime = rand(14400,16200);
		}elseif($Type_search == 3){
		$endtime = rand(21600,23400);
		}
		
		foreach ($reslist['population'] as $id => $popID)
		{
			$amount		 				= max(0, round(HTTP::_GP('population'.$popID, 0.0, 0.0)));
			
			if ($amount < 1) continue;
			$Popu[$popID]				= $amount;
		}
		
		//if (empty($Popu))
		//FleetFunctions::GotoFleetPage();
	
	
		$token		= getRandomString();
		
		$_SESSION['population'][$token]	= array(
			'time'		=> TIMESTAMP,
			'population'		=> $Popu,
		);
		
		$fleetArray  	= $_SESSION['population'][$token]['population'];
		
		foreach ($fleetArray as $Ship => $Count)
		{
			if ($Count > $PLANET[$resource[$Ship]]) {
				$this->printMessage('<span class="rouge">'.$LNG['ls_explora_27'].'</span>');
			}
		}
		
		foreach($fleetArray as $ShipID => $ShipCount) {
			$fleetData[]	= $ShipID.','.floattostring($ShipCount);
			$planetQuery[]	= $resource[$ShipID]." = ".$resource[$ShipID]." - ".floattostring($ShipCount);
			$PLANET[$resource[$ShipID]] -= floattostring($ShipCount);
		}
		
		$SQL	= "LOCK TABLE uni1_explorations WRITE, ".USERS." WRITE, ".PLANETS." WRITE;
				   UPDATE ".PLANETS." SET ".implode(", ", $planetQuery)." WHERE id = ".$PLANET['id'].";
				   UPDATE ".USERS." SET max_explore = max_explore + 1 WHERE id = ".$USER['id'].";
				   INSERT INTO uni1_explorations SET
				   userID              = ".$USER['id'].",
				   state              = '1',
				   type_of_search              = ".$Type_search.",
				   start_planet_name              = '".$PLANET['name']."',
				   start_system              = ".$PLANET['system'].",
				   start_planet              = ".$PLANET['planet'].",
				   end_planet_name              = '".$PLANET['name']."',
				   start_time              = ".TIMESTAMP.",
				   emd_time              = ".(TIMESTAMP + $endtime).",
				   population_array              = '".implode(';',$fleetData)."',
				   ships_array              = '".implode(';',$fleetData)."';
				   SET @explorationID = LAST_INSERT_ID();
				   UNLOCK TABLES;";
				   $GLOBALS['DATABASE']->multi_query($SQL);
		
		$this->printMessage('<span class="vert">'.$LNG['ls_explora_26'].'</span>',  true, array('game.php?page=Explorations', 3)); 
		
		
		$this->tplObj->assign_vars(array(	
		));
		$this->display('page.explorations.busy.tpl');
	}

	
	function show()
	{
		global $LNG, $ProdGrid, $resource, $reslist, $CONF, $pricelist, $USER, $PLANET;
		//Soldat 50
		//Scientifique 10
		if($USER['id'] != 1){
		$this->printMessage('<span class="rouge">This function will be avaible in version 1.2 of Antaris Legacy</span>',  true, array('game.php?page=overview', 3)); 	
		}
		$PopulationOnPlanet	= array();
		$avaible_pop = array(302,303,306,307,304,305);
		foreach($avaible_pop as $populationID)
		{
			
				
			$PopulationOnPlanet[]	= array(
				'id'	=> $populationID,
				'count'	=> $PLANET[$resource[$populationID]],
			);
		}	
		
		$FleetsOnPlanet	= array();
		$avaible_fleets = array(202,203,217,219);
		foreach($avaible_fleets as $fleetID)
		{
			
				
			$FleetsOnPlanet[]	= array(
				'id'	=> $fleetID,
				'count'	=> $PLANET[$resource[$fleetID]],
			);
		}
		$this->tplObj->loadscript('exploration.js');
		$this->tplObj->assign_vars(array(	
		'max_explore' => $USER['max_explore'],
		'teleport_portal' => $PLANET['teleport_portal'],
		'PopulationOnPlanet' => $PopulationOnPlanet,
		'FleetsOnPlanet' => $FleetsOnPlanet,
		));
		
		$this->display('page.explorations.default.tpl');
	}
}
