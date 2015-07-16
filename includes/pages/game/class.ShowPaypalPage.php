<?php

require_once(ROOT_PATH . 'includes/classes/class.paypal.php');

class ShowPaypalPage extends AbstractPage
{
        const MAIL        = '(EMAIL)';

        public $pattern        = array(
                
                1        => '1.60',
                5        => '7.75',
                10        => '15.00',
                20        => '29.00',
                40        => '56.00',
                80        => '108.00',
               
        );
        public $cost        = '0';
        public $amount        = '0';

        function __construct() {
                parent::__construct();
				
				
				$action = HTTP::_GP('action', '');
                switch ($action)
                {
                        case 'success':
                                $this->IPN();
                        break;
                        case 'cancel':
                                $this->Cancel();
                        break;
                        case 'ipn':
                                $this->IPN();
                        break;
                        default:
                                $this->CallOrder();
                        break;
                }
				
        }

        function Success()
        {
 
                message(pretty_number(HTTP::_GP('amount', 0)).' Dark matter where is on your account. <br><br><a href="?page=overview">Continue</a>');
        }

        function Cancel()
        {
                message('Your Order where Cancelled.</h3><br><a href="?page=overview">Continue</a><br>');
        }

        /*
                It's important to remember that paypal calling this script.  There
                is no output here.  This is where you validate the IPN data and if it's
                valid, update your database to signify that the user has payed.  If
                you try and use an echo or printf function here it's not going to do you
                a bit of good.  This is on the "backend".  That is why, by default, the
                class logs all IPN data to a text file.
        */

        function IPN()
        {
                global $USER;
               /* if (!$this_p->validate_ipn())
                      {
						message('There was an error');
					  }
				*/
                $ID        = HTTP::_GP('custom','');
               $txn_id        = $_GET['txn_id'];
				$mc_gross        = $_GET['mc_gross'];
				//print_r($ID);
              //  $ID        = HTTP::_GP('amount','');
				$explode = explode(',',$ID);
				$user_id = $explode[0];
				$the_id = $explode[1];
				if(empty($ID)){
					message("Error occured");
				}
                $INFO        = $GLOBALS['DATABASE']->uniquequery("SELECT * FROM `uni1_paypal` WHERE `id` = ".$GLOBALS['DATABASE']->sql_escape($the_id)." and `player` = ".$GLOBALS['DATABASE']->sql_escape($user_id).";");
				
				
				//print_r($INFO);
				if(!empty($INFO)){
	
    $GLOBALS['DATABASE']->query("UPDATE `uni1_users` SET `darkmatter` = `darkmatter` + ".$INFO['amount']." WHERE `id` = '".$INFO['player']."';");
	$GLOBALS['DATABASE']->query("DELETE FROM `uni1_paypal` WHERE `id` = '".$the_id."';");
   
	//$GLOBALS['DATABASE']->query("INSERT INTO `uni1_paypal_log` VALUES (null,".$INFO['player'].",".$INFO['amount'].",".TIMESTAMP.") ;");
	
	$GLOBALS['DATABASE']->query("INSERT INTO `uni1_paysafecard_log` VALUES ('', '".mysql_escape_string($user_id)."',  '".TIMESTAMP."', '".$txn_id."', '".$mc_gross."','1', 'Paypal', '1');");
	
	
	message(pretty_number($INFO['amount']).' Credit have been added to your account. <br><br><a href="?page=overview">Continue</a>');
	
	
	}else{
		message('Error please contact the administrator <br><br><a href="?page=overview">Continue</a>');
}

        }

        function CallOrder()
        {
                global $USER, $CONF, $UNI;

                $this->amount                = HTTP::_GP('amount',0);
                $this->cost                = HTTP::_GP('cost',0);

                if(!array_key_exists($this->amount, $this->pattern)) {
                        message('NOT VALID VALUE', '?page=overview', 3);
                        exit;
                }

                $this->cost        = $this->pattern[$this->amount];
				$validationKey	= md5(uniqid('2m'));
                $GLOBALS['DATABASE']->query("INSERT INTO `uni1_paypal` (`id`, `player`, `amount`, `timestamp`, `price`) VALUES (NULL, '".$USER['id']."', '".$this->amount."', '".TIMESTAMP."', '".$this->cost."');");
				//SendSimpleMessage ( $USER['id'], $USER['id'], TIMESTAMP, 1, 'Payment Bot', 'To do', 'After the payment has been processed, if you didnt received your DM please send an ticket or an Private Message to "Admin"');
				$this_p = new paypal_class;
				
                $ID        = $GLOBALS['DATABASE']->uniquequery("SELECT `id` FROM `uni1_paypal` WHERE `player` = '".$USER['id']."' AND `amount` = '".$this->amount."' AND `timestamp` = '".TIMESTAMP."'");
                $this_p->add_field('business', $this::MAIL);
               
				
			   $this_p->add_field('return', 'https://'.$_SERVER['HTTP_HOST'].'/game.php?page=paypal&i='.$validationKey.'');
				
				
				
				$this_p->add_field('cancel_return', 'https://'.$_SERVER['HTTP_HOST'].'/ipn.php');
                $this_p->add_field('notify_url', 'https://'.$_SERVER['HTTP_HOST'].'/ipn.php');
				
                $this_p->add_field('item_name', $this->amount.' Credit-User('.$USER['username'].').');
                $this_p->add_field('item_number', $this->amount.'_credits');
                $this_p->add_field('amount', $this->cost);
                //$this_p->add_field('action', $action); ?
                $this_p->add_field('currency_code', 'EUR');
                 $this_p->add_field('custom', $USER['id'].','.$validationKey);
                 $this_p->add_field('rm', '2');
                //$this_p->dump_fields(); 
				 foreach ($this_p->fields as $name => $value) {
					$field[] = array('text'=>'<input type="hidden" name="'.$name.'" value="'.$value.'">');
				}
			 $this->tplObj->assign_vars(array(
				'fields' => $field,
			 ));
			$this->display('paypal_class.tpl');
        }

}
?>