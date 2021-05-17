<?php 

//#########__INIT PHP__#########

session_start(); //création de la session php (c'est basiquement un cookie)

//$_SESSION est un tableau contenant les infos de la session php



//   ###__MODEL__##
//Le modèle contient la logique de l'application
require('model/model.php');//require de la connexion à la Base De Donnée




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

		if(!isset($_SESSION['user_id'])){// verification que le nom a bien etait rentré
			header('Location: .');
			die();
		}
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
			require('vue/waitVue.php');

		}else{
			die("une erreur est survenue lors de l'enregistrement de votre commande prevenez une personne avec de vrais competence  pour ne pas perdre votre temps.<br>Cordialement la direction. ");
		}
		break;



	case 'admin':
		$logs = getFlux();
		if (isset($_GET['action'])) {
			if ($_GET['action'] == "Nouvelle sous-catégorie" || $_GET['action'] == "Nouveau objet") {
				if ($_GET['action'] == "Nouvelle sous-catégorie" && !empty($_GET['nom']) && !empty($_GET['parent']) ) {
					setSubCategory($_GET['nom'], $_GET['parent'] );
					$message = "enregistrement de la sous-catégorie effectué avec succée (pas sur à 100%)";
					require('vue/adminVue.php');

				}elseif($_GET['action'] == "Nouveau objet" && !empty($_GET['nom']) && !empty($_GET['parent']) && !empty($_GET['nombre']) && (!empty($_GET['cout']) || $GET['cout'] == 0) ){


					setObject($_GET['nom'], $_GET['parent'], $_GET['marque'], $_GET['model'], $_GET['nombre'], $_GET['cout']);
					$message = "enregistrement:OK";
					header('Location: .?p=admin&m=1');
					die();
				}else{

					header('Location: .?p=admin&e=1');
					die();
				}
				
			}else{
				header('Location: .?p=admin&e=2');
				die();
			}
		}else{
			
			require('vue/adminVue.php');
		}

		break;

	case 'graph':

		$valueSt = valueStock();
		$semain = fluxDiff(7);
		$moi = fluxDiff(30);

		$semaine=[];
		foreach ($semain as $value) {
			$temoin = false;
			foreach ($semaine as $key => $value2) {
				if ($value['date'] == $value2['date']) {
					$semaine[$key]['nombre'] = $semaine[$key]['nombre']+1;
					$temoin = true;
				}
			}
			if (!$temoin) {
				$semaine[] = array('date' => $value['date'],'nombre' => 1 );
			}
		}

		$mois=[];
		foreach ($moi as $value) {
			$temoin = false;
			foreach ($mois as $key => $value2) {
				if ($value['date'] == $value2['date']) {
					$mois[$key]['nombre'] = $mois[$key]['nombre']+1;
					$temoin = true;
				}
			}
			if (!$temoin) {
				$mois[] = array('date' => $value['date'],'nombre' => 1 );
			}
		}
		require('vue/graph.Vue.php');
		break;


	case 'logpdf':
		$logs = getFlux();
		require('vue/pdfLogVue.php');
		
		break;
		

	
	default:
		header('Location: .?p=nom');
		die();
		break;
	}

}else{
	header('Location: .?p=nom');
	die();
}




