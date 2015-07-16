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

class ShowBankPage extends AbstractPage
{
	public static $requireModule = MODULE_RESSOURCE_LIST;

	function __construct() 
	{
		parent::__construct();
	}
	
	function preview()
	{
		global $LNG, $CONF, $resource, $reslist, $CONF, $pricelist, $USER, $PLANET;
		$this->initTemplate();
		$this->setWindow('ajax');
		$quantite_vendu = HTTP::_GP('quantite_vendu', 0);
		$type_vendu = HTTP::_GP('type_vendu', '');
		$id_vendu = HTTP::_GP('id_vendu', '');
		$type_acheter = HTTP::_GP('type_acheter', '');
		$id_acheter = HTTP::_GP('id_acheter', '');
		$Bankaccept = 0;
		
		$taxSell = 0;
		$taxBuy = 0;
		if($id_vendu == 'metal'){
		$taxSell = $CONF['taxe_metal'];
		}elseif($id_vendu == 'crystal'){
		$taxSell = $CONF['taxe_crystal'];
		}elseif($id_vendu == 'deuterium'){
		$taxSell = $CONF['taxe_deuterium'];
		}elseif($id_vendu == 'elyrium'){
		$taxSell = $CONF['taxe_elyrium'];
		}
		
		if($id_acheter == 'metal'){
		$taxBuy = $CONF['taxe_metal'];
		}elseif($id_acheter == 'crystal'){
		$taxBuy = $CONF['taxe_crystal'];
		}elseif($id_acheter == 'deuterium'){
		$taxBuy = $CONF['taxe_deuterium'];
		}elseif($id_acheter == 'elyrium'){
		$taxBuy = $CONF['taxe_elyrium'];
		}
		$push = 1;
		
		if($id_vendu == 'metal' && $id_acheter == 'crystal'){
		$push = 1.33;	
		}elseif($id_vendu == 'metal' && $id_acheter == 'deuterium'){
		$push = 2;	
		}elseif($id_vendu == 'metal' && $id_acheter == 'elyrium'){
		$push = 4;	
		}elseif($id_vendu == 'metal' && $id_acheter == 'metal'){
		$push = 1;	
		}elseif($id_vendu == 'crystal' && $id_acheter == 'metal'){
		$push = 0.75;	
		}elseif($id_vendu == 'crystal' && $id_acheter == 'crystal'){
		$push = 1;	
		}elseif($id_vendu == 'crystal' && $id_acheter == 'deuterium'){
		$push = 1.5;	
		}elseif($id_vendu == 'crystal' && $id_acheter == 'elyrium'){
		$push = 3;	
		}elseif($id_vendu == 'deuterium' && $id_acheter == 'metal'){
		$push = 0.5;	
		}elseif($id_vendu == 'deuterium' && $id_acheter == 'crystal'){
		$push = 0.66;	
		}elseif($id_vendu == 'deuterium' && $id_acheter == 'deuterium'){
		$push = 1;	
		}elseif($id_vendu == 'deuterium' && $id_acheter == 'elyrium'){
		$push = 2;	
		}elseif($id_vendu == 'elyrium' && $id_acheter == 'metal'){
		$push = 0.25;	
		}elseif($id_vendu == 'elyrium' && $id_acheter == 'crystal'){
		$push = 0.33;	
		}elseif($id_vendu == 'elyrium' && $id_acheter == 'deuterium'){
		$push = 0.5;	
		}elseif($id_vendu == 'elyrium' && $id_acheter == 'elyrium'){
		$push = 1;	
		}
		
		$impots = 0;
		if($id_acheter == 'metal'){
		
		$impots = 28;
		}elseif($id_acheter == 'crystal'){
		$impots = 30;
		}elseif($id_acheter == 'deuterium'){
		
		$impots = 32;
		}elseif($id_acheter == 'elyrium'){
		$impots = 34;
		}
	
		$taxBuy *= -1;
		$result = 0;
		
		if($taxSell < 0){
		$result = $quantite_vendu - ($quantite_vendu / 100 * abs($taxSell));
		}elseif($taxSell > 0){
		$result = $quantite_vendu + ($quantite_vendu / 100 * abs($taxSell));
		}
		
		
		
		$result = $result / $push;
		$result = $result - ($result / 100 * $impots);
		
		if($taxBuy < 0){
		$result = $result - ($result / 100 * abs($taxBuy));
		}elseif($taxBuy > 0){
		$result = $result + ($result / 100 * abs($taxBuy));
		}
		
		$langbuy='';
		$langsell ='';
		if($id_acheter == 'metal'){
		$langbuy=$LNG['tech'][901];	
		}elseif($id_acheter == 'crystal'){
		$langbuy=$LNG['tech'][902];	
		}elseif($id_acheter == 'deuterium'){
		$langbuy=$LNG['tech'][903];	
		}if($id_acheter == 'elyrium'){
		$langbuy=$LNG['tech'][904];	
		}
		
		if($id_vendu == 'metal'){
		$langsell=$LNG['tech'][901];	
		}elseif($id_vendu == 'crystal'){
		$langsell=$LNG['tech'][902];	
		}elseif($id_vendu == 'deuterium'){
		$langsell=$LNG['tech'][903];	
		}if($id_vendu == 'elyrium'){
		$langsell=$LNG['tech'][904];	
		}
		$Msg = array();
		if($id_acheter == ""){
		$Bankaccept = 1;
		$Msg = 'Reponse: <span class="rouge" style="font-size : 12px;">'.$LNG['ls_bank_48'].'</span>';
		
		}elseif($id_vendu == ""){
		$Bankaccept = 1;
		$Msg = 'Reponse: <span class="rouge" style="font-size : 12px;">'.$LNG['ls_bank_49'].'</span>';
		
		}elseif($id_acheter == $id_vendu){
		$Bankaccept = 1;
		$Msg = 'Reponse: <span class="rouge" style="font-size : 12px;">'.$LNG['ls_bank_50'].'</span>';
		
		}elseif($result < 1){
		$Bankaccept = 1;
		$Msg = 'Reponse: '.sprintf($LNG['ls_bank_53'],$quantite_vendu,$langsell,$langbuy,$langbuy).'';
		}elseif($CONF['bank_'.$id_acheter] < $result){
		$Bankaccept = 1;	
		$Msg = 'Reponse: '.sprintf($LNG['ls_bank_53'],$quantite_vendu).'';
		}elseif($taxSell < -15){
		$Bankaccept = 1;	
		$Msg = 'Reponse: <span class="rouge" style="font-size : 12px;">'.$LNG['ls_bank_51'].'</span>';	
		}elseif($taxBuy > 15){
		$Bankaccept = 1;	
		$Msg = 'Reponse: <span class="rouge" style="font-size : 12px;">'.$LNG['ls_bank_52'].'</span>';	
		}
	    
		$this->tplObj->loadscript('bank.js');
		$this->tplObj->assign_vars(array(	
		'quantite_vendu' => pretty_number($quantite_vendu),
		'id_acheter' => $id_acheter,
		'Bankaccept' => $Bankaccept,
		'Msg' => $Msg,
		'langbuy' => $langbuy,
		'langsell' => $langsell,
		'id_vendu' => $id_vendu,
		'taxSell' => $taxSell,
		'impots' => $impots,
		'taxBuy' => $taxBuy,
		'result' => pretty_number($result),
		));
		
		$this->display('page.bank.preview.tpl');
		
	}
	
	
	function show()
	{
		global $LNG, $ProdGrid, $resource, $reslist, $CONF, $pricelist, $USER, $PLANET;
		
		if(!empty($USER['urlaubs_modus'])){
		$this->printMessage($LNG['vmodeblock'], true, array('game.php?page=Overview', 2));
		die();
	}
		
		$this->tplObj->assign_vars(array(	
		
		));
		
		$this->display('page.bank.default.tpl');
	}
	
	
	function evolution()
	{
		global $LNG, $ProdGrid, $resource, $reslist, $CONF, $pricelist, $USER, $PLANET;
		
		
		
		$this->tplObj->assign_vars(array(	
		'bank_metal' => pretty_number($CONF['bank_metal']),
		'bank_crystal' => pretty_number($CONF['bank_crystal']),
		'bank_deuterium' => pretty_number($CONF['bank_deuterium']),
		'bank_elyrium' => pretty_number($CONF['bank_elyrium']),
		'taxe_metal' => $CONF['taxe_metal'],
		'taxe_crystal' => $CONF['taxe_crystal'],
		'taxe_deuterium' => $CONF['taxe_deuterium'],
		'taxe_elyrium' => $CONF['taxe_elyrium'],
		));
		
		$this->display('page.bank.evolution.tpl');
	}
	
	function transaction()
	{
		global $LNG, $ProdGrid, $resource, $reslist, $CONF, $pricelist, $USER, $PLANET;
		
		
		$this->tplObj->loadscript('bank.js');
		$this->tplObj->assign_vars(array(	
		'tportalss' => $PLANET['teleport_portal'],
		'pagecheck' => 0,
		));
		
		$this->display('page.bank.transaction.tpl');
	}
	
	function sendSale()
	{
		global $LNG, $ProdGrid, $resource, $reslist, $CONF, $pricelist, $USER, $PLANET;
		
		$quantite_vendu = HTTP::_GP('quantite_vendu', 0);
		$type_vendu = HTTP::_GP('type_vendu', '');
		$id_vendu = HTTP::_GP('id_vendu', '');
		$type_acheter = HTTP::_GP('type_acheter', '');
		$id_acheter = HTTP::_GP('id_acheter', '');
		
		if($PLANET[$id_vendu] < $quantite_vendu)
			return false;

		$taxSell = 0;
		$taxBuy = 0;
		if($id_vendu == 'metal'){
		$taxSell = $CONF['taxe_metal'];
		}elseif($id_vendu == 'crystal'){
		$taxSell = $CONF['taxe_crystal'];
		}elseif($id_vendu == 'deuterium'){
		$taxSell = $CONF['taxe_deuterium'];
		}elseif($id_vendu == 'elyrium'){
		$taxSell = $CONF['taxe_elyrium'];
		}
		
		if($id_acheter == 'metal'){
		$taxBuy = $CONF['taxe_metal'];
		}elseif($id_acheter == 'crystal'){
		$taxBuy = $CONF['taxe_crystal'];
		}elseif($id_acheter == 'deuterium'){
		$taxBuy = $CONF['taxe_deuterium'];
		}elseif($id_acheter == 'elyrium'){
		$taxBuy = $CONF['taxe_elyrium'];
		}
		$push = 0;
		
		if($id_vendu == 'metal' && $id_acheter == 'crystal'){
		$push = 1.33;	
		}elseif($id_vendu == 'metal' && $id_acheter == 'deuterium'){
		$push = 2;	
		}elseif($id_vendu == 'metal' && $id_acheter == 'elyrium'){
		$push = 4;	
		}elseif($id_vendu == 'metal' && $id_acheter == 'metal'){
		$push = 1;	
		}elseif($id_vendu == 'crystal' && $id_acheter == 'metal'){
		$push = 0.75;	
		}elseif($id_vendu == 'crystal' && $id_acheter == 'crystal'){
		$push = 1;	
		}elseif($id_vendu == 'crystal' && $id_acheter == 'deuterium'){
		$push = 1.5;	
		}elseif($id_vendu == 'crystal' && $id_acheter == 'elyrium'){
		$push = 3;	
		}elseif($id_vendu == 'deuterium' && $id_acheter == 'metal'){
		$push = 0.5;	
		}elseif($id_vendu == 'deuterium' && $id_acheter == 'crystal'){
		$push = 0.66;	
		}elseif($id_vendu == 'deuterium' && $id_acheter == 'deuterium'){
		$push = 1;	
		}elseif($id_vendu == 'deuterium' && $id_acheter == 'elyrium'){
		$push = 2;	
		}elseif($id_vendu == 'elyrium' && $id_acheter == 'metal'){
		$push = 0.25;	
		}elseif($id_vendu == 'elyrium' && $id_acheter == 'crystal'){
		$push = 0.33;	
		}elseif($id_vendu == 'elyrium' && $id_acheter == 'deuterium'){
		$push = 0.5;	
		}elseif($id_vendu == 'elyrium' && $id_acheter == 'elyrium'){
		$push = 1;	
		}
		
		$impots = 0;
		if($id_acheter == 'metal'){
		
		$impots = 28;
		}elseif($id_acheter == 'crystal'){
		$impots = 30;
		}elseif($id_acheter == 'deuterium'){
		
		$impots = 32;
		}elseif($id_acheter == 'elyrium'){
		$impots = 34;
		}
	
		$taxBuy *= -1;
		$result = 0;
		
		if($taxSell < 0){
		$result = $quantite_vendu - ($quantite_vendu / 100 * abs($taxSell));
		}elseif($taxSell > 0){
		$result = $quantite_vendu + ($quantite_vendu / 100 * abs($taxSell));
		}
		
		
		
		$result = $result / $push;
		$result = $result - ($result / 100 * $impots);
		
		if($taxBuy < 0){
		$result = $result - ($result / 100 * abs($taxBuy));
		}elseif($taxBuy > 0){
		$result = $result + ($result / 100 * abs($taxBuy));
		}
		
		
		$langbuy='';
		$langsell ='';
		if($id_acheter == 'metal'){
		$langbuy=$LNG['tech'][901];	
		$GLOBALS['DATABASE']->query("UPDATE ".CONFIG." SET bank_metal = bank_metal - '".$result."';");
		$GLOBALS['DATABASE']->query("UPDATE ".CONFIG." SET new_taxe_metal = new_taxe_metal + '0.01';");
		}elseif($id_acheter == 'crystal'){
		$langbuy=$LNG['tech'][902];	
		$GLOBALS['DATABASE']->query("UPDATE ".CONFIG." SET bank_crystal = bank_crystal - '".$result."';");
		$GLOBALS['DATABASE']->query("UPDATE ".CONFIG." SET new_taxe_crystal = new_taxe_crystal + '0.01';");
		}elseif($id_acheter == 'deuterium'){
		$langbuy=$LNG['tech'][903];	
		$GLOBALS['DATABASE']->query("UPDATE ".CONFIG." SET bank_deuterium = bank_deuterium - '".$result."';");
		$GLOBALS['DATABASE']->query("UPDATE ".CONFIG." SET new_taxe_deuterium = new_taxe_deuterium + '0.01';");
		}if($id_acheter == 'elyrium'){
		$langbuy=$LNG['tech'][904];	
		$GLOBALS['DATABASE']->query("UPDATE ".CONFIG." SET bank_elyrium = bank_elyrium - '".$result."';");
		$GLOBALS['DATABASE']->query("UPDATE ".CONFIG." SET new_taxe_elyrium = new_taxe_elyrium + '0.01';");
		}
		
		if($id_vendu == 'metal'){
		$langsell=$LNG['tech'][901];	
		$GLOBALS['DATABASE']->query("UPDATE ".CONFIG." SET bank_metal = bank_metal + '".$quantite_vendu."';");
		$GLOBALS['DATABASE']->query("UPDATE ".CONFIG." SET new_taxe_metal = new_taxe_metal - '0.01';");
		}elseif($id_vendu == 'crystal'){
		$langsell=$LNG['tech'][902];	
		$GLOBALS['DATABASE']->query("UPDATE ".CONFIG." SET bank_crystal = bank_crystal + '".$quantite_vendu."';");
		$GLOBALS['DATABASE']->query("UPDATE ".CONFIG." SET new_taxe_crystal = new_taxe_crystal - '0.01';");
		}elseif($id_vendu == 'deuterium'){
		$langsell=$LNG['tech'][903];	
		$GLOBALS['DATABASE']->query("UPDATE ".CONFIG." SET bank_deuterium = bank_deuterium + '".$quantite_vendu."';");
		$GLOBALS['DATABASE']->query("UPDATE ".CONFIG." SET new_taxe_deuterium = new_taxe_deuterium - '0.01';");
		}if($id_vendu == 'elyrium'){
		$langsell=$LNG['tech'][904];	
		$GLOBALS['DATABASE']->query("UPDATE ".CONFIG." SET bank_elyrium = bank_elyrium + '".$quantite_vendu."';");
		$GLOBALS['DATABASE']->query("UPDATE ".CONFIG." SET new_taxe_elyrium = new_taxe_elyrium - '0.01';");
		}
		
		$PLANET[$id_vendu] -= $quantite_vendu;
		$PLANET[$id_acheter] += $result;
		

		
		
		
		$this->tplObj->assign_vars(array(	
		'quantite_vendu' => pretty_number($quantite_vendu),
		'langbuy' => $langbuy,
		'langsell' => $langsell,
		'id_acheter' => $id_acheter,
		'id_vendu' => $id_vendu,
		'taxSell' => $taxSell,
		'impots' => $impots,
		'taxBuy' => $taxBuy,
		'result' => pretty_number($result),
		'tportalss' => $PLANET['teleport_portal'],
		'pagecheck' => 1,
		));
		
		
		$this->display('page.bank.transaction.tpl');
	}
	
}
