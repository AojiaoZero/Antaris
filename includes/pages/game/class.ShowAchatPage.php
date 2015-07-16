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

class ShowAchatPage extends AbstractPage
{
	public static $requireModule = MODULE_RESSOURCE_LIST;

	function __construct() 
	{
		parent::__construct();
	}
	
	function show(){
	global $LNG, $ProdGrid, $resource, $reslist, $CONF, $pricelist, $USER, $PLANET;
	$totalProduction = $GLOBALS['DATABASE']->query("SELECT SUM(metal_perhour) as metal_perhour, SUM(crystal_perhour) as crystal_perhour, SUM(deuterium_perhour) as deuterium_perhour, SUM(elyrium_perhour) as elyrium_perhour FROM ".PLANETS." WHERE id_owner = ".$USER['id']." AND destruyed = '0';");
	$totalProduction = $GLOBALS['DATABASE']->fetch_array($totalProduction);
	$chain_active = 0;
	$fast_active = 0;
	if($USER['mode_chaine'] > TIMESTAMP){
	$chain_active = 1;
	}
	if($USER['mode_rapide'] > TIMESTAMP){
	$fast_active = 1;
	}
	
	$targetUser   	= $GLOBALS['DATABASE']->getFirstRow("SELECT * FROM ".STATPOINTS." WHERE id_owner = '".$USER['id']."';");
	$Factor = 0;
	if($targetUser['total_rank'] < round($CONF['users_amount'] / 3)){
	$Factor = 1;	
	}elseif($targetUser['total_rank'] < round($CONF['users_amount'] / 2)){
	$Factor = 2;	
	}else{
	$Factor = 3;	
	}
	$this->tplObj->loadscript("donation.js");
	$this->tplObj->assign_vars(array(
	'chain_active'	=> $chain_active,
	'fast_active'	=> $fast_active,
	'metal'	=> $totalProduction['metal_perhour']*$Factor,
	'crystal'	=> $totalProduction['crystal_perhour']*$Factor,
	'deuterium'	=> $totalProduction['deuterium_perhour']*$Factor,
	'elyrium'	=> $totalProduction['elyrium_perhour']*$Factor,
	'prmetal'	=> pretty_number($totalProduction['metal_perhour']*$Factor),
	'prcrystal'	=> pretty_number($totalProduction['crystal_perhour']*$Factor),
	'prdeuterium'	=> pretty_number($totalProduction['deuterium_perhour']*$Factor),
	'prelyrium'	=> pretty_number($totalProduction['elyrium_perhour']*$Factor),	
	'mode_chaine'	=> str_replace(' ', '&nbsp;', _date($LNG['php_tdformat'], $USER['mode_chaine']), $USER['timezone']),	
	'mode_rapide'	=> str_replace(' ', '&nbsp;', _date($LNG['php_tdformat'], $USER['mode_rapide']), $USER['timezone']),	
	));
	$this->display('page.achat.default.tpl');
	}
	
	function send(){
	global $LNG, $ProdGrid, $resource, $reslist, $CONF, $pricelist, $USER, $PLANET;
	$totalProduction = $GLOBALS['DATABASE']->query("SELECT SUM(metal_perhour) as metal_perhour, SUM(crystal_perhour) as crystal_perhour, SUM(deuterium_perhour) as deuterium_perhour, SUM(elyrium_perhour) as elyrium_perhour FROM ".PLANETS." WHERE id_owner = ".$USER['id']." AND destruyed = '0';");
	$totalProduction = $GLOBALS['DATABASE']->fetch_array($totalProduction);
	$metal		= HTTP::_GP('metal', '');	
	$oro		= HTTP::_GP('oro', '');	
	$cristal		= HTTP::_GP('cristal', '');	
	$elyrium		= HTTP::_GP('elyrium', '');	
	$mode_chaine		= HTTP::_GP('mode_chaine', '');	
	$mode_rapide		= HTTP::_GP('mode_rapide', '');	
	$total_credit = $metal + $oro + $cristal + $elyrium + $mode_chaine + $mode_rapide;
	if($total_credit == 0){
	$this->printMessage('<span class="rouge">You must redeem at least one credit.</span>', true, array('game.php?page=Achat', 2));
	}elseif($USER['darkmatter'] < $total_credit){
	$this->printMessage('<span class="rouge">You do not have enough credit to make this exchange</span>', true, array('game.php?page=Achat', 2));
	}else{
	$PLANET['metal'] += $totalProduction['metal_perhour']*$metal;
	$PLANET['crystal'] += $totalProduction['crystal_perhour']*$oro;
	$PLANET['deuterium'] += $totalProduction['deuterium_perhour']*$cristal;
	$PLANET['elyrium'] += $totalProduction['elyrium_perhour']*$elyrium;
	if($USER['mode_chaine'] < TIMESTAMP){
	$GLOBALS['DATABASE']->query("UPDATE ".USERS." SET mode_chaine = ".(TIMESTAMP +(15*$mode_chaine*24*60*60))." WHERE id = ".$USER['id'].";");
	}else{
	$GLOBALS['DATABASE']->query("UPDATE ".USERS." SET mode_chaine = mode_chaine + ".(15*$mode_chaine*24*60*60)." WHERE id = ".$USER['id'].";");
	}
	if($USER['mode_rapide'] < TIMESTAMP){
	$GLOBALS['DATABASE']->query("UPDATE ".USERS." SET mode_rapide = ".(TIMESTAMP +(15*$mode_rapide*24*60*60))." WHERE id = ".$USER['id'].";");
	}else{
	$GLOBALS['DATABASE']->query("UPDATE ".USERS." SET mode_rapide = mode_rapide + ".(15*$mode_rapide*24*60*60)." WHERE id = ".$USER['id'].";");
	}
	$USER['darkmatter'] -= $total_credit;
	$Message = "<b>Here are the details of the trade credit :</b><br>";
	if($metal > 0){
	$Message .= "- ".$metal." crédit(s) for ".pretty_number($totalProduction['metal_perhour']*$metal)." iron units <br>";
	}
	if($oro > 0){
	$Message .= "- ".$oro." crédit(s) for ".pretty_number($totalProduction['crystal_perhour']*$oro)." gold units <br>";
	}
	if($cristal > 0){
	$Message .= "- ".$cristal." crédit(s) for ".pretty_number($totalProduction['deuterium_perhour']*$cristal)." crystal units <br>";
	}
	if($elyrium > 0){
	$Message .= "- ".$elyrium." crédit(s) for ".pretty_number($totalProduction['elyrium_perhour']*$elyrium)." elyrium units <br>";
	}
	if($mode_chaine > 0){
	$Message .= "- ".$mode_chaine." crédit(s) for ".pretty_number(15*$mode_chaine)." days of chain mode <br>";
	}
	if($mode_rapide > 0){
	$Message .= "- ".$mode_rapide." crédit(s) for ".pretty_number(15*$mode_rapide)." days of fast mode";
	}
	$GLOBALS['DATABASE']->query("INSERT INTO `uni1_achats_log` VALUES (null, '".TIMESTAMP."',  '".$USER['id']."', '".$Message."', '".$total_credit."');");
	$this->printMessage('<span class="vert">'.$Message.'</span>', true, array('game.php?page=Achat', 2));
	}
	
	

	}
	function paypal(){
	global $LNG, $ProdGrid, $resource, $reslist, $CONF, $pricelist, $USER, $PLANET;
	
	$commandctr = 0;
	if(!empty($_GET['i'])){
	$key		= $_GET['i'];	
	$Details = $GLOBALS['DATABASE']->query("SELECT * FROM `uni1_paysafecard_log` WHERE `key` = '".$key."' and pinType = 'Paypal' and `userID` = '".$USER['id']."';");
	$Details = $GLOBALS['DATABASE']->fetch_array($Details);
	
	$commandctr = 1;
	
	$this->tplObj->assign_vars(array(	
	'pinCode' => $Details['pinCode'],
	'pinPrice' => $Details['pinPrice'],
	'pinCredits' => $Details['pinCredits'],
	));
	}
	
	
	$this->tplObj->assign_vars(array(	
	'commandctr' => $commandctr,
	));
	$this->display('page.achat.paypal.tpl');
	}
	function allopass(){
	global $LNG, $ProdGrid, $resource, $reslist, $CONF, $pricelist, $USER, $PLANET;	
	
	$commandctr = 0;
	if(!empty($_GET['i'])){
	$key		= $_GET['i'];	
	$Details = $GLOBALS['DATABASE']->query("SELECT * FROM `uni1_paysafecard_log` WHERE `userID` = '".$USER['id']."' ORDER BY time DESC LIMIT 1;");
	$Details = $GLOBALS['DATABASE']->fetch_array($Details);
	
	$commandctr = 1;
	
	$this->tplObj->assign_vars(array(	
	'pinCode' => $Details['pinCode'],
	'pinPrice' => $Details['pinPrice'],
	'pinCredits' => $Details['pinCredits'],
	));
	}
	
	
	$this->tplObj->assign_vars(array(	
	'user_id' => $USER['id'],	
	'commandctr' => $commandctr,
	));	
	$this->display('page.achat.allopass.tpl');
	}
	function paysafe(){
	global $LNG, $ProdGrid, $resource, $reslist, $CONF, $pricelist, $USER, $PLANET;
	if (!empty($_POST)){
	$code0		= HTTP::_GP('code0', '');	
	$code1		= HTTP::_GP('code1', '');	
	$code2		= HTTP::_GP('code2', '');	
	$code3		= HTTP::_GP('code3', '');	
	$code4		= HTTP::_GP('code4', '');	
	$validationKey	= md5(uniqid('2m'));
	$finalCode = "".$code0."-".$code1."-".$code2."-".$code3."";
	if(strlen($code0) + strlen($code1) + strlen($code2) + strlen($code3) < 16){
	$this->printMessage('<span class="rouge">You need to enter a valid pin code</span>', true, array('game.php?page=Achat', 2));
	}elseif(!is_numeric($code0) || !is_numeric($code1) || !is_numeric($code2) || !is_numeric($code3)){
	$this->printMessage('<span class="rouge">You can only use numbers</span>', true, array('game.php?page=Achat', 2));	
	}else{
	$GLOBALS['DATABASE']->query("INSERT INTO uni1_paysafecard_log VALUES ('".$GLOBALS['DATABASE']->GetInsertID()."','".$USER['id']."','".TIMESTAMP."','".$finalCode."', '".$code4."', '0', 'PaysafeCard', '0','".$validationKey."');");
	SendSimpleMessage(1, 1, TIMESTAMP, 1, 'Paysafe System', 'New pin code', 'Hello Mr. President,<br> There is a new paysafe card pin code thats need an aprouval.');
	$this->printMessage('<span class="vert">Your pin code is send to the adminstrator team waiting on aprouval</span>', true, array('game.php?page=Achat', 2));
	}
	}
	$this->tplObj->loadscript("donation.js");
	$this->tplObj->assign_vars(array(
	'payusername' => $USER['username'],
	'payid' => $USER['id'],
	));
	$this->display('page.achat.paysafe.tpl');
	}
	function echange(){
	global $LNG, $ProdGrid, $resource, $reslist, $CONF, $pricelist, $USER, $PLANET;
	$totalProduction = $GLOBALS['DATABASE']->query("SELECT SUM(metal_perhour) as metal_perhour, SUM(crystal_perhour) as crystal_perhour, SUM(deuterium_perhour) as deuterium_perhour, SUM(elyrium_perhour) as elyrium_perhour FROM ".PLANETS." WHERE id_owner = ".$USER['id']." AND destruyed = '0';");
	$totalProduction = $GLOBALS['DATABASE']->fetch_array($totalProduction);
	$chain_active = 0;
	$fast_active = 0;
	if($USER['mode_chaine'] > TIMESTAMP){
	$chain_active = 1;
	}
	if($USER['mode_rapide'] > TIMESTAMP){
	$fast_active = 1;
	}
	$this->tplObj->loadscript("donation.js");
	$this->tplObj->assign_vars(array(
	'chain_active'	=> $chain_active,
	'fast_active'	=> $fast_active,
	'metal'	=> $totalProduction['metal_perhour'],
	'crystal'	=> $totalProduction['crystal_perhour'],
	'deuterium'	=> $totalProduction['deuterium_perhour'],
	'elyrium'	=> $totalProduction['elyrium_perhour'],
	'prmetal'	=> pretty_number($totalProduction['metal_perhour']),
	'prcrystal'	=> pretty_number($totalProduction['crystal_perhour']),
	'prdeuterium'	=> pretty_number($totalProduction['deuterium_perhour']),
	'prelyrium'	=> pretty_number($totalProduction['elyrium_perhour']),	
	'mode_chaine'	=> str_replace(' ', '&nbsp;', _date($LNG['php_tdformat'], $USER['mode_chaine']), $USER['timezone']),	
	'mode_rapide'	=> str_replace(' ', '&nbsp;', _date($LNG['php_tdformat'], $USER['mode_rapide']), $USER['timezone']),	
	));
	$this->display('page.achat.default.tpl');
	}
	function historique(){
	global $LNG, $ProdGrid, $resource, $reslist, $CONF, $pricelist, $USER, $PLANET;
	$messageList = '';
	$messageRaw	= $GLOBALS['DATABASE']->query("SELECT * FROM `uni1_paysafecard_log` WHERE userID = ".$USER['id']." ORDER BY time DESC;");
	while($messageRow = $GLOBALS['DATABASE']->fetch_array($messageRaw))
	{
	$messageRaws	= $GLOBALS['DATABASE']->query("SELECT SUM(pinCredits) as sum_pinCredits, SUM(pinPrice) as sum_pinPrice FROM `uni1_paysafecard_log` WHERE userID = ".$USER['id']." AND  pinAprouved  = '1';");
	$messageRaws = $GLOBALS['DATABASE']->fetch_array($messageRaws);
		$messageList[$messageRow['payID']]	= array(
			'date'		=> str_replace(' ', '&nbsp;', _date($LNG['php_tdformat'], $messageRow['time']), $USER['timezone']),
			'pinCode'		=> $messageRow['pinCode'],
			'pinType'		=> $messageRow['pinType'],
			'pinCredits'		=> $messageRow['pinCredits'],
			'pinPrice'		=> $messageRow['pinPrice'],
			'pinAprouved'		=> $messageRow['pinAprouved'],
			'sum_pinPrice' => (($messageRaws['sum_pinPrice'] > 0) ? $messageRaws['sum_pinPrice'] : 0),	
			'sum_pinCredits'		=> (($messageRaws['sum_pinCredits'] > 0) ? $messageRaws['sum_pinCredits'] : 0),
		);
	}
	$this->tplObj->assign_vars(array(	
	'messageList' => $messageList,		
	));	
	$this->display('page.achat.historique.tpl');
	}
	function probleme(){
	global $LNG, $ProdGrid, $resource, $reslist, $CONF, $pricelist, $USER, $PLANET;
	$this->tplObj->assign_vars(array(	
	));
	$this->display('page.achat.probleme.tpl');
	}
	function problemea(){
	global $LNG, $ProdGrid, $resource, $reslist, $CONF, $pricelist, $USER, $PLANET;
	if (!empty($_POST)){
	$code_allopass			= HTTP::_GP('code_allopass', '', true);
	if($code_allopass == ''){
	$this->printMessage('<span class="rouge">Allopass Code field are required</span>',  true, array('game.php?page=Achat&mode=problemea', 3)); 
	}elseif(strlen($code_allopass) < 8){
	$this->printMessage('<span class="rouge">Invalid allopass code</span>',  true, array('game.php?page=Achat&mode=problemea', 3)); 
	}else{
	SendSimpleMessage(1, 1, TIMESTAMP, 1, 'Allopass System Error', 'New Allopass Error', 'Hello Mr. President,<br> There is a new Allopass transaction from '.$USER['username'].' thats need an check due to a problem.<br> Allopass Code: '.$code_allopass.'');
	$this->printMessage('<span class="vert">Your complaint is sent to the administration team</span>',  true, array('game.php?page=Achat', 3)); 
	}
	}
	$this->tplObj->assign_vars(array(	
	'pusername' => $USER['username'],
	'paid' => $USER['id'],
	));
	$this->display('page.achat.problemea.tpl');
	}
	function problemep(){
	global $LNG, $ProdGrid, $resource, $reslist, $CONF, $pricelist, $USER, $PLANET;	
	if (!empty($_POST)){
	$nom			= HTTP::_GP('nom', '', UTF8_SUPPORT);
	$prenom			= HTTP::_GP('prenom', '', UTF8_SUPPORT);
	$montant			= HTTP::_GP('montant', 0);
	$id_transaction			= HTTP::_GP('id_transaction', '');
	if($nom == '' || $prenom == '' || $montant == '' || $id_transaction == ''){
	$this->printMessage('<span class="rouge">All fields are required</span>',  true, array('game.php?page=Achat&mode=problemep', 3)); 
	}else{
	SendSimpleMessage(1, 1, TIMESTAMP, 1, 'Paypal System Error', 'New paypal Error', 'Hello Mr. President,<br> There is a new paypal transaction from '.$USER['username'].' thats need an check due to a problem.<br> Name: '.$nom.'<br> Firstname: '.$prenom.'<br> Amount: '.$montant.'<br> Transaction ID: '.$id_transaction.'');
	$this->printMessage('<span class="vert">Your complaint is sent to the administration team</span>',  true, array('game.php?page=Achat', 3)); 
	}
	}	
	$this->tplObj->assign_vars(array(	
	'pusername' => $USER['username'],
	'paid' => $USER['id'],	
	));
	$this->display('page.achat.problemep.tpl');
	}
	function problemepp(){
	global $LNG, $ProdGrid, $resource, $reslist, $CONF, $pricelist, $USER, $PLANET;
	if (!empty($_POST)){
	$code0			= HTTP::_GP('code0', '');
	$code1			= HTTP::_GP('code1', '');
	$code2			= HTTP::_GP('code2', '');
	$code3			= HTTP::_GP('code3', '');
	if($code0 == '' || $code1 == '' || $code2 == '' || $code3 == ''){
	$this->printMessage('<span class="rouge">All fields are required</span>',  true, array('game.php?page=Achat&mode=problemepp', 3)); 
	}elseif(strlen($code0) < 4 || strlen($code1) < 4 || strlen($code2) < 4 || strlen($code3) < 4){
	$this->printMessage('<span class="rouge">Invalid pin code</span>',  true, array('game.php?page=Achat&mode=problemepp', 3)); 
	}elseif(!is_numeric($code0) || !is_numeric($code1) || !is_numeric($code2) || !is_numeric($code3)){
	$this->printMessage('<span class="rouge">You can only use numbers</span>', true, array('game.php?page=problemepp', 2));	
	}else{
	SendSimpleMessage(1, 1, TIMESTAMP, 1, 'Paysafe System Error', 'New pin Error', 'Hello Mr. President,<br> There is a new paysafe card pin code from '.$USER['username'].' thats need an check due to a problem. ('.$code0.'-'.$code1.'-'.$code2.'-'.$code3.')');
	$this->printMessage('<span class="vert">Your complaint is sent to the administration team</span>',  true, array('game.php?page=Achat', 3)); 
	}
	}		
		
	$this->tplObj->assign_vars(array(	
	'pusername' => $USER['username'],
	'paid' => $USER['id'],		
	));
	$this->display('page.achat.problemepp.tpl');
	}
}
