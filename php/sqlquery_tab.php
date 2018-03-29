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


// Connection to the db
$conx=db_connect($host,$user,$pswd,$bd);
// Tableau associatif en sortie aussi
$tabtot=db_query($conx,$query);
// Close connection
mysqli_close($conx);
// Initialise le retour
echo json_encode($tabtot);
?>
