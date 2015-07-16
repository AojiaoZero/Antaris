<?php

/**
 *  2Moons
 *  Copyright (C) 2012 Jan
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
 * @author Jan <info@2moons.cc>
 * @copyright 2006 Perberos <ugamela@perberos.com.ar> (UGamela)
 * @copyright 2008 Chlorel (XNova)
 * @copyright 2012 Jan <info@2moons.cc> (2Moons)
 * @license http://www.gnu.org/licenses/gpl.html GNU GPLv3 License
 * @version 2.0.$Revision: 2242 $ (2012-11-31)
 * @info $Id: ShowLoginPage.class.php 2532 2013-01-04 16:57:58Z slaver7 $
 * @link http://2moons.cc/
 */


class ShowLoginPage extends AbstractPage
{
	public static $requireModule = 0;

	function __construct() 
	{
		parent::__construct();
	}

public 	function GetOS(){
  $tab = array('Windows', 'Macintosh', 'Linux', 'FreeBSD', 'SunOS', 'IRIX', 'BeOS', 'OS/2', 'AIX');
  foreach($tab as $os){
    if(stripos($_SERVER['HTTP_USER_AGENT'], $os))
      return $os;
  }
  return 'Autre';
}

public function getBrowser()
{
    $u_agent = $_SERVER['HTTP_USER_AGENT'];
    $bname = 'Unknown';
    $platform = 'Unknown';
	$ub = "Unknown";
    $version= "";

    //First get the platform?
    if (preg_match('/linux/i', $u_agent)) {
        $platform = 'linux';
    }
    elseif (preg_match('/macintosh|mac os x/i', $u_agent)) {
        $platform = 'mac';
    }
    elseif (preg_match('/windows|win32/i', $u_agent)) {
        $platform = 'windows';
    }
   
    // Next get the name of the useragent yes seperately and for good reason
    if(preg_match('/MSIE/i',$u_agent) && !preg_match('/Opera/i',$u_agent))
    {
        $bname = 'Internet Explorer';
        $ub = "MSIE";
    }
    elseif(preg_match('/Firefox/i',$u_agent))
    {
        $bname = 'Mozilla Firefox';
        $ub = "Firefox";
    }
    elseif(preg_match('/Chrome/i',$u_agent))
    {
        $bname = 'Google Chrome';
        $ub = "Chrome";
    }
    elseif(preg_match('/Safari/i',$u_agent))
    {
        $bname = 'Apple Safari';
        $ub = "Safari";
    }
    elseif(preg_match('/Opera/i',$u_agent))
    {
        $bname = 'Opera';
        $ub = "Opera";
    }
    elseif(preg_match('/Netscape/i',$u_agent))
    {
        $bname = 'Netscape';
        $ub = "Netscape";
    }
   
    // finally get the correct version number
    $known = array('Version', $ub, 'other');
    $pattern = '#(?<browser>' . join('|', $known) .
    ')[/ ]+(?<version>[0-9.|a-zA-Z.]*)#';
    if (!preg_match_all($pattern, $u_agent, $matches)) {
        // we have no matching number just continue
    }
   
    // see how many we have
    $i = count($matches['browser']);
    if ($i != 1) {
        //we will have two since we are not using 'other' argument yet
        //see if version is before or after the name
        if (strripos($u_agent,"Version") < strripos($u_agent,$ub)){
            $version= $matches['version'][0];
        }
        else {
            $version= $matches['version'][1];
        }
    }
    else {
        $version= $matches['version'][0];
    }
   
    // check if we have a number
    if ($version==null || $version=="") {$version="?";}
   
    return array(
        'userAgent' => $u_agent,
        'name'      => $bname,
        'version'   => $version,
        'platform'  => $platform,
        'pattern'    => $pattern
    );
} 
	
	function show() 
	{
		if (empty($_POST)) {
			HTTP::redirectTo('index.php');	
		}
		
		$username = HTTP::_GP('username', '', UTF8_SUPPORT);
		$password = HTTP::_GP('password', '', true);
		
		$loginData = $GLOBALS['DATABASE']->getFirstRow("SELECT id, password, intro, username, user_deleted FROM ".USERS." WHERE universe = ".$GLOBALS['UNI']." AND username = '".$GLOBALS['DATABASE']->escape($username)."';");
		if (isset($loginData))
		{
			$hashedPassword = PlayerUtil::cryptPassword($password);
			if($loginData['password'] != $hashedPassword)
			{
				// Fallback pre 1.7
				if($loginData['password'] == md5($password)) {
					$GLOBALS['DATABASE']->query("UPDATE ".USERS." SET password = '".$hashedPassword."' WHERE id = ".$loginData['id'].";");
				} else {
					HTTP::redirectTo('index.php?code=1');	
				}
			}
$ip = "";			
if (!empty($_SERVER["HTTP_CLIENT_IP"])){
 //check for ip from share internet
 $ip = $_SERVER["HTTP_CLIENT_IP"];
}elseif (!empty($_SERVER["HTTP_X_FORWARDED_FOR"])){
 // Check for the Proxy User
 $ip = $_SERVER["HTTP_X_FORWARDED_FOR"];
}else{
 $ip = $_SERVER["REMOTE_ADDR"];
}
$ua= $this->getBrowser();
$os = $this->GetOS();

		//$ipCheck = $GLOBALS['DATABASE']->query("SELECT COUNT(logID) as id FROM uni1_iplog WHERE userID = ".$loginData['id']." AND ipaddress = '".$ip."';");
		//$ipCheck = $GLOBALS['DATABASE']->fetch_array($ipCheck); 
		//if($ipCheck['id'] == 0){
		$GLOBALS['DATABASE']->query("INSERT INTO uni1_iplog VALUES ('".$GLOBALS['DATABASE']->GetInsertID()."','".TIMESTAMP."','".$ip."','".$ua['name']."', '".$os."', ".$loginData['id'].");");
		//}
			
		$ipCheck = $GLOBALS['DATABASE']->query("SELECT DISTINCT userID FROM uni1_iplog WHERE userID != ".$loginData['id']." AND ipaddress = '".$ip."';");
		

		

			
			
			Session::create($loginData['id']);
			
			if($loginData['intro'] == 0){
			HTTP::redirectTo('game.php?page=intro');	
			}else{
			HTTP::redirectTo('game.php');	
			}
			
		}
		else
		{
			Session::redirectCode(1);	
		}
	}
}
