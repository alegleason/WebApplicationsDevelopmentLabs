<?php
    require_once("util.php");
    $_POST["nombre"] = htmlspecialchars($_POST["nombre"]);
    if (isset($_POST["nombre"])) {
        getFruitsByName($_POST["nombre"]);
    } else {
        getFruitsByName();
    } 
    include("partials/_footer.html");    
?>