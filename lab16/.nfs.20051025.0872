<?php
    require_once ("util.php");
    //esta funcion no deberia ir en index, pero por cuestiones de practicidad se pone aquí
    $result = getFruits();

    if(mysqli_num_rows($result) > 0){//If there are actually results
         echo '<div class="row"><div class="col m12 medium-table"><table class="centered"><thead>';
        echo '<h4>Todas las frutas disponibles son:</h4>';
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

    echo '</tbody></table></div></div>';    
    // it releases the associated results
    mysqli_free_result($result);

    echo '<h4>Busca alguna fruta en especial:</h4>';

    include("partials/_buscador.html"); 

    echo '<h4>Busca aquellas frutas más económicas:</h4>';

    include("partials/_buscadorprecio.html"); 

?>

<?php ?>

<?php include("partials/_footer.html"); ?>