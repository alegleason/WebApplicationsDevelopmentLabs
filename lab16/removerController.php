<?php
    require_once("util.php");
    //Preventing attacks
    $name = htmlspecialchars($_POST["nombre"]);
    if (isset($_POST["nombre"])) {
         //validación de datos del lado del servidor
        if(strlen($name) > 0){
            //validacion de informacion insertada correctamente
            delete_by_name($name);
            echo '<script language="javascript">';
            echo 'alert("Se eliminó la fruta correctamente.")';
            echo '</script>';
            header('Location: '.$_SERVER['HTTP_REFERER']);
        }else{
            echo '<script language="javascript">';
            echo 'alert("La longitud del nombre es muy corta.")';
            echo '</script>';
        }
    }
    include("partials/_footer.html");    
?>
