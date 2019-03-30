<?php
    session_start(); 
    if($_SESSION["name"] == "alegleason") {       
        include("plantillas/_header.html");
        include("plantillas/_upload.html");
        include("plantillas/_footer.html");
    }
?>
