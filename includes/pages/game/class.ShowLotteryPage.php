<?php
class ShowLotteryPage extends AbstractPage
{	
	public static $requireModule = 0;
	
	function __construct() {
		parent::__construct();
	}
	
	function show()
	{
		global  $USER, $PLANET, $LNG, $LANG,$CONF,$UNI;
	if(!empty($USER['urlaubs_modus'])){
		$this->printMessage($LNG['vmodeblock'], true, array('game.php?page=Overview', 2));
		die();
	}

		$max_users_tickets = 1;
		$ticket_price = 20000000;
		
	$this->tplObj->loadscript('jquery.countdown.js');
	
	
	$ticket_prize_dm = 50;
	
	
	if($_POST){
		$tickets = HTTP::_GP('tickets', 0);
		if($tickets <=0 || $tickets > 1){
			$this->printMessage("<span class='rouge'>Hack attempt</span>");
			die();
		}

		$cautare = $GLOBALS['DATABASE']->query("SELECT *from `uni1_loteria` where `id` = '".$USER['id']."' AND universe = '".$UNI."' ;");
	
		if($GLOBALS['DATABASE']->numRows($cautare) > 0){

			$cautare2 = $GLOBALS['DATABASE']->query("SELECT SUM(tickets) as total_tickets from `uni1_loteria` where `id` = '".$USER['id']."' AND universe = '".$UNI."' ;");
			$cautare2 = $GLOBALS['DATABASE']->fetch_array($cautare2);
			if(($cautare2['total_tickets']+ $tickets) > $max_users_tickets){
				$this->printMessage("<span class='rouge'>You have already bought the maximum ticket number.</span>", true, array('game.php?page=lottery', 2));
				die();
			}
		}
		$cost['metal'] = $tickets * $ticket_price;
		$cost['crystal'] = $tickets * $ticket_price;
		$cost['deuterium'] = $tickets * $ticket_price;
		$cost['elyrium'] = $tickets * $ticket_price;

		if($PLANET['metal'] < $cost['metal'] || $PLANET['crystal'] < $cost['crystal'] || $PLANET['deuterium'] < $cost['deuterium'] || $PLANET['elyrium'] < $cost['elyrium']){
			$this->printMessage("<span class='rouge'>You do not have enough resource on this planet to buy the tickets.</span>", true, array('game.php?page=lottery', 2));
			die();
		}else{
                    
            $PLANET['metal'] -= $cost['metal'];
            $PLANET['crystal'] -= $cost['crystal'];
            $PLANET['deuterium'] -= $cost['deuterium'];
            $PLANET['elyrium'] -= $cost['elyrium'];
		
			$GLOBALS['DATABASE']->query("INSERT INTO `uni1_loteria` VALUES ('".$USER['id']."','".$USER['username']."','".$tickets."', '".$UNI."', '".TIMESTAMP."') ;");
			$this->printMessage("<span class='vert'>You have bought ".$tickets." tickets. </span>", true, array('game.php?page=lottery', 2));
			die();
		}
	}
	


$total_users = $GLOBALS['DATABASE']->query("SELECT DISTINCT `id` from `uni1_loteria` WHERE universe = '".$UNI."' ;");
	$total_users = $GLOBALS['DATABASE']->numRows($total_users);
	if($CONF['lottery_time'] < TIMESTAMP){
		if($total_users < $CONF['lottery_min']){

			
			$time = TIMESTAMP+24*60*60;
			$GLOBALS['DATABASE']->query("UPDATE `uni1_config` SET `lottery_time` = ". $time ." where `uni` = ".$UNI.";");
			$this->printMessage("<span class='rouge'>Lottery Postponing from the lack of lottery users.</span>", true, array('game.php?page=lottery', 2));
			die();
		} 

		$get_tickets = $GLOBALS['DATABASE']->query("SELECT *FROM `uni1_loteria` where universe = '".$UNI."'");
		if($GLOBALS['DATABASE']->numRows($get_tickets) >0){


			$user_array = array();
			$diferent_users = $GLOBALS['DATABASE']->query("SELECT DISTINCT `id` from `uni1_loteria` where universe = '".$UNI."';");
			while($s = $GLOBALS['DATABASE']->fetch_array($diferent_users)){
				$user_array[] = $s['id'];
			}
			$random = rand(0,count($user_array)-1);
			do{
			$random1 = rand(0,count($user_array)-1);
			}while($random1==$random);
			do{
			$random2 = rand(0,count($user_array)-1);
			}while($random2==$random1 || $random2==$random);

			$total_user  = $GLOBALS['DATABASE']->query("SELECT SUM(tickets) as sum_tickets, user from `uni1_loteria` where `id` = '".$user_array[$random]."' AND universe = '".$UNI."';");
			$total_user1 = $GLOBALS['DATABASE']->query("SELECT SUM(tickets) as sum_tickets, user from `uni1_loteria` where `id` = '".$user_array[$random1]."' AND universe = '".$UNI."' ;");
			$total_user2 = $GLOBALS['DATABASE']->query("SELECT SUM(tickets) as sum_tickets, user from `uni1_loteria` where `id` = '".$user_array[$random2]."' AND universe = '".$UNI."' ;");
			
			$total_user  = $GLOBALS['DATABASE']->fetch_array($total_user);
			$total_user1 = $GLOBALS['DATABASE']->fetch_array($total_user1);
			$total_user2 = $GLOBALS['DATABASE']->fetch_array($total_user2);
			
			$total_user_prize = 3;
			$total_user_prize1 = 2;
			$total_user_prize2 = 1;
			
			if($USER['id'] == $user_array[$random])
				$USER['darkmatter'] += $total_user_prize;
			else{
				$GLOBALS['DATABASE']->query("UPDATE ".USERS." set `darkmatter` = `darkmatter` + ".$total_user_prize." where `id` = '".$user_array[$random]."' AND `universe` = '".$UNI."';");
			}
			if($USER['id'] == $user_array[$random1])
				$USER['darkmatter'] += $total_user_prize1;
			else
				$GLOBALS['DATABASE']->query("UPDATE ".USERS." set `darkmatter` = `darkmatter` + ".$total_user_prize1." where `id` = '".$user_array[$random1]."' AND `universe` = '".$UNI."';");
			if($USER['id'] == $user_array[$random2])
				$USER['darkmatter'] += $total_user_prize2;
			else
				$GLOBALS['DATABASE']->query("UPDATE ".USERS." set `darkmatter` = `darkmatter` + ".$total_user_prize2." where `id` = '".$user_array[$random2]."' AND `universe` = '".$UNI."';");
	
			$GLOBALS['DATABASE']->query("DELETE FROM `uni1_loteria_log` WHERE universe = '".$UNI."';");
			$GLOBALS['DATABASE']->query("INSERT INTO `uni1_loteria_log` VALUES('".$total_user['user']."','".TIMESTAMP."','".$total_user_prize."', '".$UNI."') ");
			$GLOBALS['DATABASE']->query("INSERT INTO `uni1_loteria_log` VALUES('".$total_user1['user']."','".TIMESTAMP."','".$total_user_prize1."', '".$UNI."') ");
			$GLOBALS['DATABASE']->query("INSERT INTO `uni1_loteria_log` VALUES('".$total_user2['user']."','".TIMESTAMP."','".$total_user_prize2."', '".$UNI."') ");
			
			$GLOBALS['DATABASE']->query("DELETE FROM `uni1_loteria` WHERE universe = '".$UNI."';");
			
			SendSimpleMessage ( $user_array[$random], $user_array[$random], TIMESTAMP, 1, 'Lotery', 'You just won', 'You just won '.$total_user_prize.' DM in the lotery'); //Enviamos el mensaje
			SendSimpleMessage ( $user_array[$random1], $user_array[$random1], TIMESTAMP, 1, 'Lotery', 'You just won', 'You just won '.$total_user_prize1.' DM in the lotery');
			SendSimpleMessage ( $user_array[$random2], $user_array[$random2], TIMESTAMP, 1, 'Lotery', 'You just won', 'You just won '.$total_user_prize2.' DM in the lotery');
			
			$time = TIMESTAMP+24*60*60;

			$GLOBALS['DATABASE']->query("UPDATE `uni1_config` SET `lottery_time` = ". $time ." where `uni` = ".$UNI.";");

			$this->printMessage("<span class='vert'>Lottery restarting.</span>", true, array('game.php?page=lottery', 2));
			die();
		}else{

			$time = TIMESTAMP+24*60*60;
			$GLOBALS['DATABASE']->query("UPDATE `uni1_config` SET `lottery_time` = ". $time ." WHERE uni = '".$UNI."' ;");
	
			$this->printMessage("<span class='rouge'>No tickets, postponing 2.</span>", true, array('game.php?page=lottery', 2));
			die();
		}
	}else{
		$secs = $CONF['lottery_time'] - TIMESTAMP;

		

		$diferent_users = $GLOBALS['DATABASE']->query("SELECT DISTINCT `id` from `uni1_loteria` WHERE universe = '".$UNI."' ORDER BY RAND() LIMIT 3 ;");
		if($GLOBALS['DATABASE']->numRows($diferent_users) > 0){
		$lista = '  <table>
        <tr>
            <th class="logo"></th>
            <th class="date_operation">'.$LNG['ti_userna'].'</th>
            <th class="description">'.$LNG['lm_lotto_2'].'</th>
            <th class="description">'.$LNG['lm_lotto_3'].'</th>
        </tr>';
			while($s = $GLOBALS['DATABASE']->fetch_array($diferent_users)){
			$total_user = $GLOBALS['DATABASE']->query("SELECT user, timestamp from `uni1_loteria` where `id` = '".$s['id']."' AND universe = '".$UNI."' ;");
			$total_user = $GLOBALS['DATABASE']->fetch_array($total_user);
			$lista .= '<tr>
            <td class="logo"></td>
            <td class="date_operation">'.$total_user['user'].'</td>
            <td class="description">'. gmdate('M d Y H:i:s',$total_user['timestamp']).'</td>
            <td class="description">1 <img src="media/image/ticket-icon.png" width="16px" height="16px"/></td>
        </tr>';
			
			 
		}
		$lista .= '</table>';}
		
			else{
			$lista = "<table>
        <tr>
            <th class='logo'></th>
            <th class='date_operation'>".$LNG['ti_userna']."</th>
            <th class='description'>".$LNG['lm_lotto_2']."</th>
            <th class='description'>".$LNG['lm_lotto_2']."</th>
        </tr>";
			$lista .= "<tr>
            <td class='description' colspan='4'><center><font color='red'>".$LNG['lm_lotto_4']."</font></center></td>
        </tr>";
		$lista .= "</table>";
		}

		$castigatori = $GLOBALS['DATABASE']->query("SELECT *FROM `uni1_loteria_log` WHERE universe = '".$UNI."' ORDER BY `time` DESC LIMIT 5");
		if($GLOBALS['DATABASE']->numRows($castigatori) >0){

			$lista_winners = "<table>
        <tr>
            <th class='logo'></th>
            <th class='date_operation'>".$LNG['ti_userna']."</th>
            <th class='description'>".$LNG['lm_lotto_2']."</th>
            <th class='description'>".$LNG['lm_lotto_2']."</th>
        </tr>";
			while($x = $GLOBALS['DATABASE']->fetch_array($castigatori)){
				$lista_winners .= " <tr>
            <td class='logo'></td>
            <td class='date_operation'>".$x['username']."</td>
            <td class='description'>". gmdate("M d Y H:i:s",$x['time'] )."</td>
            <td class='description'>".$x['prize']." <img src='/media/ingame/image/credit.png' width='16px' height='16px'/></td>
        </tr>";
			}
			
			
		
			$lista_winners .= "</table>";
		}else{

			
			$lista_winners = "<table>
        <tr>
            <th class='logo'></th>
            <th class='date_operation'>".$LNG['ti_userna']."</th>
            <th class='description'>".$LNG['lm_lotto_5']."</th>
            <th class='description'>".$LNG['lm_lotto_6']."</th>
        </tr>";
			$lista_winners .= "<tr>
            <td class='description' colspan='4'><center><font color='red'>".$LNG['lm_lotto_7']."</font></center></td>
        </tr>";
		$lista_winners .= "</table>";
			
			
			
		}

		$this->tplObj->assign_vars(array(
			
			'dm_win'	=> $ticket_prize_dm,
			'secs'		=>$secs,
			'user_lists' => $lista,
			'max_tickets_per_player' => $max_users_tickets,
			'winners'	=> $lista_winners,
			'minimum_users'	=> $CONF['lottery_min'],));
		$this->display('page.lottery.default.tpl');
	}
	}
}
?>