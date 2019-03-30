<?php
function connect() {
        $conexion = mysqli_connect("localhost","root","","fruit");//servername, username, password, db
        if ($conexion == NULL) {
          die("500: Internal Server Error");
        }
        $conexion->set_charset("utf8");
        return $conexion;
      }

      function close($conexion) {
        mysqli_close($conexion);
      }

      function getFruits(){
       $conn = connect();

       $sql = "SELECT name, units, quantity, price, country FROM fruit";

       $result = mysqli_query($conn, $sql);

       echo '<div class = "container">';

      if(mysqli_num_rows($result) > 0){//If there are actually results
       echo '<div class="row"><div class="col m12 medium-table"><table class="centered"><thead>';
       echo '<blockquote><h4>Todas las frutas disponibles</h4></blockquote>';
       echo '<tr><th>Fruta</th><th>Unidad(es)</th><th>Cantidad</th><th>Precio</th><th>País</th></tr></thead><tbody>';
        //output de cada fila
       while($row = mysqli_fetch_assoc($result)){
        echo '<tr>';
        echo '<td>'. $row["name"] . '</td>';
        echo '<td>' . $row["units"] . '</td>';
        echo '<td>' . $row["quantity"] . '</td>';
        echo '<td>'. $row["price"] . '</td>';
        echo '<td>' . $row["country"] . '</td>';
        echo '</tr>';
      }
    }

    echo '</tbody></table></div></div></div>';    
    // it releases the associated results
    mysqli_free_result($result);

    close($conn);

    return $result;
  }

  function getFruitsByName($fruit_name){
   $conn = connect();

   $sql = "SELECT name, units, quantity, price, country FROM fruit WHERE name LIKE '%".$fruit_name."%'";

   $result = mysqli_query($conn, $sql);

        if(mysqli_num_rows($result) > 0){//If there are actually results
         echo '<div class="row"><div class="col m12 medium-table"><table class="centered"><thead>';
         echo '<h4>Las frutas que coinciden con tu búsqueda son:</h4>';
         echo '<tr><th>Fruta</th><th>Unidad(es)</th><th>Cantidad</th><th>Precio</th><th>País</th></tr></thead><tbody>';
        //output de cada fila
         while($row = mysqli_fetch_assoc($result)){
          echo '<tr>';
          echo '<td>'. $row["name"] . '</td>';
          echo '<td>' . $row["units"] . '</td>';
          echo '<td>' . $row["quantity"] . '</td>';
          echo '<td>'. $row["price"] . '</td>';
          echo '<td>' . $row["country"] . '</td>';
          echo '</tr>';
        }
      }else{
        echo '<h4>No hay ninguna fruta que coincida con tu búsqueda.</h4>';
      }

      echo '</tbody></table></div></div>';    
    // it releases the associated results
      mysqli_free_result($result);

      close($conn);

      return $result;
    }

    function CheapestFruits($cheap_price){
     $conn = connect();

     $sql = "SELECT name, units, quantity, price, country FROM fruit WHERE price <= '".$cheap_price."'";

     $result = mysqli_query($conn, $sql);

   if(mysqli_num_rows($result) > 0){//If there are actually results
     echo '<div class="row"><div class="col m12 medium-table"><table class="centered"><thead>';
     echo '<h4>Las frutas que coinciden con tu búsqueda son:</h4>';
     echo '<tr><th>Fruta</th><th>Unidad(es)</th><th>Cantidad</th><th>Precio</th><th>País</th></tr></thead><tbody>';
        //output de cada fila
     while($row = mysqli_fetch_assoc($result)){
      echo '<tr>';
      echo '<td>'. $row["name"] . '</td>';
      echo '<td>' . $row["units"] . '</td>';
      echo '<td>' . $row["quantity"] . '</td>';
      echo '<td>'. $row["price"] . '</td>';
      echo '<td>' . $row["country"] . '</td>';
      echo '</tr>';
    }
  }else{
    echo '<h4>No hay ninguna fruta que coincida con tu búsqueda.</h4>';
  }

  echo '</tbody></table></div></div>';    
    // it releases the associated results
  mysqli_free_result($result);

  close($conn);

  return $result;
}

  function insertFruit($name, $units, $quantity, $price, $country){
    $conn = connect();

    // insert command specification 
    $sql = 'INSERT INTO fruit (name, units, quantity, price, country) VALUES (?,?,?,?,?)';

     // Preparing the statement 
      if (!($statement = $conn->prepare($sql))) {
          die("Preparation failed: (" . $conn->errno . ") " . $conn->error);
      }
      //preventing SQL injection
      $name = $conn->real_escape_string($name);
      $units = $conn->real_escape_string($units);
      $quantity = $conn->real_escape_string($quantity);
      $price = $conn->real_escape_string($price);
      $country = $conn->real_escape_string($country);
        
        if (!$statement->bind_param("sssss", $name, $units, $quantity, $price, $country)) {
            die("Parameter vinculation failed: (" . $statement->errno . ") " . $statement->error); 
        }
         // Executing the statement
         if (!$statement->execute()) {
            die("Execution failed: (" . $statement->errno . ") " . $statement->error);
          } 

        close($conn);
  }

  function delete_by_name($fruit_name){
    $conn = connect();

    $fruit_name = $conn->real_escape_string($fruit_name);

    $sql = "DELETE FROM fruit WHERE name = '".$fruit_name."'";

    $result = mysqli_query($conn, $sql);

    close($conn);

    return $result;
  }

  function update_by_name($fname, $units, $quantity, $price, $country){
    $conn = connect();

    $sql = "UPDATE fruit SET units=$units, quantity=$quantity, price=$price, country=$country WHERE name='" .$fname. "'";

    $result = mysqli_query($conn, $sql);

    close($conn);

    return $result;
  }


function getFruitsName(){

   $conn = connect();

   $sql = "SELECT name FROM fruit";

   $result = mysqli_query($conn, $sql);

   return $result;

   mysqli_free_result($result);

   close($conn); 
}

?>
