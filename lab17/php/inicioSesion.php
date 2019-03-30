<?php 
    session_start();
    require_once("util.php");
    
    include '../html/_header.html';
    $error = "";
    //Starting the session
    if ($_SERVER['REQUEST_METHOD'] == 'POST') {
        if(isset($_POST['usuario']) && isset($_POST['contrasena'])) {
            $usuario = htmlspecialchars($_POST["usuario"]);
            $pwd = htmlspecialchars($_POST["contrasena"]);
            if(checkMatch($usuario,$pwd)){//Correct credentials
                $_SESSION["usuario"] = $_POST["usuario"];//assigning the name recieved from the POST variable
                obtainUserInfo($_SESSION['usuario']);
                header("Location: panelControl.php");
            } else {
                $error = "Usuario: ".$usuario." Contraseña: ".$pwd;
                //$error = "<p class='red lighten-2'>Usuario y/o contraseña incorrectos</p>";
                include '../html/inicioSesion.html';
            }
        }
        else {
            include '../html/inicioSesion.html'; 
        }
    }
    else {
        include '../html/inicioSesion.html';
    }
    include '../html/_footer.html';
?>
