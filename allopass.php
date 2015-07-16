<?php

#Example PHP Postback Script

// Your Database Connection Details
$host = 'localhost';
$db_name = 'antarisl_ingame';
$db_user = 'antarisl_thisis'; 
$db_password = 'EJceRpJcPv3181';


mysql_connect($host, $db_user, $db_password);
mysql_select_db($db_name);
function pretty_number($n, $dec = 0)
{
	return number_format(floattostring($n, $dec), $dec, ',', '.');
}
function floattostring($Numeric, $Pro = 0, $Output = false){
	return ($Output) ? str_replace(",",".", sprintf("%.".$Pro."f", $Numeric)) : sprintf("%.".$Pro."f", $Numeric);
}


function _rewardPurchase($userId, $pay, $realpay, $received, $credits, $type, $transac, $code, $timer) {
// Make userid safe to use in query
$userId = mysql_real_escape_string($userId);
   
mysql_query("UPDATE `uni1_users` SET `darkmatter` = `darkmatter` + '".$credits."' WHERE `id` = '".mysql_escape_string($userId)."';");
mysql_query("INSERT INTO `uni1_paysafecard_log` VALUES ('', '".mysql_escape_string($userId)."',  '".$timer."', '".mysql_escape_string($code)."', '".mysql_escape_string($realpay)."','".mysql_escape_string($credits)."', '".mysql_escape_string($type)."', '1', '');");


  
    

}

//-------------------------- Don't change anything below this! ----------------------------- //

$userId = isset($_POST['user_id']) ? $_POST['user_id'] : null;
$pay = isset($_POST['amount']) ? $_POST['amount'] : null;
$realpay = isset($_POST['paid']) ? $_POST['paid'] : null;
$received = isset($_POST['payout_amount']) ? $_POST['payout_amount'] : null;
$type = isset($_POST['type']) ? $_POST['type'] : null;
$transac = isset($_POST['transaction_id']) ? $_POST['transaction_id'] : null;
$code = isset($_POST['code']) ? $_POST['code'] : null;
$timer = time();
$result = false;

if (isset($code)) {

        $result = true;
        _rewardPurchase(1, $pay, $realpay, $received, 1, $type, $transac, $code, $timer);
    

}

if ($result) {
    echo 'OK';
}

//Close Connection
mysql_close();

?>