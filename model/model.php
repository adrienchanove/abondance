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

function getSubCategory(){
	global $bdd;
	$req = $bdd->query('SELECT * FROM category WHERE idParent IS NOT NULL');
	return $req;
}

function setSubCategory($nom, $idParent){
	global $bdd;
	$req = $bdd->query("INSERT INTO category (nom, idparent) VALUES ('$nom',$idParent)");
}

function getSubCategoryWParent(){
	global $bdd;
	$req = $bdd->query('SELECT cc.id id, cc.nom nom, cp.nom nomParent FROM category cc JOIN category cp on cc.idparent = cp.id WHERE cc.idParent IS NOT NULL');
	return $req;
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

function setObject($nom, $parent, $marque, $model, $nombre, $cout){
	global $bdd;
	$requette ="INSERT INTO `object`( `idcategory`, `nom`, `marque`, `model`, `cout`, `nombre`) VALUES ($parent,'$nom','$marque','$model',$cout,$nombre)";
	//echo $requette;
	$req = $bdd->query($requette);
}



// FLUX
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


function getFlux(){//recuperation des log de flux.
	global $bdd;

	$req = $bdd->query("SELECT f.id, f.date, f.mode, u.nom, o.nom 'nomObjet', o.marque, o.model, o.cout, f.nombre FROM `flux` f JOIN user u ON u.id = f.idpers JOIN object o ON o.id = f.idobject ORDER BY f.id DESC");
	$liste=[];
	while($data = $req->fetch()){
		$liste[] = $data;
	}
	return $liste;
}

function valueStock(){

	global $bdd;

	$req = $bdd->query("SELECT SUM(cout*nombre) AS total FROM object WHERE nombre != 0");
	$value=0;
	while($data = $req->fetch()){
		$value += $data['total'];
	}
	return $value;
}

function fluxDiff($day){
	if($day < 1){
		return 0;
	}
	global $bdd;

	$req = $bdd->query("SELECT * FROM `flux` WHERE DATEDIFF(DATE(NOW()), date) <= $day");
	$liste=[];
	while($data = $req->fetch()){
		$liste[] = $data;
	}
	return $liste;
}

function getNbFluxUser($mode = NULL){

	if ($mode === NULL) {
		$where = '';
	}else{
		$where = " WHERE flux.mode = '$mode'";
	}
	global $bdd;

	$req = $bdd->query("SELECT USER.nom FROM `flux` JOIN USER ON USER.id = flux.idpers".$where);
	$liste=[];
	while($data = $req->fetch()){
		$liste[] = $data;
	}
	return $liste;
}
















function adaptater($input, $labelCommun){
	$output = [];
	foreach ($input as $value) {
		$temoin = false;
		foreach ($output as $key => $value2) {
			if ($value[$labelCommun] == $value2[$labelCommun]) {
				$output[$key]['nombre'] = $output[$key]['nombre']+1;
				$temoin = true;
			}
		}
		if (!$temoin) {
			$output[] = array($labelCommun => $value[$labelCommun],'nombre' => 1 );
		}
	}
	$output2 = [];
	foreach ($output as  $value) {
		$output2['label'][]  = $value[$labelCommun];
		$output2['nombre'][] = $value['nombre'];
	}
	return $output2;
}