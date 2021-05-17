<!DOCTYPE html>
<html>
<head>
	<title>Graph</title>
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="CSS/graph.css">
</head>
<body>
	<div id="valueStock">
		<div id="ht">HT : <?php echo $valueSt*0.80; ?> €</div>
		<div id="ttc">TTC : <?php echo $valueSt; ?> €</div>
	</div>
	<div id="graphContainer"><canvas id="myChart" width="200" height="200"></canvas></div>
	
	<a href=".?p=admin">Retour</a>


	<script type="text/javascript">
		let semaine = <?php echo json_encode($semaine); ?>;
		let mois = <?php echo json_encode($mois); ?>;
	</script>
<script src="JS/chartjs.js"></script>
<script src="JS/graph.js"></script>
<script type="text/javascript">

	var ctx = 'myChart';
	var myChart = new Chart(ctx, {
    type: 'bar',
    data: {
        datasets: [{
            label: '# of Votes',
            data: mois,
            
            borderWidth: 1
        }]
    },
    options: {
        parsing:{
        	xAxisKey: 'date',
        	yAxisKey: 'nombre'
        }
    }
});
</script>
</body>
</html>
