<?php include("plantillas/_header.html");

//XSS control
function XSS($name, $last_name,$email,$password,$tel){
    echo "<div class='center'><h5>Datos introducidos por PHP fueron recibidos correctamente</h5><br>";
    echo "<div class='card-panel pink lighten-4'><h6>El nombre introducido fue: </h6>";
    echo htmlspecialchars($name, ENT_QUOTES, 'UTF-8');
    echo "<br><h6>El apellido introducido fue: </h6>";
    echo htmlspecialchars($last_name, ENT_QUOTES, 'UTF-8');
    echo "<br><h6>El email introducido fue: </h6>";
    echo htmlspecialchars($email, ENT_QUOTES, 'UTF-8');
    echo "<br><h6>El teléfono introducido fue: </h6>";
    echo htmlspecialchars($tel, ENT_QUOTES, 'UTF-8');
    echo "<br><h6>La contraseña introducida fue: </h6>";
    echo htmlspecialchars($password, ENT_QUOTES, 'UTF-8');
    echo "<br></div></div>";
}

//If all data is present
if (isset($_POST['name']) && isset($_POST['last-name']) && isset($_POST['email']) && isset($_POST['password']) && isset($_POST['tel'])){
    //Retrieving data by POST, on a safe way
    $name = $_POST['name'];
    $last_name = $_POST['last-name'];
    $email = $_POST['email'];
    $tel = $_POST['tel'];
    $password = $_POST['password'];   
    XSS($name,$last_name,$email,$password,$tel);
}else{
    echo "Datos recibidos de manera incorrecta";
}
?>
<br>
<a href="index.php">Volver al index</a>
<?php include("plantillas/_footer.html"); ?> 
