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
$table=$_POST['table'];


// Connection to the db
$conx=db_connect($host,$user,$pswd,$bd);
// Tableau associatif en sortie aussi
$tabtot=db_query($conx,$query);
// Close connection
mysqli_close($conx);
// Initialise le retour
$ret='';
//
$startinput="<div class=\"input-group mb-3\">
  <div class=\"input-group-prepend\">
    <span class=\"input-group-text\" id=\"basic-addon1\">";
$middleinput="</span></div><input id=\"addtable";
$middle2input="\" title=\"";
$endinput="\" type=\"text\"
class=\"form-control\" placeholder=\"value\" name=\"ok\" aria-label=\"Username\" aria-describedby=\"basic-addon1\">
</div>";
// ini valeur test si clé primaire ou multi PRI or MUL
$testkey=0;
$aff=0;
$tempret='';
$nblinedisplay=0;
// Initialise la couleur de fond de chaque entry
$color='white';
// Display the results of sql Query
foreach ($tabtot as $key => $value) {
      //print $key."\n".$tabtot[$key]."<br>";

      $testkey=0;
      $aff=1;
      $ret=$ret."<li><div class=\"container itemfull\"><div class=\"row\">";
      foreach ($tabtot[$key] as $keyy => $valuee) {
            //print $tabtot[$key][$keyy]."<br>";
            //print $keyy."\n".$valuee."</li>";

            if ($keyy=='Field') {
              $fieldvaluetemp=$valuee;
              $tempret="<div class=\"animated bounceInRight container\">".$startinput.$valuee.$middleinput.$key.$middle2input.$valuee.$endinput."</div>";
              $retAuto="<div class=\"input-group-text\" id=\"addtable".$key."\" name=\"ok\" title=\"".$valuee."\" itemprop=\"";
              $retAuto2="\">".$valuee;
              //$ret=$ret."<div class=\"col-12 item\"><div class=\"animated bounceInLeft container\"><div class=\"row\">"."<div class=\"col-12 tabval\">".$startinput.$valuee.$endinput."</div></div></div></div>";
            }
            if ($keyy=='Key') {
              if ($valuee=='MUL'){
                $aff=2;

                  $fieldvalue=$fieldvaluetemp;

              }
              if ($valuee=='PRI'){
                $aff=2;
                  $fieldvalue=$fieldvaluetemp;

              }
            }
            if ($keyy=='Extra') {
              if ($valuee=='auto_increment') {
                $aff=0;
                //$ret=$ret."auto_increment";
              }
            }
      }
      if ($aff==0) {
        $retAuto=$retAuto.$valuee.$retAuto2." : ".$valuee."<div>";
        $ret=$ret.$retAuto;
      }
      if ($aff==1) {// DISPLAY FIELD IF NOT PRIMARY KEY
        $ret=$ret.$tempret;
        $nblinedisplay++;
      }
      if ($aff==2) {//DISPLAY FIELD IF KEY MUL
        $nblinedisplay++;
        $nameSelect="<div class=\"input-group-text\">";
        $starttemp="<select class=\"custom-select sel_foreign\" name=\"ok\" id=\"addtable".$key."\"><option selected>Choose link</option>";
        $tempret2='';
        $endtemp="</select></div>";
        $conx=db_connect($host,$user,$pswd,$bd);
        // GET FOREIGN CONSTRAINT OF THE TABLE
        //$query="select  column_name as \'foreign key\', concat(referenced_table_name, \'.\', referenced_column_name) as \'references\' from information_schema.key_column_usage where referenced_table_name is not null and table_schema = \'".$bd."\' and table_name = \'".$table."\' ";
        $query="select column_name as 'foreign key', referenced_table_name as 'table', referenced_column_name as 'ref_name' from information_schema.key_column_usage where referenced_table_name is not null and table_schema = '".$bd."' and table_name = '".$table."' ";
        $tabQuery=db_query($conx,$query);
        mysqli_close($conx);
        $doQuery=0;
        foreach ($tabQuery as $Kkey => $Vvalue) {
          $switchgetval=0;
          foreach ($tabQuery[$Kkey] as $zkey => $zvalue) {
            if ($switchgetval==2) {
                $name_foreign=$zvalue;
//print $name_foreign;
                $nameSelect=$nameSelect.$name_foreign."</div>";
            }
            if ($switchgetval==1) {
                $table_foreign=$zvalue;
                $switchgetval=2;
            }
            if ($zvalue==$fieldvalue) {
              // QUERY TO GET OPTIONS VALUES
//              print " == ";
              $doQuery=1;
              $switchgetval=1;
            }
          }
          if ($doQuery==1) {
            // w gonna use $fieldvalue to find the foreign key and display the options
            // find the $name_foreign from $table_foreign
            $conx=db_connect($host,$user,$pswd,$bd);
            // GET FOREIGN CONSTRAINT OF THE TABLE
            //$query="select  column_name as \'foreign key\', concat(referenced_table_name, \'.\', referenced_column_name) as \'references\' from information_schema.key_column_usage where referenced_table_name is not null and table_schema = \'".$bd."\' and table_name = \'".$table."\' ";
            $query="SELECT ".$table_foreign.".".$name_foreign." FROM ".$table_foreign;
//            print $query;
            $tabQuery2=db_query($conx,$query);
            mysqli_close($conx);
            //  if ($tabQuery2!=null)
            foreach ($tabQuery2 as $zzkey => $zzvalue) {
                foreach ($tabQuery2[$zzkey] as $zzzkey => $zzzvalue) {
                  $tempret2=$tempret2."<option value=\"".$zzzkey."\">".$zzzvalue."</option>";
                }
            }
            $doQuery=0;
          }
        }
        if ($tempret2=='') {
          // Display input if original multi
          $ret=$ret.$tempret;

        }
        else {
          $ret=$ret.$nameSelect.$starttemp.$tempret2.$endtemp;

        }
      }
      $ret=$ret."</div></div></li>";


}
///////////// CAAAREFULLL NEED TO BE UNCOMMENT print $ret
//print "Row(s): ".$nblinedisplay;
print $ret;
?>
