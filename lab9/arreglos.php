<?php include("plantillas/header.html");
//function for avg
function promedio($arr){
    $sum = 0;
    $res = 0;
    foreach($arr as $valor){
        $sum += $valor;
    }
    $res = $sum/count($arr);
    return $res;
}
?>

<h2>Arreglos</h2>
<?php
if (isset($_POST["submit"])) {
    $arr = array();//Declaring the array
    for($i = 0; $i < 5; $i++){//filling the array
        $j = $i + 1;
        array_push($arr,$_POST["num"."$j"]);//concatenating num+the correspondant number
    }

    switch($_POST["problem"]){
        case "ex1":
        echo "<h4>Problema 1</h4>";
        echo "El promedio del arreglo es ".promedio($arr)."<br>";
        break;
        case "ex2":
        echo "<h4>Problema 2</h4>";
        sort($arr);
        $size = sizeof($arr);
        $med = ceil($size/2);
        echo "La mediana es: ".($arr[$med-1]). "<br>";
        break;
        case "ex3":
        echo "<h4>Problema 3</h4>";
        $size = sizeof($arr);
        $sum = 0;
        echo "Lista de números: ";
        echo "<dl>";
        for($i = 0;$i < $size;$i++){
            $sum += $arr[$i];
            echo "<li>";
            echo "".$arr[$i]."</li>";
        }
        sort($arr);
        $med = ceil($size/2);

        echo "</dl>";

        echo "<ol>";

        echo "<li>";
        echo "El promedio es: ".($sum)/$size;
        echo "</li>";

        echo "<li>";
        echo "La media es: ".($arr[$med-1]);
        echo "</li>";

        echo "<li>";
        echo "El arreglo ordenado de menor a mayor es: ";
        for($i=0;$i < $size;$i++){
            echo "$arr[$i] ";
        }
        echo "</li>";

        echo "<li>";
        rsort($arr);
        echo "El arreglo ordenado de mayor a menor es: ";
        for($i=0;$i < $size;$i++){
            echo "$arr[$i] ";
        }
        echo "</li>";

        echo "</ol>";
        
        echo "<br>";
        break;
        default:
        break;
    }
}   
?>
<a href="index.php">Volver al index</a>
<?php include("plantillas/footer.html"); ?> 
