<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="CSS/main.css">
    </head>
    <body>
        <div id="buyListFrame">
            <div id="buyListTotal">
                TOTAL : 0€
            </div>
            <div id="buyList">
                
                
            </div>
        </div>
        <button id="buyButton" onclick="window.location.href = '.?p=valider&mode='+choix+'&panier='+JSON.stringify(listePanier)" >Valider le ####</button>
        <div id="userInfoFrame">
            <img id="userInfoIco" src="images/ico_user.png">
            <div id="userInfoText">
                GolfHotel
                <br/>
                IndiaJuliett
            </div>
        </div>
        
        <button id="buttonExit" onclick="window.location.href = '.'">
            <img id="buttonExitIco" src="images/ico_exit.png">
        </button>
		<button id="buttonAdd">
			<img id="buttonAddIco" src="images/ico_add.png">
		</button>
		<button id="buttonSearch">
			<img id="buttonSearchIco" src="images/ico_search.png">
		</button>
        <div id="actionSelectButtonFrame">
            <button class="buttonAction" onclick="selectAction(this);">Retrait</button>
            <button class="buttonAction" onclick="selectAction(this);">Dépôt</button>
        </div>
        <div id="categoryFrame">
            
            
        </div>
        <div id="objectFrame">
            
            
            
        </div>
        <script type="text/javascript">
            let data=<?= json_encode($allData) ?>;
            let listeObjet=<?= json_encode($listeObjet)?>;
            let nom=<?= json_encode($nomPersonne)?>;
        </script>
        <script src="JS/index.js"></script>
    </body>
</html>
