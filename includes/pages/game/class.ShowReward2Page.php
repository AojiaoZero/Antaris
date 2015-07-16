<?php

class ShowReward2Page extends AbstractPage{
	 public static $requireModule = 0;

	function __construct() 
	{
		parent::__construct();
	}
	
	function historique(){
	global $USER, $PLANET, $LNG, $UNI, $CONF,$resource,$pricelist;
	
	
		$messageList = '';
	$messageRaw	= $GLOBALS['DATABASE']->query("SELECT * 
		FROM uni1_reward_log WHERE rewardUserId = ".$USER['id']." AND rewardTime > ".(TIMESTAMP - 15 * 24 * 60 * 60)." 
		ORDER BY rewardTime DESC
		;");
	
	while($messageRow = $GLOBALS['DATABASE']->fetch_array($messageRaw))
	{
	
	
		$messageList[$messageRow['rewardIdLog']]	= array(
			'date'		=> str_replace(' ', '&nbsp;', _date($LNG['php_tdformat'], $messageRow['rewardTime']), $USER['timezone']),
			'rewardPrice'		=> $messageRow['rewardPrice'],
			'rewardIdLog'		=> $messageRow['rewardIdLog'],
			'rewardCode'		=> $this->redeemCode($messageRow['rewardIdLog']),
		);
	}
	
	
	$this->tplObj->assign_vars(
	array(
    'messageList' => $messageList,                        
    ));
	$this->display("page.reward2.historique.tpl");
	}
	function show(){
            
		global $USER,$PLANET, $UNI;
                

        
		$id_player = HTTP::_GP('id',0);
    		
		if($_POST){
                    
                    
			//verificarile de rigoare
			$TheCode = HTTP::_GP('voucher','');
			//1. see if code exists
			$CodeExist = $GLOBALS['DATABASE']->query("SELECT *from `uni1_reward` where universe = '".$UNI."' AND `rewardCode` = '".$GLOBALS['DATABASE']->sql_escape($TheCode)."' ;");
			if($GLOBALS['DATABASE']->numRows($CodeExist)>0){
				//code exists
				$CodeDb = $GLOBALS['DATABASE']->fetch_array($CodeExist);
				if($CodeDb['rewardCount'] == -1){
					//unlimited use for users
					if($CodeDb['rewardUserLimit'] == 1){
						//user limit is 1, check if he already used it, if not update
							$CheckLog = $GLOBALS['DATABASE']->query("SELECT *from `uni1_reward_log` where universe = '".$UNI."' AND `rewardIdLog` = ".$CodeDb['rewardId']." and `rewardUserId` = ".$USER['id']." ;");
							if($GLOBALS['DATABASE']->numRows($CheckLog)>0){
								$this->printMessage("Already Used this code");
								die();
							}else{
								$USER['darkmatter'] += $CodeDb['rewardDarkmatter'];
								$PLANET['metal'] += $CodeDb['rewardMetal'];
								$PLANET['crystal'] += $CodeDb['rewardCrystal'];
								$PLANET['deuterium'] += $CodeDb['rewardDeuterium'];
                                  
								
								
								//$GLOBALS['DATABASE']->query("Update `uni1_reward` set `rewardCount` = `rewardCount` - 1 where `rewardId` = ".$CodeDb['rewardId']." ;");
								$MessageOk = "You received ";
								if(!empty($CodeDb['rewardMetal']))
									$MessageOk .= "<span style='color:#33FF00';>".$CodeDb['rewardMetal']." </span>Metal";
								
								if(!empty($CodeDb['rewardCrystal']))
									$MessageOk .= "<span style='color:#33FF00';>".$CodeDb['rewardCrystal']."  </span>Crystal";
								
								if(!empty($CodeDb['rewardDeuterium']))
									$MessageOk .= "<span style='color:#33FF00';>".$CodeDb['rewardDeuterium']." </span> Deuterium";
								
								if(!empty($CodeDb['rewardDarkmatter']))
									$MessageOk .= "<span style='color:#33FF00';>".$CodeDb['rewardDarkmatter']." </span> Darkmatter ";
								$GLOBALS['DATABASE']->query("INSERT INTO `uni1_reward_log` VALUES (".$CodeDb['rewardId'].",".$USER['id'].",".TIMESTAMP.", '".$UNI."', '".$MessageOk."') ;");
									
									
								$this->printMessage("Voucher used succesfully ".$MessageOk, true, array('?page=Reward2', 3));
								die();
							}
							//if yes , already used this code
					}else{
						$USER['darkmatter'] += $CodeDb['rewardDarkmatter'];
								$PLANET['metal'] += $CodeDb['rewardMetal'];
								$PLANET['crystal'] += $CodeDb['rewardCrystal'];
								$PLANET['deuterium'] += $CodeDb['rewardDeuterium'];
							//$GLOBALS['DATABASE']->query("Update `uni1_reward` set `rewardCount` = `rewardCount` - 1 where `rewardId` = ".$CodeDb['rewardId']." ;");
							
							$MessageOk = "You received ";
								if(!empty($CodeDb['rewardMetal']))
									$MessageOk .= "<span style='color:#33FF00';>".$CodeDb['rewardMetal']."</span> Metal &nbsp;";
								
								if(!empty($CodeDb['rewardCrystal']))
									$MessageOk .= "<span style='color:#33FF00';>".$CodeDb['rewardCrystal']."</span> Crystal &nbsp;";
								
								if(!empty($CodeDb['rewardDeuterium']))
									$MessageOk .= "<span style='color:#33FF00';>".$CodeDb['rewardDeuterium']."</span> Deuterium &nbsp;";
								
								if(!empty($CodeDb['rewardDarkmatter']))
									$MessageOk .= "<span style='color:#33FF00';>".$CodeDb['rewardDarkmatter']." </span>Darkmatter ";
								$GLOBALS['DATABASE']->query("INSERT INTO `uni1_reward_log` VALUES (".$CodeDb['rewardId'].",".$USER['id'].",".TIMESTAMP.", '".$UNI."', '".$MessageOk."') ;");
							$this->printMessage("Voucher used succesfully, ".$MessageOk, true, array('?page=Reward2', 3));
								die();
					}
				}else{
					if($CodeDb['rewardCount'] > 0){
						if($CodeDb['rewardUserLimit'] == 0){
								$USER['darkmatter'] += $CodeDb['rewardDarkmatter'];
								$PLANET['metal'] += $CodeDb['rewardMetal'];
								$PLANET['crystal'] += $CodeDb['rewardCrystal'];
								$PLANET['deuterium'] += $CodeDb['rewardDeuterium'];
								
							$GLOBALS['DATABASE']->query("Update `uni1_reward` set `rewardCount` = `rewardCount` - 1 where `rewardId` = ".$CodeDb['rewardId']." ;");
							
								
							$MessageOk = "You received ";
								if(!empty($CodeDb['rewardMetal']))
									$MessageOk .= "<span style='color:#33FF00';>".$CodeDb['rewardMetal']."</span> Metal &nbsp;";
								
								if(!empty($CodeDb['rewardCrystal']))
									$MessageOk .= "<span style='color:#33FF00';>".$CodeDb['rewardCrystal']." </span>Crystal &nbsp;";
								
								if(!empty($CodeDb['rewardDeuterium']))
									$MessageOk .= "<span style='color:#33FF00';>".$CodeDb['rewardDeuterium']."</span> Deuterium &nbsp;";
								
								if(!empty($CodeDb['rewardDarkmatter']))
									$MessageOk .= "<span style='color:#33FF00';>".$CodeDb['rewardDarkmatter']."</span> Darkmatter ";
								$GLOBALS['DATABASE']->query("INSERT INTO `uni1_reward_log` VALUES (".$CodeDb['rewardId'].",".$USER['id'].",".TIMESTAMP.", '".$UNI."', '".$MessageOk."') ;");
							$this->printMessage("Voucher used succesfully, ".$MessageOk, true, array('?page=Reward2', 3));
								die();
						}else{
							//user limit is 1, check if he already used it, if not update
							$CheckLog = $GLOBALS['DATABASE']->query("SELECT *from `uni1_reward_log` where universe = '".$UNI."' AND `rewardIdLog` = ".$CodeDb['rewardId']." and `rewardUserId` = ".$USER['id']." ;");
							if($GLOBALS['DATABASE']->numRows($CheckLog)>0){
								$this->printMessage("Already Used this code");
								die();
							}else{
								$USER['darkmatter'] += $CodeDb['rewardDarkmatter'];
								$PLANET['metal'] += $CodeDb['rewardMetal'];
								$PLANET['crystal'] += $CodeDb['rewardCrystal'];
								$PLANET['deuterium'] += $CodeDb['rewardDeuterium'];
                                                             							
								$GLOBALS['DATABASE']->query("Update `uni1_reward` set `rewardCount` = `rewardCount` - 1 where `rewardId` = ".$CodeDb['rewardId']." ;");
								$MessageOk = "You received ";
								if(!empty($CodeDb['rewardMetal']))
									$MessageOk .= "<span style='color:#33FF00';>".pretty_number($CodeDb['rewardMetal'])." </span>Metal &nbsp;";
								
								if(!empty($CodeDb['rewardCrystal']))
									$MessageOk .= "<span style='color:#33FF00';>".pretty_number($CodeDb['rewardCrystal'])." </span>Crystal &nbsp;";
								
								if(!empty($CodeDb['rewardDeuterium']))
									$MessageOk .= "<span style='color:#33FF00';>".pretty_number($CodeDb['rewardDeuterium'])." </span>Deuterium &nbsp;";
								
								if(!empty($CodeDb['rewardDarkmatter']))
									$MessageOk .= "<span style='color:#33FF00';>".pretty_number($CodeDb['rewardDarkmatter'])." </span>Darkmatter ";
								$GLOBALS['DATABASE']->query("INSERT INTO `uni1_reward_log` VALUES (".$CodeDb['rewardId'].",".$USER['id'].",".TIMESTAMP.", '".$UNI."', '".$MessageOk."') ;");
							$this->printMessage("Voucher used succesfully, ".$MessageOk, true, array('?page=Reward2', 2));
								die();
							}
							//if yes , already used this code
						}
					}else{
						$this->printMessage("Code depleted", true, array('game.php?page=Reward2', 2));
						die();
					}
				}
			}else{
				$this->printMessage("The code is invalid", true, array('game.php?page=Reward2', 2));
				die();
			}
		}
		$this->display('page.reward2.default.tpl');
	}
}