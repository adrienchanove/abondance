<?php

//connexion préliminaire à la base de donnée
try
{
    $bdd = new PDO('mysql:host=localhost;dbname=stockage;charset=utf8', 'root', '');
    $bdd->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
}
catch(Exception $e)
{
    die('La connexion à la base de donnée n\'as pas fonctionner, cela provient de l\'Erreur : '.$e->getMessage());
}






// UTILISATEUR
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






// CATEGORIE ET SOUS-CATEGORIE
function getRootCategory()
{
	global $bdd;
	$req = $bdd->query('SELECT * FROM category WHERE idParent IS NULL');
	return $req;
}

function getAllSubCategoryById($idParent)
{
	global $bdd;
	$req = $bdd->query('SELECT * FROM category WHERE idparent = '.$idParent);
	return $req;
}

function categoryAsChild($idParent)
{
	global $bdd;
	$req = $bdd->query('SELECT 1 FROM category WHERE idparent = '.$idParent.' LIMIT 1');
	if ($req->fetch()) {
		return true;
	}
	return false;
}




// OBJET
function getObjectByCategory($category)
{
	global $bdd;
	$req = $bdd->query('SELECT * FROM object where idcategory = '.$category);
	return $req;
}

function getAllObject()
{
	global $bdd;
	$req = $bdd->query('SELECT * FROM object ');
	return $req;
}



function newFlux($idPersonne, $panier){
	//INSERT INTO table (nom_colonne_1, nom_colonne_2, ...
	//VALUES ('valeur 1', 'valeur 2', ...)
	global $bdd;
	$panier = json_decode($panier,true);
	if ($_GET['mode'] == 'Dépôt') {
		$mode = 'D';//dépot
		$simbole = '+';
	}else{
		$mode = 'R';//retrait
		$simbole = '-';
	}

	foreach ($panier as $objet) {
		$req = $bdd->query("INSERT INTO flux VALUES (NULL,'$mode',".$objet['id'].",$idPersonne,".$objet['nbselect'].",DATE(NOW()))");

		$req2 = $bdd->query("SELECT nombre FROM object WHERE id = ".$objet['id']);

		if ($objet2 = $req2->fetch()) {
			
			
			$res = $bdd->query("UPDATE object SET nombre = ".$objet2['nombre'].$simbole.$objet['nbselect']." WHERE id = ".$objet['id'] );

		}else{
			die("une erreur est survenue lors de la mise a jour du nombre. Code erreur: #02#");
		}
		
	}

	
}