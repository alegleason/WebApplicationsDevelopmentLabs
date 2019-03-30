<?php
    require_once("util.php");
    $_POST["precio"] = htmlspecialchars($_POST["precio"]);
    if (isset($_POST["precio"])) {
        CheapestFruits($_POST["precio"]);
    } else {
        CheapestFruits();
    } 
    include("partials/_footer.html");    
?>