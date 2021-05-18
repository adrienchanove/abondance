<!DOCTYPE html>
<html>
<head>
	<title>Graph</title>
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="CSS/graph.css">
</head>
<body>
	<div id="valueStock">
		<h2><u>Valeur du stock:</u></h2>
		<div id="ht">HT : <?php echo $valueSt*0.80; ?> €</div>
		<div id="ttc">TTC : <?php echo $valueSt; ?> €</div>
	</div>

	<div class="graphContainer">
		<h2>Flux 30 derniers jours</h2>
		<canvas id="mois" width="200" height="200"></canvas>
	</div>

	<div class="graphContainer">
		<h2>Flux 7 derniers jours</h2>
		<canvas id="semaine" width="200" height="200"></canvas>
	</div>

	<div class="graphContainer">
		<h2>Flux Depot + Retrait par personne</h2>
		<canvas id="consomateurRD" width="200" height="200"></canvas>
	</div>

	<div class="graphContainer">
		<h2>Flux Retrait par personne</h2>
		<canvas id="consomateurR" width="200" height="200"></canvas>
	</div>

	<div class="graphContainer">
		<h2>Flux Depot par personne</h2>
		<canvas id="consomateurD" width="200" height="200"></canvas>
	</div>
	
	<a href=".?p=admin">Retour</a>


	<script type="text/javascript">
		let semaine = <?php echo json_encode($semaine); ?>;
		let mois = <?php echo json_encode($mois); ?>;
		let consomateurRD = <?php echo json_encode($fluxRD); ?>;
		let consomateurR  = <?php echo json_encode($fluxR); ?>;
		let consomateurD  = <?php echo json_encode($fluxD); ?>;
	</script>
<script src="JS/chartjs.js"></script>
<script src="JS/graph.js"></script>
<script type="text/javascript">


</script>
</body>
</html>
