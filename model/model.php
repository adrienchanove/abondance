<?php
try
{
    $bdd = new PDO('mysql:host=localhost;dbname=stockage;charset=utf8', 'root', '');
}
catch(Exception $e)
{
    die('Erreur : '.$e->getMessage());
}



function getAllUser()
{
	global $bdd;
	$req = $bdd->query('SELECT * FROM user');
	return $req;
}

function getUserById($id)
{
	global $bdd;
	$req = $bdd->query('SELECT * FROM user where id = '.$id);
	return $req;
}



function getAllCategory()
{
	global $bdd;
	$req = $bdd->query('SELECT * FROM category');
	return $req;
}



function getObjectByCategory($category)
{
	global $bdd;
	$req = $bdd->query('SELECT * FROM object where idcategory = '.$category);
	return $req;
}

