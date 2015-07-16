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
function SendSimpleMessage($Owner, $Sender, $Time, $Type, $From, $Subject, $Message)
{
			
	$SQL	= "INSERT INTO uni1_messages SET 
	message_owner = ".(int) $Owner.", 
	message_sender = ".(int) $Sender.", 
	message_time = ".(int) $Time.", 
	message_type = ".(int) $Type.", 
	message_from = '". $From ."', 
	message_subject = '". $Subject ."', 
	message_text = '".$Message."', 
	message_unread = '1', 
	message_universe = '1';";
	$SQ	= "INSERT INTO uni1_messages_copy SET 
	message_owner = ".(int) $Owner.", 
	message_sender = ".(int) $Sender.", 
	message_time = ".(int) $Time.", 
	message_type = ".(int) $Type.", 
	message_from = '". $From ."', 
	message_subject = '". $Subject ."', 
	message_text = '".$Message."', 
	message_unread = '1', 
	message_universe = '1';";

	mysql_query($SQL);
	mysql_query($SQ);
}

function  _rewardPurchase($userId, $currency, $mc_gross, $txn_id, $the_id) {

    

        // Make userid safe to use in query
$userId = mysql_real_escape_string($userId);

mysql_query("UPDATE `uni1_users` SET `darkmatter` = `darkmatter` + ".$currency." WHERE `id` = '".$userId."';");
mysql_query("INSERT INTO `uni1_paysafecard_log` VALUES (null, '".mysql_escape_string($userId)."',  '".$timer."', '".$txn_id."', '".$mc_gross."','".$currency."', 'Paypal', '1', '".$the_id."');");

if(DEBUG == true) {
error_log(date('[Y-m-d H:i e] '). "Verified IPN: $req ". PHP_EOL, 3, LOG_FILE);
}
        

    

}

//-------------------------- Don't change anything below this! ----------------------------- //

define("DEBUG", 1);
// Set to 0 once you're ready to go live
define("USE_SANDBOX", 0);
define("LOG_FILE", "./ipn.log");
// Read POST data
// reading posted data directly from $_POST causes serialization
// issues with array data in POST. Reading raw POST data from input stream instead.
$raw_post_data = file_get_contents('php://input');
$raw_post_array = explode('&', $raw_post_data);
$myPost = array();
foreach ($raw_post_array as $keyval) {
$keyval = explode ('=', $keyval);
if (count($keyval) == 2)
$myPost[$keyval[0]] = urldecode($keyval[1]);
}
// read the post from PayPal system and add 'cmd'
$req = 'cmd=_notify-validate';
if(function_exists('get_magic_quotes_gpc')) {
$get_magic_quotes_exists = true;
}
foreach ($myPost as $key => $value) {
if($get_magic_quotes_exists == true && get_magic_quotes_gpc() == 1) {
$value = urlencode(stripslashes($value));
} else {
$value = urlencode($value);
}
$req .= "&$key=$value";
}
// Post IPN data back to PayPal to validate the IPN data is genuine
// Without this step anyone can fake IPN data
if(USE_SANDBOX == true) {
$paypal_url = "https://www.sandbox.paypal.com/cgi-bin/webscr";
} else {
$paypal_url = "https://www.paypal.com/cgi-bin/webscr";
}
$ch = curl_init($paypal_url);
if ($ch == FALSE) {
return FALSE;
}
curl_setopt($ch, CURLOPT_HTTP_VERSION, CURL_HTTP_VERSION_1_1);
curl_setopt($ch, CURLOPT_POST, 1);
curl_setopt($ch, CURLOPT_RETURNTRANSFER,1);
curl_setopt($ch, CURLOPT_POSTFIELDS, $req);
curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 1);
curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 2);
curl_setopt($ch, CURLOPT_FORBID_REUSE, 1);
if(DEBUG == true) {
curl_setopt($ch, CURLOPT_HEADER, 1);
curl_setopt($ch, CURLINFO_HEADER_OUT, 1);
}
// CONFIG: Optional proxy configuration
//curl_setopt($ch, CURLOPT_PROXY, $proxy);
//curl_setopt($ch, CURLOPT_HTTPPROXYTUNNEL, 1);
// Set TCP timeout to 30 seconds
curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 30);
curl_setopt($ch, CURLOPT_HTTPHEADER, array('Connection: Close'));
// CONFIG: Please download 'cacert.pem' from "http://curl.haxx.se/docs/caextract.html" and set the directory path
// of the certificate as shown below. Ensure the file is readable by the webserver.
// This is mandatory for some environments.
//$cert = __DIR__ . "./cacert.pem";
//curl_setopt($ch, CURLOPT_CAINFO, $cert);
$res = curl_exec($ch);
if (curl_errno($ch) != 0) // cURL error
{
if(DEBUG == true) {	
error_log(date('[Y-m-d H:i e] '). "Can't connect to PayPal to validate IPN message: " . curl_error($ch) . PHP_EOL, 3, LOG_FILE);
}
curl_close($ch);
exit;
} else {
// Log the entire HTTP response if debug is switched on.
if(DEBUG == true) {
error_log(date('[Y-m-d H:i e] '). "HTTP request of validation request:". curl_getinfo($ch, CURLINFO_HEADER_OUT) ." for IPN payload: $req" . PHP_EOL, 3, LOG_FILE);
error_log(date('[Y-m-d H:i e] '). "HTTP response of validation request: $res" . PHP_EOL, 3, LOG_FILE);
// Split response headers and payload
list($headers, $res) = explode("\r\n\r\n", $res, 2);
}
curl_close($ch);
}
// Inspect IPN validation result and act accordingly
// check whether the payment_status is Completed
// check that txn_id has not been previously processed
// check that receiver_email is your PayPal email
// check that payment_amount/payment_currency are correct
// process payment and mark item as paid.
// assign posted variables to local variables
//$item_name = $_POST['item_name'];
//$item_number = $_POST['item_number'];
//$payment_status = $_POST['payment_status'];
//$payment_amount = $_POST['mc_gross'];
//$payment_currency = $_POST['mc_currency'];
//$txn_id = $_POST['txn_id'];
//$receiver_email = $_POST['receiver_email'];
//$payer_email = $_POST['payer_email'];


$userId = isset($_POST['custom']) ? $_POST['custom'] : null;
$explode = explode(',',$userId);
$userId = $explode[0];
$the_id = $explode[1];
$currency = isset($_POST['item_number']) ? $_POST['item_number'] : null;
$mc_gross = isset($_POST['mc_gross']) ? $_POST['mc_gross'] : null;
$payment_status = isset($_POST['payment_status']) ? $_POST['payment_status'] : null;
$txn_id        = isset($_POST['txn_id']) ? $_POST['txn_id'] : null;

$result = false;
if ($payment_status == 'Completed') {

        $result = true;
        _rewardPurchase($userId, $currency, $mc_gross, $txn_id, $the_id);
    

}

if ($result) {
    echo 'OK';
}

//Close Connection
mysql_close();

?>