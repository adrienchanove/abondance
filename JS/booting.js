


let user      = document.querySelector("#userListFrame");
let sleep     = document.querySelector("#sleep");
let awakening = document.querySelector("#loadingFrame");
let audio     = document.querySelector("#audioBoot");

let idTimeOut = null;
let timer = 60000  // temps avant mise en veille



function miseEnVeille(){
	console.log("mise en veille");
	document.removeEventListener("click", resetTimeOut);
	user.style.display = "none";
	sleep.style.display = "block";
	sleep.addEventListener("click", reveille);
	
	audio.pause()
	audio.currentTime = 0;
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

	console.log('here we go again');
	audio.play();
	setTimeout(writing,1000);

}


function writing(){
	var i = 0;
	var waiting = 20;
	setTimeout(function(){ajoutCaractere('Loading  Abondance OS V 1.0.2<br />')},i);
	i+=100;
	setTimeout(function(){ajoutCaractere('Initializing CPU #0<br />')},i);
	i+=waiting;
	setTimeout(function(){ajoutCaractere('Detected 128MHz processor<br />')},i);
	i+=100;
	setTimeout(function(){ajoutCaractere('CPU ')},i);
 	i+=waiting;
	setTimeout(function(){point(26)},i);
	i+=((26*waiting)+100);
	setTimeout(function(){ajoutCaractere('Checking disk<br />')},i);
	i+=100;
	setTimeout(function(){ajoutCaractere('Disk ')},i);
	i+=100;
	setTimeout(function(){point(25)},i);
	i+=(25*waiting)+100;
	setTimeout(function(){ajoutCaractere('Mounting local filesystems<br />')},i);
	i+=100;
	setTimeout(function(){ajoutCaractere('kern.sts.shnmza ')},i);
	i+=100;
	setTimeout(function(){point(14)},i);
	i+=(14*waiting)+100;
	setTimeout(function(){ajoutCaractere('kern.sts.nach.syn ')},i);
	i+=100;
	setTimeout(function(){point(12)},i);
	i+=(12*waiting)+100;
	setTimeout(function(){ajoutCaractere('kern.sts.shnni ')},i);
	i+=100;
	setTimeout(function(){point(15)},i);
	i+=(15*waiting)+100;
	setTimeout(function(){ajoutCaractere('kern.sts.skmzoc ')},i);
	i+=100;
	setTimeout(function(){point(14)},i);
	i+=(14*waiting)+100;
	setTimeout(function(){ajoutCaractere('kern.sts.abcizd ')},i);
	i+=100;
	setTimeout(function(){point(14)},i);
	i+=(14*waiting)+100;
	setTimeout(function(){ajoutCaractere('Deamon loaded<br /> ')},i);
	i+=100;
	setTimeout(function(){ajoutCaractere('All system loaded ')},i);
	i+=100;
	setTimeout(function(){point(12)},i);
	i+=(12*waiting)+100;
	setTimeout(function(){ajoutCaractere('Loading login menu ... ')},i);

	i+=200;
	setTimeout(function(){finishBoot();},i);
	console.log(i);

}

function finishBoot(){
	awakening.style.display = "none";
	user.style.display = "block";
	awakening.innerHTML = '<img src="Images/ico_booting.png" id="bootingIco">';
	resetTimeOut();
	document.addEventListener("click", resetTimeOut);
}

function ajoutCaractere(data){
	awakening.innerHTML += data;
	console.log(data);
}


function point( nbPoint){
	
	var time = 0;
	if (nbPoint == 0)
	 return;
	while(nbPoint > 0){
		setTimeout(function(){ajoutCaractere('.')},time);
		time += 10;
		nbPoint -= 1 ;
	}
	setTimeout(function(){ajoutCaractere(' OK<br>')},time);
}




idTimeOut = setTimeout(miseEnVeille, timer);
console.log("timeout start");

document.addEventListener("click", resetTimeOut);





