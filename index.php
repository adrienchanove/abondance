<?php 

//#########__INIT PHP__#########

session_start(); //création de la session php (c'est basiquement un cookie)

//$_SESSION est un tableau contenant les infos de la session php



//   ###__MODEL__##
//Le modèle contient la logique de l'application
require('model/model.php');//require de la connexion à la Base De Donnée



// ##__TRAITEMENT__##






//    ###__VUE__##
//Les vues affichent à l'utilisateur des informations sur le modèle

if(isset($_GET) && isset($_GET['p'])){
	//choix de la vue en fonction de la variable $_GET['p'] qui correspond à la page requété.
	

	switch ($_GET['p']) {

	case 'nom':

		if (isset($_GET['id']) && !empty($_GET['id'])) {
			$_SESSION['user_id'] = $_GET['id'];
			header('Location: .?p=mode');
			die();
		}else{
			$users = getAllUser();
			require('vue/loginVue.php');
		}

		break;



	case 'mode':

		if (isset($_GET['choix']) && !empty($_GET['choix'])) {
			$_SESSION['mode'] = $_GET['mode'];
			header('Location: .?p=category');
			die();
		}else{
			$user = getUserById($_SESSION['user_id']);
			require('vue/modeVue.php');
		}

		break;




	case 'category':

		$categorys = getAllCategory();
		require('vue/categoryVue.php');
		
		break;
		



	case 'object':
		$object = getObjectByCategory($_GET['id_cat']);
		require('vue/objectVue.php');
		
		break;


	
		
	
	default:
		# code...
		break;
	}

}else{
	header('Location: .?p=nom');
	die();
}




