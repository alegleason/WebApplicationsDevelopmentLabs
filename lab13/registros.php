<?php 
    session_start();
    //Starting the session
    if(isset($_SESSION["name"])){
        include("add.php");
    }else if(htmlspecialchars($_POST["name"]) == "alegleason" && htmlspecialchars($_POST["password"]) == "1234"){//Correct credentials
        $_SESSION["name"] = $_POST["name"];//assigning the name recieved from the POST variable
        include("add.php");
    }else if ($_POST["name"] == "" && $_POST["password"] == "" && isset($_POST["name"]) && isset($_POST["password"]) ) {//Empty fields
        include("index.php");
        echo '<script language="javascript">';
        echo 'alert("Favor de ingresar tu usuario y contraseña")';
        echo '</script>';
    } else if(isset($_POST["name"]) || isset($_POST["password"])) {//Wrong fields
        include("index.php");
        echo '<script language="javascript">';
        echo 'alert("Usuario y/o contraseña incorrectos")';
        echo '</script>';
    } else {//Ensuring visualizing the index
        include("index.php");
    }
?>

<br>
