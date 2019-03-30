<?php include("plantillas/header.html"); ?>
        <h2>Potencias</h2>
        <?php
            if (isset($_POST["submit"])){
                echo "<table><thead>";
                echo "<tr>";
                echo "<th>" . "Número" . "</th>";
                echo "<th>" . "Al Cuadrado" . "</th>";
                echo "<th>" . "Al Cubo" . "</th>";
                echo "</tr></thead>";
                for($i=1; $i<=$_POST["pow"]; $i++){
                    echo "<tr>";
                    echo "<th>" . $i . "</th>";
                    echo "<td align = center>" . ($i*$i) . "</td>";
                    echo "<td align = center>" . ($i*$i*$i) . "</td>";
                    echo "</tr>";
                }
                echo "</tbody></table>";
            }
?>
        <a href="index.php">Volver al index</a>
<?php include("plantillas/footer.html"); ?> 
