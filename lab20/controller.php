<?php
require_once('util.php');
if(isset($_GET['pattern'])){
  $result=getTechs();
  $words=array();
  $pattern=strtolower($_GET['pattern']);

  if(mysqli_num_rows($result)>0){
    //Load
    while($row = mysqli_fetch_assoc($result)){
      array_push($words,$row["techs"]);
    }
  }else{
    echo 'No hay tecnología con ese nombre.';
  }

  $response="";
  $size=0;
  for($i=0; $i<count($words); $i++)
  {
     $pos=stripos(strtolower($words[$i]),$pattern);
     if(!($pos===false))
     {
       $size++;
       $word=$words[$i];
       $response.="<option value=\"$word\">$word</option>";
     }
  }
  if($size>0)
    echo "<select id=\"list\" size=$size onclick=\"selectValue()\">$response</select>";
}

if(isset($_GET['numDebt'])){
  $response="";
  $size=0;
  $debt=$_GET['numDebt'];
  if($debt != ""){
    $cl = getDebt($debt);
    $size = mysqli_num_rows($cl);
    if($size > 0){
      while($client = mysqli_fetch_assoc($cl)){
         $response.="<option value='".$client['Id']."'>".$client['Nombre']." ".$client['Apellido']." $".$client['Deuda']."</option>";
      }
      echo "<select id='list' size=".$size." onclick='selectValue2()'>".$response."</select>";
    }
  }
}

?>
