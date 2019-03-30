<?php
  session_start();
  
  function connectDB() {
    $servername = "localhost";
    $username = "elcapi0998";
    $password = "";
    $dbname = "rbac";

    $con = mysqli_connect($servername, $username, $password, $dbname);

    // Check fann_get_total_connection
    if(!$con) {
      die("Connection failed: ".mysqli_connect_error());
    }

    return $con;
  }

  function closeDB($con) {
    mysqli_close($con);
  }

  function checkMatch($usuario, $passwd){
    $db = connectDB();
     
    $query = "SELECT * FROM usuario WHERE Id_Usuario = '$usuario' AND Contrasena = '$passwd'";    
    $res = mysqli_query($db, $query);
    $row = mysqli_fetch_assoc($res);
     
    if(mysqli_num_rows($res) > 0){//If there are actually results
      $res = true;
    }else{
      $res = false;
    }
    
    closeDB($db);
    
    return $res;
  }
  
  function getName($id){
    $db = connectDB();
     
    $query = "SELECT Nombre FROM usuario WHERE Id_Usuario='".$id."'";//Check whether if the user exists
    $res = mysqli_query($db, $query);
    $row = mysqli_fetch_assoc($res);
     
    closeDB($db);
    
    return $row['Nombre'];
  }
  
  function obtainRole($idusuario) {
    $db = connectDB();
    
    $query = "SELECT Id_Rol FROM roles_usuario WHERE Id_Usuario='".$idusuario."'";
    $role = mysqli_query($db, $query);
    $roleid = mysqli_fetch_assoc($role);
    
    closeDB($db);
    
    return $roleid['Id_Rol'];
  }
  
  function obtainUserInfo($userid) {
    $_SESSION['nombre'] = getName($userid);
    $_SESSION['rol'] = obtainRole($userid);
  }
  
  function allowed($privilege) {
    $db = connectDB();
    
    $query = "SELECT * FROM roles_privilegios WHERE Id_Rol='".$_SESSION['rol']."' AND Id_Privilegio='".$privilege."'";
    $results = mysqli_query($db, $query);
    if(mysqli_num_rows($results) > 0) {
      $res = true;
    }
    else {
      $res = false;
    }
    closeDB($db);

    return $res;
  }
  
 ?>