let user = document.querySelector("#userListFrame");
let sleep = document.querySelector("#sleep");
let awakening = document.querySelector("#loadingFrame");

let idTimeOut = null;
let timer = 5000  // temp avant mise en veille


console.log(user.style.display);

function miseEnVeille(){
	console.log("mise en veille");
	document.removeEventListener("click", resetTimeOut);
	user.style.display = "none";
	sleep.style.display = "block";
	sleep.addEventListener("click", reveille);
}

function resetTimeOut(){
	clearTimeout(idTimeOut);
	idTimeOut = setTimeout(miseEnVeille, timer);
	console.log("reset");
}

function reveille(){
	console.log("reveille en cours ...");
	sleep.style.display = "none";
	sleep.removeEventListener("click", reveille);
	awakening.style.display = "block";



}

function ajoutCaractere(data){
	awakening.innerHTML += data;
}


function point( nbPoint){
	var time = 500;
	while(nbPoint > 0){
		setTimeout(ajoutCaractere('.'),time);
		time += 500;
	}
	setTimeout(ajoutCaractere(' OK<br>'),time);
}




idTimeOut = setTimeout(miseEnVeille, timer);
console.log("timeout start");

document.addEventListener("click", resetTimeOut);





