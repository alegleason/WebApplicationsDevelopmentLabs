<?php include("plantillas/header.html"); ?>
<div class="container">
	<div class="row">
		<h2 class="center">Laboratorio 9</h2>
		<div class="col s12 m8 l6">
			<section id="preguntas">
				<h4 class="center">Preguntas</h4>         
				<article>
					<h6>¿Qué hace la función phpinfo()? Describe y discute 3 datos que llamen tu atención.</h6>
					<p>Muestra gran cantidad de información sobre el estado actual de PHP. Incluye información sobre las opciones de compilación y extensiones de PHP, versión de PHP, información del servidor y entrono (si se compiló como módulo), entorno PHP, versión del OS, rutas, valor de las opciones de configuración locales y generales, cabeceras HTTP y licencia de PHP. Algunos parámetros que puede recibir y me llamaron la atención son los siguientes: </p>
					<ol>
						<li>phpinfo(1): La línea de configuración, ubicación de php.ini, fecha de compilación, servidor Web, sistema y más.</li>
						<li>phpinfo(64): Información de Licencia de PHP. </li>
						<li>phpinfo(32): Muestra todas las variables predefinidas de EGPCS (Environment, GET, POST, Cookie, Server).</li>
					</ol>
					<h6>¿Qué cambios tendrías que hacer en la configuración del servidor para que pudiera ser apto en un ambiente de producción?</h6>
					<p>Hay que activar el archivo php.ini-production, esto nos configurará el entorno de producción para PHP. Contiene ajustes que mantienen la seguridad, el rendimiento y las mejores prácticas activamente. </p>
					<h6>¿Cómo es que si el código está en un archivo con código html que se despliega del lado del cliente, se ejecuta del lado del servidor? Explica.</h6>
					<p>Porque se ejecutan archivos PHP para establecer la comunicación entre cliente-servidor, por ejemplo: Cuando pinchamos sobre un enlace hipertexto, en realidad lo que pasa es que establecemos una petición de un archivo HTML residente en el servidor (un ordenador que se encuentra continuamente conectado a la red) el cual es enviado e interpretado por nuestro navegador (el cliente).</p>
				</article>
			</section>
		</div>
	</section>
	<div class="col s12 m8 l6">
		<section id="ejercicios">
			<h5 class="center">Ex. 1</h5>
			<form action= "arreglos.php" method="POST">
				<h6 class="center">Introduce tu Arreglo</h6>
				<label for="num1">Número 1</label>
				<input type="number" name="num1" id="num1" value=0>
				<br>
				<label for="num2">Número 2</label>
				<input type="number" name="num2" id="num2" value=0>
				<br>
				<label for="num3">Número 3</label>
				<input type="number" name="num3" id="num3" value=0>
				<br>
				<label for="num4">Número 4</label>
				<input type="number" name="num4" id="num4" value=0>
				<br>
				<label for="num5">Número 5</label>
				<input type="number" name="num5" id="num5" value=0>
				<br>
				<label for="problem">Elige el ejercicio a resolver</label>
				<select name="problem" class="browser-default">
					<option value="ex1">Ejercicio 1</option>
					<option value="ex2">Ejercicio 2</option>
					<option value="ex3">Ejercicio 3</option>
				</select>
				<br>
				<input type="submit" name="submit">
			</form>
			<h6 class="center">Ex. 2</h6>
			<form action="potencias.php" method="POST">
				<h6 class="center">Cuadrados y Cubos</h6>
				<label for="pow">Número a tabular</label>
				<input type="number" value=0 name="pow" id="pow">
				<br>
				<input type="submit" name="submit">
			</form>
			</form>
			<h6 class="center">Ex. 3</h6>
			<form action="nuevo.php" method="POST">
				<h6 class="center">Inversor de números</h6>
				<label for="inv">Número a invertir</label>
				<input type="number" value=0 name="inv" id="inv">
				<br>
				<input type="submit" name="submit">
			</form>
		</section>
		</div>
	</div>
</div>
<?php include("plantillas/footer.html"); ?>
