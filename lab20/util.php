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

   close($conn); 

   return $result;
}

function getDebt($debt){

   $conn = connect();

   $sql = "SELECT * FROM clients WHERE Deuda >= ".$debt." ORDER BY Deuda ASC";

   $result = mysqli_query($conn, $sql);

   close($conn); 

   return $result;
}

?>
