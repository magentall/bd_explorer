var host;//='localhost';
var user;//='viz';
var password;//='viz';
var database;//='bd_cv';

$(document).ready(function(){
  ajax_query_aff(); // Initialisation affichage du contenu répertoire
});

function from_clt(id){
  if (id=='search') {
    var url = $('#urlLink').val(); //récupération du contenu de placeholder de SEARCH
  }
    ajax_query_aff(url); //Affichage du dossier URL
  }

function bd_log(){
  host=$('#host').val();
  user=$('#user').val();
  password=$('#pswd').val();
  database=$('#bd').val();
  $('ul').html("<div class=\"input-group-text\">Login Enable</div>");
  //alert("Log'in updated");
}

function ajax_query_aff(sqlquery){
    $.ajax({ url: 'php/sqlquery.php',
        data: {query:sqlquery,host:host,user:user,password:password,database:database},
        type: 'post',
        success: function(output) {
            $('ul').html(output);
        }
    });
}

function ajax_query_tab(sqlquery){
    $.ajax({ url: 'php/sqlquery_tab.php',
        data: {query:sqlquery,host:host,user:user,password:password,database:database},
        type: 'post',
        success: function(response) {
            var tabquery = JSON.parse(response);
            //alert(tabquery);
            aff_modal_table(tabquery);
        }
    });
}

function choice_table(){
  sqlquery='show tables';
  ajax_query_tab(sqlquery);
}


function aff_modal_table(tab){
  var options = "<option selected>Choose Table</option>";
  for (var vtab in tab) {
    //alert(tab[vtab]);

    for (var vtabb in tab[vtab]) {
      //alert(tab[vtab][vtabb]);
      options=options+"<option value=\""+tab[vtab][vtabb]+"\">"+tab[vtab][vtabb]+"</option>";

    }
  }
  $('#sel_table').html(options);
  $('#mod_table_add').html(" ");
}

function load_add_table(){
  var table=$('#sel_table option:selected').text();
  var query_show_col="SHOW COLUMNS FROM "+table;
  //$('#mod_table_add').html(query_show_col);
  ajax_query_aff_add(query_show_col,table);
}

function ajax_query_aff_add(sqlquery,table){
      $.ajax({ url: 'php/sqlquery_add.php',
        data: {table:table,query:sqlquery,host:host,user:user,password:password,database:database},
        type: 'post',
        success: function(output) {
            $('#mod_table_add').html(output);
        }
    });
}

function ajax_addtable(tab_data,tab_data2,table){
      $.ajax({ url: 'php/sqlquery_addTable.php',
        data: {table:table,tab_data:tab_data,tab_data2:tab_data2,host:host,user:user,password:password,database:database},
        type: 'post',
        success: function(output) {
            $('ul').html(output);
        }
    });
}

function add2Table(){
  // GET INFORMATION TO ADD
  var table=$('#sel_table option:selected').text();
  var quit=1000;//limit of 1000 entries
  var tab_data = [];
  var tab_data2 = [];
  for (var i = 0; i < quit; i++) {
    var idtemp="#addtable"+i;
    //alert(idtemp);

    if($(idtemp).attr('name')=='ok'){
      var data=$(idtemp).val();
      var data2=$(idtemp).attr('title');
      //alert("1firstdata"+data);
      //alert("2firstdata"+data2);
      //alert($(idtemp).attr('itemprop'));
      if($(idtemp).attr('itemprop')=='auto_increment'){
        // NO TREATMENT
      }
      else {
        if (data2==null) {
          var multi=idtemp+" option:selected";
          data=$(multi).text();
          data2=$(multi).attr('value');
        }
//          alert("2 "+data2);
//          alert("1 "+data);
          if (data=="") {
            alert("Fil the gap");
            break;
          }
          tab_data.push(data2);
          tab_data2.push(data);
      }
    }
    else {
      quit=i;
    }
  }
  ajax_addtable(tab_data,tab_data2,table);
}
