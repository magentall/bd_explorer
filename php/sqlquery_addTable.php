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
$table=$_POST['table'];
$tabData=$_POST['tab_data'];
$tabData2=$_POST['tab_data2'];

$query="INSERT INTO ".$table." (";
// ajout des données tabData dans la base
foreach ($tabData as $key => $value) {
  //print $tabData[$key];
  $query=$query.$value.",";
}
$query=substr($query, 0, -1);
$query=$query.") VALUES ('";
foreach ($tabData2 as $keyY => $valueE) {
  $query=$query.$valueE."','";
}
$query=substr($query, 0, -1);
$query=substr($query, 0, -1);
$query=$query.")";
print "<div class=\"group-text\">Done</div>";
//print $query;
//print $query;

$conx=db_connect($host,$user,$pswd,$bd);
db_query($conx,$query);
mysqli_close($conx);


//INSERT INTO tbl_name (col1,col2) VALUES(15,col1*2);

//   DISPLAY RESULT IN MAIN PAGE
$query='SELECT * FROM '.$table;
include '../includes/php/display_query';
?>
