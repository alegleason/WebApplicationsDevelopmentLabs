<?php
function connect() {
    $conexion = mysqli_connect("localhost","root","","db");//servername, username, password, db
    if ($conexion == NULL) {
      die("500: Internal Server Error");
    }
    $conexion->set_charset("utf8");
    return $conexion;
}

function close($conexion) {
    mysqli_close($conexion);
}

function getTechs(){

   $conn = connect();

   $sql = "SELECT techs FROM techs";

   $result = mysqli_query($conn, $sql);

   return $result;

   mysqli_free_result($result);

   close($conn); 
}

?>
