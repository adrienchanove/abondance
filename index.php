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
			header('Location: .?p=compilated'); //header('Location: .?p=mode');
			die();
		}else{
			$users = getAllUser();
			require('vue/loginVue.php');
		}

		break;


	case 'compilated':

		$rqte = getAllObject();
		$listeObjet = [];
		while ($data = $rqte->fetch()) {
			$listeObjet[] =$data;
		}
		$rqte->closeCursor();

		$nomPersonne=null;
		$rqte = getAllUser();
		 while ($data = $rqte->fetch()){
		 	if ($data['id'] == $_SESSION['user_id']) {
		 		$nomPersonne = $data['nom'];
		 	}
		 }
		 $rqte->closeCursor();

		$allData = [];

		$categoryRoot = getRootCategory();
		while ($data = $categoryRoot->fetch())
        {
        	$data['child'] = [];
        	$rq = getAllSubCategoryById($data['id']);
        	while ($subcat = $rq->fetch()){

        		$subcat['objet'] = [];
        		$requette = getObjectByCategory($subcat['id']);
        		while ($object = $requette->fetch()){
        			$subcat['objet'][] = $object;
        		}
        		$requette->closeCursor();
        		$data['child'][] = $subcat;
        	}
        	$rq->closeCursor();
        	$allData[] = $data;
        }
        $categoryRoot->closeCursor();
        

		
		require('vue/compilatedVue.php');
		
		break;


	case 'valider':
		if(isset($_GET['panier']) && isset($_GET['mode']) && !empty($_GET['panier']) && !empty($_GET['mode']))
		{
			newFlux($_SESSION['user_id'], $_GET['panier']);
			echo "<h1>Commande réussi.</h1><br><h2>Vous allez être redirigé dans 5 secondes</h2>";
			echo "<meta http-equiv=\"refresh\" content = \"7; url = .\" >";

		}else{
			die("une erreur est survenue lors de l'enregistrement de votre commande prevenez une personne avec de vrais competence  pour ne pas perdre votre temps.<br>Cordialement la direction. ");
		}
		break;


/*
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
		if(!isset($_GET['id_parent'])){
			$categorys = getRootCategory();
		}else{
			if (categoryAsChild($_GET['id_parent'])) {
				# code...
			}
			$categorys = getAllSubCategoryById($_GET['id_parent']);
		}
		require('vue/categoryVue.php');
		
		break;
		



	case 'object':
		$object = getObjectByCategory($_GET['id_cat']);
		require('vue/objectVue.php');
		
		break;


	
		*/
	
	default:
		# code...
		break;
	}

}else{
	header('Location: .?p=nom');
	die();
}




