<?php include("plantillas/_header.html"); ?>
<div class="container">
	<div class="row">
		<h2 class="center">Laboratorio 11</h2>
		<div class="col s12 m12 l12">
			<section id="preguntas">
				<h4 class="center">Preguntas</h4>         
				<article>
					<h6>¿Por qué es una buena práctica separar el controlador de la vista?</h6>
					<p> Siempre es bueno separar la vista (presentación visual) del código que toma decisiones (controlador) ya que para el usuario, no hay necesidad de ver el controlador, más bien, es importante enfocarse en que la vista sea agradable para el usuario, y que el controlador haga lo que debe de hacer, más no lo muestre al usuario. Así aseguras independencia y mejor usabilidad.</p>
					<h6>Aparte de los arreglos $_POST y $_GET, ¿qué otros arreglos están predefinidos en php y cuál es su función?</h6>
					<p>También existe $_REQUEST, que funciona como $POST o $GET dependiendo de lo que se haya escrito en el método. Su sintaxis es ($_REQUEST['name of the form field']).</p>
					<p>También existe $_COOKIE, que es un arreglo que guarda información de las cookies, aunque no funciona de manera parecida a $_GET y $_POST, pero es notable considerarlo.</p>
					<h6>Explora las funciones de php, y describe 2 que no hayas visto en otro lenguaje y que llamen tu atención. </h6>
					<p>cos: Recibe un ángulo y regresa el coseno de este.</p>
					<p>number_format: Recibe un arreglo de números y regresa el mismo número pero con formato (comas y puntos décimales con un formeto adecuado). </p>
					<h6>¿Qué es XSS y cómo se puede prevenir?</h6>
					<p>Cross-site scripting (XSS) es un tipo de vulnerabilidad informática o agujero de seguridad típico de las aplicaciones Web, que puede permitir a una tercera persona inyectar en páginas web visitadas por el usuario código JavaScript o en otro lenguaje similar (ej: VBScript), se puede evitar usando diversas medidas. XSS es un vector de ataque que puede ser utilizado para robar información delicada, secuestrar sesiones de usuario, y comprometer el navegador, subyugando la integridad del sistema. </p>
				</article>
			</section>
		</div>
	</div>
	<section id="ejercicios">
		<div class="row">
			<form class="col s12 m12 l12" method="POST" action="registros.php" id="forma">
				<div class="row">
					<div class="input-field col s12">
						<label for="title" class="control-label">Nombre</label>
						<input type="text" name="name" class="form-control" id="name" autocomplete="name" required>
					</div>
					<div class="input-field col s12">
						<label for="title" class="col-sm-6 control-label">Apellidos</label>
						<input type="text" name="last-name" class="form-control" id="last-name" required>
					</div>
					<div class="input-field col s12">
						<label for="title" class="col-sm-6 control-label">Correo Electrónico</label>
						<input type="email" name="email" class="form-control" id="email" autocomplete="email" required>
					</div>
					<div class="input-field col s12">
						<label for="title" class="col-sm-6 control-label">Teléfono</label>
						<input type="tel" name="tel" class="form-control" id="tel"required autocomplete="off">
					</div>
					<div class="input-field col s12">
						<label for="title" class="col-sm-6 control-label">Contraseña</label>
						<input type="password" name="password" class="form-control" id="password" required autocomplete="off">
					</div>
					<button type="submit" class="btn btn-primary">Registrarse</button>
				</div>
				</form>
			</div>
		</section>
</div>
<br>
<?php include("plantillas/_footer.html"); ?>
