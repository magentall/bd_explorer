<?php
include '../includes/php/db_functions';
include '../includes/php/query_functions';
//$host='localhost';
$host=$_POST['host'];
//$user='viz';
$user=$_POST['user'];
//$pswd='viz';//Bienvenue111***';
$pswd=$_POST['password'];
//$bd='bd_cv';
$bd=$_POST['database'];
$query=$_POST['query'];

include '../includes/php/display_query';
?>
