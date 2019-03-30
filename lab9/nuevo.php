<?php include("plantillas/header.html"); ?>
    <h2>Inversor</h2>

    <?php
        if (isset($_POST["submit"])){
            $num = $_POST["inv"];
            $rev = 0;//reverted number
            $mod = 0;
            $auxNum = $num;
            while ($num != 0) {
                $mod = $num%10;
                $rev = $rev*10+$mod;
                $num = floor($num/10);
            }
            if($auxNum%10 == 0){
                echo "El número invertido es: 0" . $rev;//Caso para cuando el num acaba en 0
            }else{
                echo "El número invertido es: " . $rev;
            }   
        }  
    ?>

    <a href="index.php">Volver al index</a>
<?php include("plantillas/footer.html"); ?> 