<?php
    require_once("util.php");
    //Preventing attacks
    $name = htmlspecialchars($_POST["nombre"]);
    $units = htmlspecialchars($_POST["unidades"]);
    $quantity = htmlspecialchars($_POST["cantidad"]);
    $price = htmlspecialchars($_POST["precio"]);
    $country = htmlspecialchars($_POST["pais"]);
    if (isset($_POST["nombre"]) && isset($_POST["unidades"]) && isset($_POST["cantidad"]) && isset($_POST["precio"]) && isset($_POST["pais"])) {
         //validación de datos del lado del servidor
        if(strlen($name) > 0 && strlen($country) > 0){
            if(is_numeric($quantity) && is_numeric($price) && is_numeric($units)){
                //validacion de informacion insertada correctamente
                insertFruit($name, $units, $quantity, $price, $country);
                echo '<script language="javascript">';
                echo 'alert("Se agregó la nueva fruta correctamente.")';
                echo '</script>';
                header('Location: '.$_SERVER['HTTP_REFERER']);
            }else{
                echo '<script language="javascript">';
                echo 'alert("Ingresaste datos no numéricos en precio y/o cantidad.")';
                echo '</script>';
            }
        }
    }
    include("partials/_footer.html");    
?>
