function ejercicio1(){
	let num = prompt('Dame el número');
	//alert('Bienvenido! Tu numero es ' + num);
	document.write('Ejercicio1' + '<br>');

	let table = '';
	let rows = num;
	let cols = 2;
	table += '<tr>';
	table += '<th>' + 'Número' + '</th>';
	table += '<th>' + 'Al Cuadrado' + '</th>';
	table += '<th>' + 'Al Cubo' + '</th>';
	table += '</tr>';

	for(let r = 1; r <= rows; r++){
		table += '<tr>';
		table += '<th>' + r + '</th>';
		table += '<td align = center>' + r*r + '</td>';
		table += '<td align = center>' + r*r*r + '</td>';
		table += '</tr>';
	}
	document.write('<table border = 2>' + table + '</table>' + '<br>');
	document.write('<a href="index.html">Regresar al index</a>');
}

function ejercicio2(){
	let num1 = Math.floor(Math.random()*10) + 1;
	let num2 = Math.floor(Math.random()*10) + 1;
	let s = new Date();//empieza a contar milisegundos
	let res = prompt('¿Cuánto es la suma de ' + num1 + '+' + num2);
	let e = new Date();
	let time = e - s;
	if (res == (num1+num2)){
		alert('Respuesta correcta! Tardaste ' +  time + ' milisegundos');
	}else{
		alert('Respuesta incorrecta! Tardaste ' + time + ' milisegundos');
	}
}

function ejercicio3(){
	let size = prompt('Dame el tamaño del arreglo');
	let array = [];
	for(let i = 0; i < size; i++){
		let aux = prompt('Ingresa el número ' + (i+1));
		array.push(aux);
	}
	let zeros = 0;
	let pos = 0;
	let neg = 0;
	for(let i = 0; i < size; i++){
		if (Number(array[i]) < 0) {
			neg += 1;
		} else if(Number(array[i]) == 0) {
			zeros+=1;
		} else{
			pos+=1;
		}
	}
	alert('La cantidad de ceros en el arreglo es de ' + zeros + ' la cantidad de positivos es ' + pos + ' y la cantidad de negativos es ' + neg);
}

function ejercicio4(){
    document.write('Ejercicio4' + '<br>');
    let rows = prompt('¿Cuántos renglones tiene la matriz?');
	let cols = prompt('¿Cuántas columnas tiene la matriz?');
    let cnt = 0;
    for(let i = 0;i < rows;i++){
        for(let j = 0;j < cols;j++){
            let aux = prompt('Dame el número ' + (j+1) + ' del renglón ' + (i+1));
            cnt += Number(aux);
        }
        document.write('El promedio del renglón ' + (i+1) + ' es ' + ((cnt/cols).toFixed(2))+ '<br>');
        aux = 0;
        sum = 0;
    }
    document.write('<a href="index.html">Regresar al index</a>');
}

function ejercicio5(){
	let num = prompt('Dame el número a invertir');
	let auxNum = num;
	let rev = 0;
	let mod;
	while(num != 0){
		mod = num%10;
		rev = rev*10+mod;
		num = Math.floor(num/10);
	}
	if(auxNum%10 == 0){
		alert('El número invertido es: 0' + rev);//Caso para cuando el num acaba en 0
	}else{
		alert('El número invertido es: ' + rev);
	}	
}

function ejercicio6(){//Objects are special types of data that have their own methods
	var usu = prompt('¿Cuántos participantes hay?');
	var pr1 = prompt('¿Cuál es el premio 1?');
	var pr2 = prompt('¿Cuál es el premio 2?');
	var pr3 = prompt('¿Cuál es el premio 3?');
	var rul1 = new ruleta(usu,pr1,pr2,pr3);
	//document.write(rul1.getGanador());
	for(var j = 0; j < 3; j++){
		document.write('El ganador número ' + (j+1) + ' es quien tiene el folio número ' + rul1.getGanador() + ' y se lleva ' + rul1.getPremio() + '<br>');
	}
}

function ruleta(usuarios, premio1, premio2, premio3){
	this.usuarios = usuarios;
	this.premio1 = premio1;
	this.premio2 = premio2;
	this.premio3 = premio3;
	//metodos
	this.getGanador = getGanador;
	this.getPremio = getPremio;
}

function getGanador(){
	var ganador = Math.floor(Math.random()*this.usuarios) + 1;
	return ganador;
}

function getPremio(){
	var premio = Math.floor(Math.random()*3) + 1;
	if(premio == 1){
		return this.premio1;
	}else if (premio == 2){
		return this.premio2;
	}else{
		return this.premio3;
	}
}