<?php
    session_start();
    require_once 'util.php';
    
    if(isset($_SESSION["usuario"]) && allowed('RealizarSubconsultas')) {
        include '../html/_header.html';
        include '../html/subconsultas.html';
        include '../html/_footer.html';
    } else {
        header("Location: panelControl.php");
    }
    
?>