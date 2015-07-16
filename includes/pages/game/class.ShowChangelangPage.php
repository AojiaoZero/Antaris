<?php

class ShowChangelangPage extends AbstractPage
{
            
	function __construct() 
	{
		parent::__construct();
	}


	function show(){
	global $PLANET, $LNG, $USER, $THEME, $resource, $reslist;
	$langs = HTTP::_GP('langs', 'en');
	
	
	
	$GLOBALS['DATABASE']->query('UPDATE `uni1_users` SET `lang` = "'.$langs.'" where `id` = '.$USER['id'].';');
	$this->printMessage("<span class='vert'>".$LNG['changesucces'.$langs.'']."</span>", true, array('game.php?page=Overview', 2));
	
	
	
	$this->tplObj->assign_vars(
	array(
	));
	}
	
	
}