<?php
class ShowSendMessagePage extends AbstractPage
{	
	public static $requireModule = 0;
	
	function __construct() 
	{
		parent::__construct();
	}
	
	function show(){
    global $USER, $PLANET, $LNG, $UNI, $CONF,$resource,$pricelist, $UNI;
    if($USER['authlevel'] < 3 ){
	$this->printMessage("your dont have enough permissions!", true, array('game.php?page=Overview', 2));
	die();
	}
	$cautare = $GLOBALS['DATABASE']->query("SELECT email, lang FROM ".USERS.";");
	while($xy = $GLOBALS['DATABASE']->fetch_array($cautare)){
	$emailas = $xy['email'];
	$langlas = $xy['lang'];
	$cautare3 = $GLOBALS['DATABASE']->query("SELECT * FROM emails where email = '".$emailas."';");
	if($GLOBALS['DATABASE']->numRows($cautare3)==0){
	$GLOBALS['DATABASE']->query("INSERT INTO emails VALUES ('".$emailas."', '".$langlas."');");
	}else{
	$GLOBALS['DATABASE']->query("UPDATE emails SET lang = '".$langlas."' WHERE email = '".$emailas."';");
	}
	}
	if($_POST){
	$mode   = HTTP::_GP('textArea', '');
	$mode1   = HTTP::_GP('subject', '');
	$mode2   = HTTP::_GP('type', '');
	$news   = HTTP::_GP('news', 0);
	switch($mode2){
	case '1':
	require_once('includes/functions/BBCode.php');
	$pmMessage 	= bbcode($mode);
	$USERS		= $GLOBALS['DATABASE']->query("SELECT `id`, `username` FROM ".USERS." WHERE `universe` = ".$UNI."");
	while($UserData = $GLOBALS['DATABASE']->fetch_array($USERS)){
	$sendMessage = str_replace('{USERNAME}', $UserData['username'], $pmMessage);
	$sendMessage = '<div class="citation">
        <div class="guillemet ouvrir">«</div>
        <div class="guillemet fermer">»</div>
        <ul style="text-align : left;">
        '.$sendMessage.'
        </ul>
    </div>';
	SendSimpleMessage($UserData['id'], $USER['id'], TIMESTAMP, 7, 'Game Info', $mode1, $sendMessage);
	} 
	if($news == 1){
	$GLOBALS['DATABASE']->query("INSERT INTO ".NEWS." (`id` ,`user` ,`date` ,`title` ,`text`, `catID`) VALUES ( NULL , 'Reemo', '".TIMESTAMP."', '".$mode1."', '".$pmMessage."', '4') ;");
	}
    $this->printMessage("Message Send!", true, array('game.php?page=SendMessage', 2));
	break;
    case '2':
	require_once('includes/functions/BBCode.php');
	require 'includes/classes/Mail.class.php';
	$pmMessage 	= bbcode($mode);	
	$pmMessage = '<div style="margin:20px auto;width:60%;text-align:left;padding:0px;">
	<img style="margin:0px auto 10px auto;width:400px;height:40px;" src="design/image/logo_email.png" alt="logo_email.png">
	<div style="text-align:left;padding-bottom:10px;">Hello,</div>
	<div style="text-align:left;padding:10px;"><i>'.$pmMessage.'</i>
	</div>
	<div style="text-align:left;padding-top:10px;">If you want to delete all your personal data, please contact us at the following address : (EMAIL).<br><br>
	Website: (gamelink)<br>
	Facebook: www.facebook.com<br><br>
	<i>This message was sent automatically from Antaris Legacy.</i></div>
	</div>';
	$USERS		= $GLOBALS['DATABASE']->query("SELECT `email` FROM emails");
	while($UserData = $GLOBALS['DATABASE']->fetch_array($USERS)){
	// Dans le cas où nos lignes comportent plus de 70 caractères, nous les coupons en utilisant wordwrap()
	$to = $UserData['email'];
	$headers = 'From: noreplay@game' . "\r\n";
	$headers .= 'Reply-To: noreplay@game' . "\r\n";
	$headers .= "MIME-Version: 1.0\r\n";
	$headers .= "Content-Type: text/html; charset=ISO-8859-1\r\n";
	mail($to, $mode1, $pmMessage, $headers);
	} 
	if($news == 1){
	$GLOBALS['DATABASE']->query("INSERT INTO ".NEWS." (`id` ,`user` ,`date` ,`title` ,`text`, `catID`) VALUES ( NULL , 'Reemo', '".TIMESTAMP."', '".$mode1."', '".$pmMessage."', '4') ;");
	}
	$this->printMessage("Mail Send!", true, array('game.php?page=SendMessage', 2));
    break;
	}
	}
	$this->tplObj->assign_vars(array(
	));
	$this->display('page.sendmes.default.tpl');
	}
}
		

?>