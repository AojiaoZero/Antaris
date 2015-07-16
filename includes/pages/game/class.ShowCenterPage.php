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

class ShowCenterPage extends AbstractPage
{
	public static $requireModule = MODULE_RESSOURCE_LIST;

	function __construct() 
	{
		parent::__construct();
	}
	function mission()
	{
		global $LNG, $ProdGrid, $resource, $reslist, $CONF, $pricelist, $USER, $PLANET;
		require_once('includes/classes/class.FleetFunctions.php');

		$cmdd   = HTTP::_GP('cmdd', '');
		$missionDescription = '';
		if($cmdd == 'deploy'){
		$missionDescription = "Par le biais de cette mission, vous pouvez baser des ressources, du matériel et de la population uniquement sur une des planètes de votre empire. 
                                        Contrairement à la mission « Transporter des ressources et/ou du matériel », les vaisseaux qui constituent la flotte envoyée ne reviendront pas 
                                        sur la planète de départ. En effet, ils resteront sur la planète de destination (<i>un aller simple sans retour</i>).<br><br>
                                        Bien entendu, il est nécessaire de développer les soutes de vos vaisseaux pour pouvoir baser une grande quantité de marchandises.";
		}elseif($cmdd == 'transport'){
		$missionDescription = "Par le biais de cette mission, vous pouvez transporter des ressources, du matériel et de la population sur une de vos planètes ou celle d'un allié. 
                                        Une fois la mission effectuée, les vaisseaux qui constituent votre flotte reviendront sur la planète de départ.<br><br>
                                        Pour pouvoir envoyer des ressources et/ou du matériel à un autre joueur, vous devez auparavant envoyer un pacte à celui-ci. 
                                        C'est seulement une fois le pacte signé que vous pourrez effectuer des transferts.";
		}elseif($cmdd == 'colonise'){
		$missionDescription = "Il est très important de coloniser d'autres planètes, cela permet d'accélérer le développement de votre empire
                                        puisque vous posséderez plus de matière première, et des bâtiments miniers en plus grand nombre. Ainsi votre production
                                        de ressources sera plus conséquente. Il y a aussi un autre avantage, vous pourrez régner sur une plus grande partie de l'univers.<br><br>
                                        Pour effectuer cette mission, vous devez posséder au moins 10 scientifiques, et 100 soldats. 
                                        Faites attention à la position de vos colonies car vous pouvez coloniser que 9 planètes en plus de votre planète mère. 
                                        Les planètes sont colonisables du système solaire 1 à 2 700 inclus.";
		}elseif($cmdd == 'contact'){
		$missionDescription = "Les pactes sont très utiles pour faire du commerce avec les autres joueurs de cet univers. Il n'est pas possible d'échanger des ressources 
                                        et/ou du matériel, si vous ne possédez pas de pacte signé avec le joueur concerné.<br><br>Cette mission permet d'envoyer un contingent 
                                        de 5 diplomates et 10 soldats pour rencontrer les dirigeants de la planète indiquée par les coordonnées renseignées.";
		}elseif($cmdd == 'recycle'){
		$missionDescription = "Si une bataille spatiale vient de se produire et que vous souhaitez recycler les ruines des vaisseaux détruits en orbite, alors, 
                                        il suffit d'envoyer vos vaisseaux ruines vers la planète en question. Ces vaisseaux particuliers ne nécessitent pas d'avoir un équipage.<br><br>
                                        Une fois en orbite autour de cette planète, ils recycleront les diverses ruines pour les transformer en ressources expoitables par votre peuple.";
		}elseif($cmdd == 'deployfleets'){
		$missionDescription = "Par le biais de cette mission, vous pouvez baser des vaisseaux ruines sur une de vos planètes ou celle d'un allié. Si vous envoyez vos vaisseaux 
                                        ruines chez un allié, vous en perdrez le contrôle.<br><br>Pour pouvoir envoyer des vaisseaux ruines à un autre joueur, vous devez auparavant 
                                        envoyer un pacte à celui-ci. C'est seulement une fois le pacte signé que vous pourrez effectuer le basement.";
		}elseif($cmdd == 'probe'){
		$missionDescription = "Un voisin vous inquiète, vous avez peur qu’il vous attaque ou bien il vous espionne régulièrement. Faites de même, envoyez vos sondes spatiales 
                                        vers ses planètes afin de découvrir les mystères qu’il cache chez lui. <br><br>Vous devez disposer d'une sonde spatiale pour effectuer cette mission. 
                                        De plus, il est possible de faire retour une fois la mission lancée, dans ce cas, la sonde spatiale revient à la base.<br><br>
                                        Il est impossible de modifier la quantité de sonde à envoyer dans le formulaire ci-dessous.";
		}elseif($cmdd == 'attack'){
		$missionDescription = "La puissance d'un empire se mesure à la puissance de sa flotte. Cependant, certaines flottes puissantes peuvent être détruites facilement suite à une mauvaise stratégie. 
                                        Montrez aux autres peuples qui vivent dans cette galaxie qu'il ne suffit pas d'avoir la plus grande flotte, il faut aussi savoir s'en servir convenablement.<br><br>
                                        Utilisez votre flotte pour détruire et mettre en ruine celles des autres peuples, utilisez-là intelligement pour lutter contre des empires plus puissants que vous. 
                                        La stratégie et votre palmarés de combat feront de vous le peuple le plus respecté de cette univers.";
		}
		$colonyList 	= $this->GetColonyList();
		$FleetsOnPlanet	= array();
		foreach($reslist['fleet'] as $FleetID)
		{
			if ($PLANET[$resource[$FleetID]] == 0)
				continue;
				
			$FleetsOnPlanet[]	= array(
				'id'	=> $FleetID,
				'speed'	=> FleetFunctions::GetFleetMaxSpeed($FleetID, $USER),
				'count'	=> $PLANET[$resource[$FleetID]],
			);
		}
		$PopulationOnPlanet	= array();
		foreach($reslist['population'] as $populationID)
		{
			if ($PLANET[$resource[$populationID]] == 0)
				continue;
				
			$PopulationOnPlanet[]	= array(
				'id'	=> $populationID,
				'count'	=> $PLANET[$resource[$populationID]],
			);
		}
			
		$this->tplObj->loadscript('flotten.js');
		$this->tplObj->assign_vars(array(	
		'missionDescription' => $missionDescription,
		'colonyList' 	=> $colonyList,
		'FleetsOnPlanet' 	=> $FleetsOnPlanet,
		'PopulationOnPlanet' 	=> $PopulationOnPlanet,
		));
		
		$this->display('page.center.mission.tpl');
		
	}

	
	function show()
	{
		global $LNG, $ProdGrid, $resource, $reslist, $CONF, $pricelist, $USER, $PLANET;
		
			
		
		$this->tplObj->assign_vars(array(	
		));
		
		$this->display('page.center.default.tpl');
	}
	
	private function GetColonyList()
	{
		global $PLANET, $USER;
		
		$ColonyList	= array();
		
		foreach($USER['PLANETS'] as $CurPlanetID => $CurPlanet)
		{
			if ($PLANET['id'] == $CurPlanet['id'])
				continue;
			
			$ColonyList[] = array(
				'name'		=> $CurPlanet['name'],
				'galaxy'	=> $CurPlanet['galaxy'],
				'system'	=> $CurPlanet['system'],
				'planet'	=> $CurPlanet['planet'],
				'type'		=> $CurPlanet['planet_type'],
			);	
		}
			
		return $ColonyList;
	}
}
