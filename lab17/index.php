<?php
    session_start();

    if(isset($_SESSION["usuario"])) {
        header("Location: php/panelControl.php");
    } else {
        header("Location: php/inicio.php");
    }
?>