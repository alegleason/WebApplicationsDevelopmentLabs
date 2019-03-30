 function cambiarEstilo(){
 	document.getElementById("myP").style.fontStyle = "italic";
}

setTimeout(activateJS, 2000);

function activateJS() {
	alert("Recuerda tener activado JavaScript para un correcto funcionamiento de las features del sitio.");
}

function allowDrop(ev) {
  ev.preventDefault();
}

function drag(ev) {
  ev.dataTransfer.setData("text", ev.target.id);
}

function drop(ev) {
  ev.preventDefault(); /*To allow a drop, we must prevent the default handling of the element.*/
  var data = ev.dataTransfer.getData("text");
  ev.target.appendChild(document.getElementById(data));
  alert("¡Arrastraste el logo correctamente!");
}

function addDatos(){//Es del laboratorio pasado, pero re utilicé la forma y añadi features
	var nombre = document.getElementById("name").value;
	var apellido = document.getElementById("lastname").value;
	var direccion = document.getElementById("address").value;
	var file = document.getElementById("file").value;
	var email = document.getElementById("email").value;
	var telefono = document.getElementById("phone").value;
	var text = "<br>" + "Revisa tus datos" + "<br>" + "Nombre: " + nombre + "<br>" + " Apellido: " + apellido + "<br>"
	+ " Dirección: " + direccion + "<br>" + " Email: " + email + "<br>" + " Teléfono: " + telefono;
	document.getElementById("res").innerHTML = text;

	if(nombre==""||!nombre.match(/[a-z]/)){
		document.getElementById("nameWrong").innerHTML="** Favor de poner tu nombre";
		return false;
	}

	if(apellido==""||!apellido.match(/[a-z]/)){
		document.getElementById("lastnameWrong").innerHTML="** Favor de poner tu apellido";
		return false;
	}

	if(file==""){
		document.getElementById("fileWrong").innerHTML="** Favor de adjuntar un archivo";
		return false;
	}

	if(direccion==""){
		document.getElementById("addressWrong").innerHTML="** Favor de poner tu dirección";
		return false;
	}

	if(email==""){
		document.getElementById("emailWrong").innerHTML="** Favor de poner tu email";
		return false;
	}

	if(telefono==""){
		document.getElementById("phoneWrong").innerHTML="** Favor de poner tu teléfono";
		return false;
	}

	if(telefono.length != 10){
		document.getElementById("phoneWrong").innerHTML="** El teléfono debe tener 10 dígitos, no ingresar letras";
		return false;
	}
}

function dataPhone(){
	alert("Escribe tu teléfono a 10 dígitos");
}

function dataMail(){
	alert("Aceptamos cualquier dominio para correo");
}

function dataFile(){
	alert("Aceptamos cualquier formato de archivo");
}