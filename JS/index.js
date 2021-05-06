console.log(data);
console.log(listeObjet);
/*
var div = document.createElement("div");
div.style.width = "100px";
div.style.height = "100px";
div.style.background = "red";
div.style.color = "white";
div.innerHTML = "Hello";

document.getElementById("main").appendChild(div);
*/

//selection du conteneur de category
let boiteCategorie = document.querySelector("#categoryFrame");
let boitObjet      = document.querySelector("#objectFrame");
let boitePanier    = document.querySelector("#buyList");
let boitePrix      = document.querySelector("#buyListTotal");
let boiteValidation= document.querySelector("#buyButton");
let boiteNom       = document.querySelector("#userInfoText");

let catId = null;
let subCatId = null;
let choix = null;
let listePanier = [];




nom.replace(" ","<br>");
boiteNom.innerHTML = nom;

function selectAction(cliquer){
	catId = null;
	subCatId = null;
	
	
	if(cliquer.innerHTML !== 'Retour'){
		choix = cliquer.innerHTML;
		listePanier = [];
		boitePanier.innerHTML="";
	}
	
	boiteValidation.innerHTML = "Valider le "+choix;
	console.log(choix);
	
	majCategory('cat');
}

function majCategory (raison){
	console.log('mise à jour categorie :' +raison);

	boiteCategorie.innerHTML = "";
	boitObjet.innerHTML = "";
	if (raison == 'cat') {
		for (var i = data.length - 1; i >= 0; i--) {
			data[i]

			let category = document.createElement("button");
			category.classList.add("categoryButton");
			category.setAttribute('idcat',data[i]['id']);
			category.innerHTML = data[i]['nom'];
			boiteCategorie.appendChild(category);
			category.onclick = function(){selectCat(this);};

		}
		
	}
	if (raison == 'subCat') {
		for (var i = data.length - 1; i >= 0; i--) {
			if (data[i]['id'] == catId) {
				
				for (var z = data[i]['child'].length - 1; z >= 0; z--) {
					
					let category = document.createElement("button");
					category.classList.add("categoryButton");
					category.setAttribute('idcat',data[i]['child'][z]['id']);
					category.innerHTML = data[i]['child'][z]['nom'];
					boiteCategorie.appendChild(category);
					category.onclick = function(){selectSubCat(this);};

				}
				let category = document.createElement("button");
				category.classList.add("categoryButton");
				category.setAttribute('idcat',catId);
				category.innerHTML = "Retour";
				boiteCategorie.appendChild(category);
				category.onclick = function(){selectAction(this);};
			}

		}
		
	}
}

function majObject(){
	console.log('mise à jour objet, categorie n°' +subCatId);
	boitObjet.innerHTML = "";
	for (var i = data.length - 1; i >= 0; i--) {
		if (data[i]['id'] == catId) {
			for (var z = data[i]['child'].length - 1; z >= 0; z--) {
				if (data[i]['child'][z]['id'] == subCatId) {
					for (var x = data[i]['child'][z]['objet'].length - 1; x >= 0; x--) {
						if(typeof(data[i]['child'][z]['objet'][x]['nbselect']) == 'undefined'){
							data[i]['child'][z]['objet'][x]['nbselect'] = 0;
						}

						var chec=false;
						for (var k = listePanier.length - 1; k >= 0; k--) {
							
							if (data[i]['child'][z]['objet'][x]["id"] == listePanier[k]['id']) {
								data[i]['child'][z]['objet'][x]["nbselect"] = listePanier[k]['nbselect'];
								chec = true;
							}
						}
						if (!chec) {
							data[i]['child'][z]['objet'][x]["nbselect"] = 0;
						}


						let div = document.createElement("div");

						let objectButton = document.createElement("button");
						let objectButtonPlus = document.createElement("button");
						let objectButtonMinus = document.createElement("button");
						let objectTotal = document.createElement("button");

						objectButton.classList.add("objectButton");
						objectButtonPlus.classList.add("objectButtonPlus");
						objectButtonMinus.classList.add("objectButtonMinus");
						objectTotal.classList.add("objectTotal");

						objectButton.setAttribute('idobj',data[i]['child'][z]['objet'][x]["id"]);
						objectButtonPlus.setAttribute('idobj',data[i]['child'][z]['objet'][x]["id"]);
						objectButtonMinus.setAttribute('idobj',data[i]['child'][z]['objet'][x]["id"]);
						objectTotal.setAttribute('idobj',data[i]['child'][z]['objet'][x]["id"]);

						objectButton.innerHTML = data[i]['child'][z]['objet'][x]["nom"]+"	"+data[i]['child'][z]['objet'][x]["marque"]+"	"+data[i]['child'][z]['objet'][x]["model"]+"	dispo: "+data[i]['child'][z]['objet'][x]["nombre"]+"	prix: "+data[i]['child'][z]['objet'][x]["cout"];
						objectButtonPlus.innerHTML = "+";
						objectButtonMinus.innerHTML = "-";
						objectTotal.innerHTML = data[i]['child'][z]['objet'][x]['nbselect'];

						objectButtonPlus.onclick = function(){selectChangeNbObjet(this,'+');};
						objectButtonMinus.onclick = function(){selectChangeNbObjet(this,'-');};

						div.appendChild(objectButton);
						div.appendChild(objectButtonPlus);
						div.appendChild(objectTotal);
						div.appendChild(objectButtonMinus);

						boitObjet.appendChild(div);
						//category.onclick = function(){selectSubCat(this);};

					}
					
				}
			}
		}

	}
}


function selectCat(cliquer){
	cliquer.color = 'red';
	console.log("select Cat");
	catId = cliquer.getAttribute('idcat');
	majCategory('subCat');
}

function selectSubCat(cliquer){
	
	console.log("select sub cat");
	subCatId = cliquer.getAttribute('idcat');
	majObject();

}

function selectChangeNbObjet(cliquer,operande){

	console.log("select '"+operande+"' for object n°"+cliquer.getAttribute('idobj'));

	for (var i = data.length - 1; i >= 0; i--) {

		if (data[i]['id'] == catId) {
			
			for (let z = data[i]['child'].length - 1; z >= 0; z--) {
				if (data[i]['child'][z]['id'] == subCatId) {
					for (let x = data[i]['child'][z]['objet'].length - 1; x >= 0; x--) {
						if (data[i]['child'][z]['objet'][x]['id'] == cliquer.getAttribute('idobj')) {

							let tot = cliquer.parentElement.querySelector(".objectTotal");
							
							var ancienTot = Number(tot.innerHTML);
							var nouveauTot = 0;
							switch(operande) {
								case '+':
									// code block
									if (choix == 'Retrait') {
										if ((ancienTot + 1) <= Number(data[i]['child'][z]['objet'][x]['nombre'])) {
											nouveauTot = ancienTot+1;
										}else{
											nouveauTot = ancienTot;
											
										}
									}else{
										nouveauTot = ancienTot+1;
									}

									
									
									
									break;

								case '-':
									if (ancienTot - 1 >= 0) {
										nouveauTot = ancienTot-1;
									}else{
										nouveauTot = ancienTot;
									}
									break;

								default:
									// code block
									console.log("pas normal!!!");
							}

							tot.innerHTML = nouveauTot;
							data[i]['child'][z]['objet'][x]['nbselect'] = nouveauTot;
							let e = false;
							for (var w = listePanier.length - 1; w >= 0; w--) {
								listePanier[w]
								if (listePanier[w]['id'] == cliquer.getAttribute('idobj') && e == false) {
									e = true;
									listePanier[w]['nbselect'] = nouveauTot;
									
								}
							}
							if(e == false){
								listePanier.push( {'id': Number(cliquer.getAttribute('idobj')), 'nbselect' : nouveauTot} );
								
							}
							majBoitePanier();

						}

					}
					
				}
			}
		}

	}
	
	
	
	


	

}

function majBoitePanier(){
	//verification objet sans nombre
	boitePanier.innerHTML="";
	var prixTot = 0.0;
	var tempListePanier = listePanier;
	for (var i = tempListePanier.length - 1; i >= 0; i--) {
		if(tempListePanier[i]['nbselect'] == 0){
			listePanier.splice(i);
		}
	}

	for (var i = listePanier.length - 1; i >= 0; i--) {
		for (var x = listeObjet.length - 1; x >= 0; x--) {
			if (listePanier[i]['id'] == listeObjet[x]['id']) {

				// - Pommes Arros 5z5df8 x10 (4.55€)
                //<br />
                //boitePanier
                prixTot += Math.round(listeObjet[x]['cout']*listePanier[i]['nbselect']*100)/100;
                var div = document.createElement('div');
                div.innerHTML = "- "+listeObjet[x]['nom']+" "+listeObjet[x]['marque']+" "+listeObjet[x]['model']+" X"+listePanier[i]['nbselect']+" ("+listeObjet[x]['cout']+")";
                boitePanier.appendChild(div);

			}
		}
	}
	boitePrix.innerHTML = "TOTAL : "+prixTot+"€";
}




