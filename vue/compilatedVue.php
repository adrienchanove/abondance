<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Expires" content="-1">
        <link rel="stylesheet" type="text/css" href="CSS/main.css">
        <meta charset="utf-8">
    </head>
    <body>
        <audio id="audioType">
            <source src="Audio/snd_type.mp3" type="audio/mpeg">
        </audio>
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
		<button id="buttonAdd" onclick="window.location.href = '.?p=admin'">
			<img id="buttonAddIco" src="images/ico_add.png">
		</button>
		<button id="buttonSearch" onclick="showSearch()">
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

        <div id="boiteRecherche">
            <div id="headRecherche">
                <input type="text" name="search" id="search" onkeyup="recherche()">
                <select name="filtre" id="filtreRecherche">
                    <option value="nom">Nom</option>
                    <option value="marque">Marque</option>
                    <option value="model">Model</option>
                </select>
                <button onclick="showSearch()">X</button>
            </div>
            <div id="bodyRecherche">
                <table id="rechercheTable" border=3 style="width:100%">
                     <tr>
                        <th>parentCat</th>
                        <th>category</th>
                        <th>nom</th>
                        <th>marque</th>
                        <th>model</th>
                      </tr>
                </table>
            </div>
        </div>

        <script type="text/javascript">
            let data=<?= json_encode($allData) ?>;
            let listeObjet=<?= json_encode($listeObjet)?>;
            let nom=<?= json_encode($nomPersonne)?>;
        </script>
        <script src="JS/index.js"></script>
    </body>
</html>

