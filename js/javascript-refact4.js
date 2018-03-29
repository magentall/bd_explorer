/*
//////////////////////////////////////////////////////////////////////////////////////////////
W effectué : simplification des fonctions une seule fonction ajax pour afficher le contenu URL
Changement du système d'écoute des clicks (pas de setINterval, passsage URL)
Ajout de commentaires
*/
//Mise à jour URL pour le bouton up retourne URL
function majChemin(path){
    var idx = path.lastIndexOf('/');
    path = path.substring(0, idx);

    if (!path) {
      path='/';
    }
    return path;
}
//Test dossier valid si children exist sinon affichage /home
// EVOLUTION POSSIBLE AVEC retour sur URL courante
function test_dossier_valid(){
    if( $("#ul0").children().length <= 0) {
        alert("Dossier Invalide");
        homepath = '/home';
        ajax_aff(homepath);
    }
}
//Fonction pour afficher le contenu du dossier avec test pour connaitre origine avec id
function from_clt(id){
  if (id!="..") {
    var id_click = "#"+id;
    var url =  $(id_click).attr('name');
    if(id == 'up' ){
        url = majChemin(url);// MAJ URL pour bouton retour
    }
  if (id=='search') {
    var url = $('#urlLink').val(); //récupération du contenu de placeholder de SEARCH
  }
    ajax_aff(url); //Affichage du dossier URL
  }
}
//Fonction de lancement du traitement ajax pour l'affichage du contenu
function ajax_aff(chemin_pass){
  if (chemin_pass==null){
    chemin_pass = '/home'; // Pour l'initialisation A CHANGER SI DEPART DIFFERENT
  }
  else {
    chemin_pass = chemin_pass;
  }
  $('#chemin').html(chemin_pass);
  $.ajax({ url: 'html/check4.php',
      data: {chemin: chemin_pass},
      type: 'post',
      success: function(output) {
          $('ul').html(output);
          test_dossier_valid();
      }
  });
}
//APPLI START
$(document).ready(function(){
  ajax_aff(); // Initialisation affichage du contenu répertoire
});



// popup
// Get the modal
/*function popup(){
var popup = document.getElementById('popup');

    var popupImg = "images/forbidden.png";


    // Get the <span> element that closes the modal
    var span = document.getElementsByClassName("close")[0];
    forbidden();
    function forbidden(){
        popup.style.display = "block";
        popupImg.src = this.src;
        captionText.innerHTML = this.alt;
    }
    // When the user clicks on <span> (x), close the modal
    span.onclick = function() {
        popup.style.display = "none";
    }
}
popup();
*/
