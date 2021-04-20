<?php 

//#########__INIT PHP__#########

session_start(); //création de la session php (c'est basiquement un cookie)

//$_SESSION est un tableau contenant les infos de la session php
var_dump($_SESSION);//test de fonctionnement des cookie de php    #DEV_OPS# (<=signifie que cette ligne devra disparaitre pour les release)
//$_SESSION est un tableau contenant les infos de la session php

include('BDD.php');//include de la connexion à la Base De Donnée







//#########__HTML__#########
?>



<!DOCTYPE html>
<html>
<head>
	<title></title>
	<link rel="stylesheet" type="text/css" href="CSS/index.css">
	<meta charset="utf-8">
</head>
<body>

	<?php 
		include('form_nom.php');//include du contenu en fonction de la variable $_POST
	 ?>

</body>
</html>
