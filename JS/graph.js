	//graph n1 graph nb flux par jour sur le dernier mois
	var ctx = 'mois';
	var graphMois = new Chart(ctx, {
		type: 'bar',
		data: {
			datasets: [{
				label: '# de transaction',
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

	//graph n2 graph nb flux par jour sur la derniere semaine
	var ctx2 = 'semaine';
	var graphSemaine = new Chart(ctx2, {
		type: 'bar',
		data: {
			datasets: [{
				label: '# de transaction',
				data: semaine,

				borderWidth: 2
			}]
		},
		options: {
			parsing:{
				xAxisKey: 'date',
				yAxisKey: 'nombre'
			}
		}
	});






console.log(consomateurRD['label']);


var config = {
  type: 'pie',
  data: {
  labels: consomateurRD['label'],
  datasets: [{
    label: 'Flux R+D',
    data: consomateurRD['nombre'],
    backgroundColor: [
      'rgb(255, 255, 75)',
      'rgb(0, 0, 255)',
      'rgb(0, 255, 0)',
      'rgb(0, 255, 255)',
      'rgb(255, 0, 0)',
      'rgb(255, 0, 255)',
      'rgb(100, 100, 100)',
      'rgb(150, 50, 100)',

    ],
    hoverOffset: 4
  }]
},
};

var ctx3 = 'consomateurRD';
var graphSemaine = new Chart(ctx3,config);





config = {
  type: 'pie',
  data: {
  labels: consomateurR['label'],
  datasets: [{
    label: 'Flux R+D',
    data: consomateurR['nombre'],
    backgroundColor: [
      'rgb(255, 255, 75)',
      'rgb(0, 0, 255)',
      'rgb(0, 255, 0)',
      'rgb(0, 255, 255)',
      'rgb(255, 0, 0)',
      'rgb(255, 0, 255)',
      'rgb(100, 100, 100)',
      'rgb(150, 50, 100)',

    ],
    hoverOffset: 4
  }]
},
};

var ctx4 = 'consomateurR';
var graphSemaine = new Chart(ctx4,config);


config = {
  type: 'pie',
  data: {
  labels: consomateurD['label'],
  datasets: [{
    label: 'Flux R+D',
    data: consomateurD['nombre'],
    backgroundColor: [
      'rgb(255, 255, 75)',
      'rgb(0, 0, 255)',
      'rgb(0, 255, 0)',
      'rgb(0, 255, 255)',
      'rgb(255, 0, 0)',
      'rgb(255, 0, 255)',
      'rgb(100, 100, 100)',
      'rgb(150, 50, 100)',

    ],
    hoverOffset: 4
  }]
},
};

var ctx5 = 'consomateurD';
var graphSemaine = new Chart(ctx5,config);