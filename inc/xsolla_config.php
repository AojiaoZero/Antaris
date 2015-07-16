<?php
define('SECRET_KEY', 'FcSMcJZeEjE7XlBN'); //your secret key
//database configuration
abstract class DBConfig {
const HOST = '127.0.0.1'; //mysql host (example: 127.0.0.1)
const PORT = '3306'; //mysql port (default: 3306)
const USER = 'spaceofantaris'; //mysql username
const PASS = '0573984D6F3181'; //mysql password
const DB = 'spaceofantaris'; //name of your database
}
//response codes
abstract class ResponseCode {
const OK = 0;
const ERROR_TEMP = 1;
const INVALID_USER = 2;
const INVALID_INVOICE = 2;
const INVALID_MD5 = 3;
const INVALID_REQUEST = 4;
const ERROR_OTHER = 5;
const ERROR_TECHNICAL = 7;
const ERROR_NOCANCEL = 7;
}
?>