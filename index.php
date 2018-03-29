<!--///////////////////////////////////////////////////////////
Acces BD - requetes mysql
-->
<!DOCTYPE html>
    <html>
        <head>
            <?php include 'includes/header.html' ?> <!--Ajout du Header-->
            <title>SQL FANCY QUERY</title>
            <script src="js/ajaxphp.js"></script>
        </head>
        <body>
            <!--TITLE-->
            <h1 class="boxHead container text-center ">SQL FANCY QUERY</h1>

            <?php include 'includes/modal.html' ?> <!--Ajout des modals-->

            <div class="container page_cont">
                        <!-- bouton modal connect -->
                        <div class="text-center"><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#ConnectModal">Connect to ur base</button></div>
                        <!-- bouton modal create -->
                        <div class="text-center"><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#AddModal" onclick="choice_table()">Add 2 Table</button></div>
                        <!--SEARCH-->
                        <div id="url" class="input-group mb-3">
                            <input id="urlLink" type="text" class="form-control" placeholder="Your Query MYSQL" name="search" >
                            <div class="input-group-append">
                            <button id="search" type="button" class="btn btn-dark" onclick=from_clt(this.id)>SEARCH</button>
                        </div>
            </div>

           <!--//DISPLAY-->
           <div id="chemin" class='col-12'></div>
                    <ul id="ul0" class="list-group text-center"></ul>

            </div>-->


            <?php include 'includes/base_js.html' ?> <!--Ajout du Footer-->
        </body>
    </html>
