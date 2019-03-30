 <?php include("plantillas/_header.html"); ?>
<br>
<?php include("plantillas/_preguntas.html"); ?>
	<section id="ejercicios">
		<div class="row">
			<form class="col l12" method="POST" action="registros.php" id="forma">
				<div class="row">
					<div class="input-field col s12">
						<label for="title" class="control-label">Nombre de Usuario</label>
						<input type="text" name="name" class="form-control" id="name" autocomplete="name" reqsuired>
					</div>
					<div class="input-field col s12">
						<label for="title" class="col-sm-6 control-label">Contraseña</label>
						<input type="password" name="password" class="form-control" id="password" required autocomplete="off">
					</div>
					<p>Usuario: alegleason </p>
					<p>Contraseña: 1234 </p>
					<button type="submit" class="btn btn-primary">Registrarse</button>
				</div>
			</form>
		</div>
	</section>
</div>
<br>
<?php include("plantillas/_footer.html"); ?>
