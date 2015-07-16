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
 * @info $Id: class.ShowSettingsPage.php 2632 2013-03-18 19:05:14Z slaver7 $
 * @link http://2moons.cc/
 */

class ShowSettingsPage extends AbstractPage
{
	public static $requireModule = 0;

	function __construct() 
	{
		parent::__construct();
	}
	private function CheckVMode()
	{
		global $USER, $PLANET;

		if(!empty($USER['b_tech']) || !empty($PLANET['b_building']) || !empty($PLANET['b_hangar']))
			return false;
		

		$fleets = $GLOBALS['DATABASE']->getFirstCell("SELECT COUNT(*) FROM ".FLEETS." WHERE `fleet_owner` = ".$USER['id'].";");
		if($fleets != 0)
			return false;
						
		$query = $GLOBALS['DATABASE']->query("SELECT * FROM ".PLANETS." WHERE id_owner = ".$USER['id']." AND id != ".$PLANET['id']." AND destruyed = 0;");
		
		while($CPLANET = $GLOBALS['DATABASE']->fetch_array($query))
		{
			list($USER, $CPLANET)	= $this->ecoObj->CalcResource($USER, $CPLANET, true);
		
			if(!empty($CPLANET['b_building']) || !empty($CPLANET['b_hangar']))
				return false;
			
			unset($CPLANET);
		}

		$GLOBALS['DATABASE']->free_result($query);
		
		return true;
	}
	public function show()
	{
		global $USER, $LNG, $CONF;
		
			$this->tplObj->assign_vars(array(				
			'changeNickTime'	=> ($USER['uctime'] + USERNAME_CHANGETIME) - TIMESTAMP,
			'username'			=> $USER['username'],
			'ddate'			=> date('F j, Y, g:i a', $USER['uctime'] + USERNAME_CHANGETIME) ,
			));
			
			$this->display('page.settings.default.tpl');
	}
	public function psuedo()
	{
		global $USER, $LNG, $CONF;
		
			$this->tplObj->assign_vars(array(				
			'changeNickTime'	=> ($USER['uctime'] + USERNAME_CHANGETIME) - TIMESTAMP,
			'username'			=> $USER['username'],
			'ddate'			=> date('F j, Y, g:i a', $USER['uctime'] + USERNAME_CHANGETIME) ,
			));
			
			$this->display('page.settings.psuedo.tpl');
	}
	public function psuedoSend()
	{
		global $USER, $LNG, $CONF, $UNI, $SESSION;
		$newUsername		= HTTP::_GP('pseudo', $USER['username'], UTF8_SUPPORT);
		$SQL				= "";
		$redirectTo			= 'game.php?page=settings';
		if (!empty($newUsername) && $USER['username'] != $newUsername)
		{
			if (!CheckName($newUsername)) {
				$this->printMessage($LNG['op_user_name_no_alphanumeric']);
			} elseif($USER['uctime'] >= TIMESTAMP - USERNAME_CHANGETIME) {
				$this->printMessage($LNG['op_change_name_pro_week']);
			} else {
				$Count 	= $GLOBALS['DATABASE']->getFirstCell("SELECT (SELECT COUNT(*) FROM ".USERS." WHERE `universe` = ".$UNI." AND `username` = '".$GLOBALS['DATABASE']->sql_escape($newUsername)."') + (SELECT COUNT(*) FROM ".USERS_VALID." WHERE `universe` = ".$UNI." AND `username` = '".$GLOBALS['DATABASE']->sql_escape($newUsername)."')");
				
				if (!empty($Count)) {
					$this->printMessage(sprintf($LNG['op_change_name_exist'], $newUsername));
					
				} else {
					$SQL		= "UPDATE ".USERS." SET username = '".$GLOBALS['DATABASE']->sql_escape($newUsername)."', uctime = ".TIMESTAMP." WHERE id = ".$USER['id'].";";
					$GLOBALS['DATABASE']->multi_query($SQL);
					$redirectTo	= 'index.php';
					$SESSION->DestroySession();
				}
			}
		}
		$this->printMessage('<span class="vert">'.$LNG['op_options_changed'].'</span>');
	}
	
	public function personal()
	{
		
		global $USER, $LNG, $CONF;
		
		
			$this->tplObj->assign_vars(array(				
			'email' => $USER['email'],
			'drate' => date('d/m/Y', $USER['date_of_birth']),
			'drates' => $USER['date_of_birth'],
			'sexe' => $USER['sexe'],
			));
			
			$this->display('page.settings.personal.tpl');
	}
	public function personalSend()
	{
		global $USER, $LNG, $CONF;
		$dateOfBirth		= HTTP::_GP('date_de_naissance', 0);
		$dateOfBirth1		= HTTP::_GP('date_de_naissance1', 0);
		$dateOfBirth2		= HTTP::_GP('date_de_naissance2', 0);
		$sexe		= HTTP::_GP('sexe', 1);
		if(!is_numeric($sexe)){
		$this->printMessage('<span class="rouge">Not allowed</span>');	
		}
		
		if($dateOfBirth < 0 || $dateOfBirth1 < 0 || $dateOfBirth2 < 0){
		$this->printMessage('<span class="rouge">Keep it positive</span>');	
		}
		$dateOfBirth = strtotime(''.$dateOfBirth.'-'.$dateOfBirth1.'-'.$dateOfBirth2.'');
	
		if($dateOfBirth == ""){
		$this->printMessage('<span class="rouge">You must enter a correct date of birth</span>');		
		}
		$SQL		= "UPDATE ".USERS." SET date_of_birth = '".$dateOfBirth."', sexe = '".$sexe."' WHERE id = ".$USER['id'].";";
		$GLOBALS['DATABASE']->multi_query($SQL);
		$this->printMessage('<span class="vert">'.$LNG['op_options_changed'].'</span>');
			
			
		
	}
	public function avatar()
	{
		global $USER, $LNG, $CONF;
define('TARGET', 'media/files/'); // Repertoire cible
define('MAX_SIZE', 200000); // Taille max en octets du fichier
define('WIDTH_MAX', 800); // Largeur max de l'image en pixels
define('HEIGHT_MAX', 800); // Hauteur max de l'image en pixels
// Tableaux de donnees
$tabExt = array('jpg','png','jpeg'); // Extensions autorisees


$infosImg = array();
// Variables
$extension = '';
$message = '';
$nomImage = '';

/************************************************************
* Script d'upload
*************************************************************/
if(!empty($_POST))
{
$fichier = basename($_FILES['fichier']['name']);
// On verifie si le champ est rempli
if( !empty($_FILES['fichier']['name']) )
{
// Recuperation de l'extension du fichier
$extension = pathinfo($_FILES['fichier']['name'], PATHINFO_EXTENSION);
// On verifie l'extension du fichier
if(in_array(strtolower($extension),$tabExt))
{
// On recupere les dimensions du fichier
$infosImg = getimagesize($_FILES['fichier']['tmp_name']);
// On verifie le type de l'image
if($infosImg[2] >= 1 && $infosImg[2] <= 14)
{
// On verifie les dimensions et taille de l'image
if(($infosImg[0] <= WIDTH_MAX) && ($infosImg[1] <= HEIGHT_MAX) && (filesize($_FILES['fichier']['tmp_name']) <= MAX_SIZE))
{
// Parcours du tableau d'erreurs
if(isset($_FILES['fichier']['error'])
&& UPLOAD_ERR_OK === $_FILES['fichier']['error'])
{
// On renomme le fichier
$nomImage = md5(uniqid()) .'.'. $extension;
// Si c'est OK, on teste l'upload
if(move_uploaded_file($_FILES['fichier']['tmp_name'], TARGET.$nomImage))
{
$SQL		= "UPDATE ".USERS." SET avatar = '".$nomImage."' WHERE id = ".$USER['id'].";";
$GLOBALS['DATABASE']->multi_query($SQL);
$this->printMessage('<span class="vert">Upload Succesfull !</span>');
}
else
{
// Sinon on affiche une erreur systeme
$this->printMessage('<span class="rouge">There is a problem with the upload!</span>');
}
}
else
{
$this->printMessage('<span class="rouge">An internal errors blocked the upload of the image</span>');
}
}
else
{
// Sinon erreur sur les dimensions et taille de l'image
$this->printMessage('<span class="rouge">Error with the dimensions of the picture !</span>');
}
}
else
{
// Sinon erreur sur le type de l'image
$this->printMessage('<span class="rouge">The file to upload is not a picture !</span>');
}
}
else
{
// Sinon on affiche une erreur pour l'extension
$this->printMessage('<span class="rouge">The file extension is incorrect !</span>');
}
}
else
{
// Sinon on affiche une erreur pour le champ vide
$this->printMessage('<span class="rouge">Fill in the form please!</span>');
}
}

			$this->tplObj->assign_vars(array(				
			'avatar' => $USER['avatar'],
			'usernamea' => $USER['username'],
			));
			
			$this->display('page.settings.avatar.tpl');
	}
	
	
	
	public function signature()
	{
		global $USER, $LNG, $CONF;
		
			$this->tplObj->assign_vars(array(	
				'userid' => $USER['id'],
				'ref_active'		=> Config::get('ref_active'),
			
			));
			
			$this->display('page.settings.signature.tpl');
	}
	public function design()
	{
		global $USER, $LNG, $CONF;
		
			$this->tplObj->assign_vars(array(				
			'custom_color' => $USER['custom_color'],
			'galaxy_space' => $USER['galaxy_space'],
			));
			
			$this->display('page.settings.design.tpl');
	}
	
	public function designSend() {
	global $USER, $LNG, $PLANET;
	$Color			= HTTP::_GP('Color', '');
	$Galaxy			= HTTP::_GP('Galaxy', 0);
	$SQL	= "UPDATE ".USERS." SET `custom_color` = '".$Color."', `galaxy_space` = '".$Galaxy."' WHERE id = '".$USER["id"]."';";
	$GLOBALS['DATABASE']->multi_query($SQL);
	
	$resp = 'OK';
	
	$this->sendJSON(array('message' => $resp));
	}
	public function notification()
	{
		global $USER, $LNG, $CONF;
		
			$this->tplObj->assign_vars(array(				
			
			));
			
			$this->display('page.settings.notification.tpl');
	}
	public function password()
	{
		global $USER, $LNG, $CONF;
		
			$this->tplObj->assign_vars(array(				
			
			));
			
			$this->display('page.settings.password.tpl');
	}
	public function passwordSend()
	{
		global $USER, $LNG, $CONF, $SESSION;
		
		$password			= HTTP::_GP('password', '');
		$newpassword		= HTTP::_GP('newpassword', '');
		$newpassword2		= HTTP::_GP('newpassword2', '');
		$SQL				= "";
		$redirectTo			= 'game.php?page=settings';
		if (!empty($newpassword) && cryptPassword($password) == $USER["password"] && $newpassword == $newpassword2)
		{
			$newpass 	 = cryptPassword($newpassword);
			$SQL		= "UPDATE ".USERS." SET password = '".$newpass."' WHERE id = ".$USER['id'].";";
			$GLOBALS['DATABASE']->multi_query($SQL);
			$redirectTo	= 'index.php';
			$SESSION->DestroySession();
		}
		}
	public function vmode()
	{
		global $USER, $LNG, $CONF;
		
			$this->tplObj->assign_vars(array(				
			'ddate'			=> date('F j, Y, g:i a', TIMESTAMP + Config::get('vmode_min_time')) ,
			'vmoded' => $USER['urlaubs_modus'],
			'vuntil' => $USER['urlaubs_until'],
			'timuing' => TIMESTAMP,
			'ddates'			=> date('F j, Y, g:i a', $USER['urlaubs_until']) ,
			));
			
			$this->display('page.settings.vmode.tpl');
	}
	public function vmodeSend()
	{
		global $USER, $LNG, $CONF;
		
		if(!$this->CheckVMode())
			{
				$this->printMessage('<span class="rouge">'.$LNG['op_cant_activate_vacation_mode'].'</span>');
			}
			else
			{
				$SQL	= "UPDATE ".USERS." SET 
							urlaubs_modus = '1',
							urlaubs_until = ".(TIMESTAMP + Config::get('vmode_min_time'))."
							WHERE id = ".$USER["id"].";							
							UPDATE ".PLANETS." SET
							energy_used = '0',
							energy = '0',
							metal_mine_porcent = '0',
							crystal_mine_porcent = '0',
							elyrium_mine_porcent = '0',
							deuterium_sintetizer_porcent = '0',
							solar_plant_porcent = '0',
							fusion_plant_porcent = '0',
							solar_satelit_porcent = '0',
							metal_perhour = '0',
							crystal_perhour = '0',
							deuterium_perhour = '0',
							elyrium_perhour = '0'
							WHERE id_owner = ".$USER["id"].";";
			}
$GLOBALS['DATABASE']->multi_query($SQL);
$this->printMessage('<span class="vert">'.$LNG['op_options_changed'].'</span>');
			
	}
	public function delete()
	{
		global $USER, $LNG, $CONF;
		
			$this->tplObj->assign_vars(array(				
			
			));
			
			$this->display('page.settings.delete.tpl');
	}
	
	public function vmodeEnd()
	{
		global $USER, $LNG, $CONF, $SESSION;
		
		$SQL		= "UPDATE ".USERS." SET urlaubs_modus = '0', urlaubs_until = ".(TIMESTAMP + 48*3600)." WHERE id = ".$USER['id'].";";
		$GLOBALS['DATABASE']->multi_query($SQL);
		$this->printMessage('<span class="vert">'.$LNG['op_options_changed'].'</span>');

		
			
	}
	
	public function deleteSend()
	{
		$this->setWindow('popup');
		global $USER, $LNG, $CONF, $SESSION;
		$password			= HTTP::_GP('mdp', '');
		if (!empty($password) && cryptPassword($password) == $USER["password"])
		{
		$SQL		= "UPDATE ".USERS." SET user_deleted = '1' WHERE id = ".$USER['id'].";";
		$GLOBALS['DATABASE']->query($SQL);
		$SESSION->DestroySession();
		$this->display('page.logout.default.tpl');
		}
		
			
	}
	
	
	}
	

