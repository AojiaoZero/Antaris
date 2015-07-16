<?php
require_once 'xsolla_config.php';
abstract class VirtualCurrency {
private $db; //for our pdo object
private $params; //array of required parameters
/* void */ abstract public function setupDB();
/* bool */ abstract public function userExists($user);
/* bool */ abstract public function invoiceExists($invoiceID);
/* void */ abstract public function newInvoice($invoiceID, $userID, $sum);
/* void */ abstract public function cancelInvoice($invoiceID);
public function __construct() {
//set custom error handler
set_exception_handler(array($this, 'errorHandler'));
}
public function process() {
//define whitelist of Xsolla ip addresses
$whiteList = array('94.103.26.178', '94.103.26.181', '::1');
//make sure the request came from Xsolla

//make sure command is set
if (!isset($_GET['command']))
throw new Exception('param "command" was not included in request.');
//select appropriate method via param 'command'
switch ($_GET['command']) {
case 'check': $this->params = array('v1', 'md5'); break;
case 'pay': $this->params = array('id', 'v1', 'sum', 'md5'); break;
case 'cancel': $this->params = array('id', 'md5'); break;
default: throw new Exception($_GET['command'].' is not an acceptable command.'); break;
}
//make sure the required parameters were included in the request
$this->validateParams($this->params);
//validate the md5 hash
if (!$this->validHash())
$this->createResponse(ResponseCode::INVALID_MD5, 'invalid signature.');
//set up database
$this->setupDB();
//call the appropriate method
$this->$_GET['command']();
}
public function check() {
$responseCode = ResponseCode::OK;
$responseMsg = 'OK';
//user exists or no?
$userExists = $this->userExists($_GET['v1']);
if (!is_bool($userExists))
throw new Exception('invalid return type.');
if (!$userExists) {
$responseCode = ResponseCode::ERROR_TECHNICAL;
$responseMsg = 'user does not exist.';
}
$this->createResponse($responseCode, $responseMsg);
}
public function pay() {
$responseCode = ResponseCode::OK;
$responseMsg = 'OK';
//does the invoice exist?
$invoiceExists = $this->invoiceExists($_GET['id']);
if (!is_bool($invoiceExists))
throw new Exception('invalid return type.');
//create new payment
if (!$invoiceExists)
$this->newInvoice($_GET['id'], $_GET['v1'], $_GET['sum']);
$this->createResponse($responseCode, $responseMsg);
}
public function cancel() {
$responseCode = ResponseCode::OK;
$responseMsg = 'OK';
//does the invoice exist?
$invoiceExists = $this->invoiceExists($_GET['id']);
if (!is_bool($invoiceExists))
throw new Exception('invalid return type.');
if (!$invoiceExists) {
$responseCode = ResponseCode::INVALID_INVOICE;
$responseMsg = 'invoice not found.';
} else {
$this->cancelInvoice($_GET['id']);
}
$this->createResponse($responseCode, $responseMsg);
}
protected function validateParams($params) {
//check that required parameters where included in the request
$error = array();
foreach($params as $param)
if (!isset($_GET[$param]))
$error[] = $param;	
if (count($error) > 0)
throw new Exception('param "'.implode('", "', $error).'" not included in request.');
}
protected function validHash() {
$invoiceID = isset($_GET['id']) ? $_GET['id'] : '';
return md5($_GET['command'].$_GET['v1'].$invoiceID.SECRET_KEY) == $_GET['md5'];
}
protected function createResponse($responseCode, $responseMsg) {
$xml = new SimpleXMLElement('<response></response>');
$xml->addChild('result', $responseCode);
$xml->addChild('comment', $responseMsg);
header('Content-Type: text/xml; charset=cp1251');
echo html_entity_decode($xml->asXML(), ENT_COMPAT, 'windows-1251'); exit;
}
public static function errorHandler($e) {
$xml = new SimpleXMLElement('<response></response>');
$xml->addChild('result', ResponseCode::ERROR_TECHNICAL);
$xml->addChild('comment', $e->getMessage());
header('Content-Type: text/xml; charset=cp1251');
echo html_entity_decode($xml->asXML(), ENT_COMPAT, 'windows-1251'); exit;
}
}
?>