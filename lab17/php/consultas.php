<?php
    session_start();
    require_once 'util.php';
    
    if(isset($_SESSION["usuario"])) {
        include '../html/_header.html';
        include '../html/consultas.html';
        include '../html/_footer.html';
    } else {
        header("Location: inicio.php");
    }
    
?>