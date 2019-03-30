function validarClaves(){
	var a = document.getElementById("passwords").value;//DOM
	var b = document.getElementById("passwordss").value;

	if(a==""){
		document.getElementById("messages").innerHTML="** Favor de llenar el campo";
		return false;
	}

	if(a.length < 5){
		document.getElementById("messages").innerHTML="** El tamaño de la clave debe ser mayor a 5 caracteres";
		return false;
	}

	if(a.length > 25){
		document.getElementById("messages").innerHTML="** El tamaño de la clave debe ser menor a 25 caracteres";
		return false;
	}

	if(a!=b){
		document.getElementById("messages").innerHTML="** Las contraseñas no coinciden";
		return false;
	}
}

function addProductos(){
	var slcr = document.getElementById("slcr").value;
	var frankie = document.getElementById("frankie").value;
	var slc = document.getElementById("slc").value;
	var slcr_total = 1200*slcr;
	var frankie_total = 1300*frankie;
	var slc_total = 1400*slc;
	var total = slc_total + slcr_total + frankie_total;
	var iva = total*.16;
	var texto = "Tu total es de: $" + total + ", del cual el IVA (ya incluido) es de: $" + iva;
	document.getElementById("total").innerHTML=texto;
	if ((frankie+slcr+slc) > 2) {
		document.getElementById("promo").innerHTML="¡Te enviaremos una mochila gratis en tu compra!";
	}
}

function addDatos(){
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