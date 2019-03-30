<?php
require_once('util.php');

$result=getTechs();
$words=array();
$pattern=strtolower($_GET['pattern']);

if(mysqli_num_rows($result)>0){
	//Load
	while($row = mysqli_fetch_assoc($result)){
		array_push($words,$row["techs"]);
	}
}else{2
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
?>
