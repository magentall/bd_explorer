<?php
$query=$_POST['query'];

// Create connection
$db=mysqli_connect("localhost","viz","Bienvenue111***","bd_cv");

//print 'yes';
// Check connection
if (mysqli_connect_errno())
  {
  echo "Failed to connect to MySQL: " . mysqli_connect_error();
  }
  $query="SELECT * FROM Human";
  $result = mysqli_query($db,$query);


  $tabtot = [];

  $i=0;

  while($tab = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
    $tabres = [];
    foreach ($tab as $key => $value) {
    //print $value."<br>";
    //print $key."\n".$tab[$key]."<br>";
    $tabres[$key] = $value ;
    $temp=$key;
    }
    $tabtot[$i]=$tabres;
    $i++;
    //print "wwwwwhaaa<br>";
  }

  foreach ($tabtot as $key => $value) {
    //print $key."\n".$tabtot[$key]."<br>";
    foreach ($tabtot[$key] as $keyy => $valuee) {
        //print $tabtot[$key][$keyy]."<br>";
        print $valuee."<br>";
    }
  }


?>










<?php
$query=$_POST['query'];


function db_connect(host,user,pswd,db){
    // Create connection
    $db=mysqli_connect("localhost","viz","Bienvenue111***","bd_cv");
    // Check connection
    if (mysqli_connect_errno())
      {
      echo "Failed to connect to MySQL: " . mysqli_connect_error();
      return null;
      }
    // retour la connection ouverte
    return $db;

}

$db=db_connect();

$query="SELECT * FROM Groupe";
$result = mysqli_query($db,$query);


$tabtot = [];

$i=0;

while($tab = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
  $tabres = [];
  foreach ($tab as $key => $value) {
  //print $value."<br>";
  //print $key."\n".$tab[$key]."<br>";
  $tabres[$key] = $value ;
  $temp=$key;
  }
  $tabtot[$i]=$tabres;
  $i++;
  //print "wwwwwhaaa<br>";
}

foreach ($tabtot as $key => $value) {
  //print $key."\n".$tabtot[$key]."<br>";
  foreach ($tabtot[$key] as $keyy => $valuee) {
      print $tabtot[$key][$keyy];
      print $valuee;
  }
}

?>
