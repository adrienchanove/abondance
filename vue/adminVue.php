<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta http-equiv="Expires" content="-1">
        <meta charset="utf-8" />
        <title>Administration</title>
        <link href="CSS/admin.css" rel="stylesheet" /> 

    </head>
        
    <body>
        <div id="message">
			<div id="messageText">
            <?php if (isset($_GET['m'])) {echo "Envoie réussi!"; } ?>
            <?php if (isset($_GET['e'])&&$_GET['e']=='1') {echo "Une erreur est survenue lors de la saisi des donnée, (manque de certains champs ou le cout est à 0)";  } ?>
			</div>
		</div>
        <div id="formulaire">
            <div id="form-category">
                <center>
                    <form action="." method="GET">
                        <input type="hidden" name="p" value="admin">
                        
                        <label for="nom">Nom de la sous-catégorie:</label>
                        <input type="text" name="nom" required="true"> <br>

                        <label for="parent" >Parent de la sous-catégorie:</label>
                        <select name="parent" required="true">
                            <?php 
                            $req = getRootCategory();
                            while ($data = $req->fetch()) {
                                echo '<option value="'.$data['id'].'" >'.$data['nom'].'</option> ';
                            }
                            $req->closeCursor();
                             ?>
                        </select> <br>

                        <input class="buttonSubmit" type="submit" name="action" value="Nouvelle sous-catégorie">

                    </form>
                </center>
            </div>

            <br><br>
            <div id="form-objet">
                <center>
                    <form action="." method="GET">
                        <input type="hidden" name="p" value="admin">
                        <label for="nom">Nom de l'objet:</label>
                        <input type="text" name="nom" required="true"> <br>

                        <label for="parent">Catégorie de l'objet:</label>
                        <select name="parent">
                            <?php 
                            $req = getSubCategoryWParent();
                            while ($data = $req->fetch()) {
                                echo '<option value="'.$data['id'].'" >'.$data['nomParent'].'--'.$data['nom'].'</option> ';
                            }
                            $req->closeCursor();
                             ?>
                        </select><br>

                        <label for="marque">Marque de l'objet:</label>
                        <input type="text" name="marque"><br>

                        <label for="model">Model de l'objet:</label>
                        <input type="text" name="model"><br>

                        <label for="nombre">Nombre d'objet:</label>
                        <input type="number" name="nombre" value="1" required="true"><br>

                        <label for="cout">Prix de l'objet:(ex:1.20)</label>
                        <input type="text" name="cout" required="true"><br>

                        <input class="buttonSubmit" type="submit" name="action" value="Nouveau objet">
                            
                    </form>
                </center>
                
            </div>
            
        </div>
        <br> <br>
        <div id="logdiv">
            <center>
				<div id="PDFButton">
					<div id="PDFButtonText">
						<a href=".?p=logpdf" target="_blank">Version PDF ici</a>
                	</div>
				</div>
                <div id="retour">
                    <div id="retourText">
                        <a href=".?p=compilated" >Retour</a>
                    </div>
                </div>
                <div id="graph">
                    <div id="graphText">
                        <a href=".?p=graph" >Graph</a>
                    </div>
                </div>
				<div id="tableFrame"> 
					<table border=1>
						<tr>
							<th>Id</th>
							<th>Date</th>
							<th>Sens du flux</th>
							<th>Nom</th>
							<th>Nom de l'objet</th>
							<th>Marque</th>
							<th>Model</th>
							<th>Cout UNIT</th>
							<th>Nombre</th>
							<th>Cout TOT</th>
						</tr>
						
						<?php 
							foreach ($logs as $flux) {
								//print_r($flux);
								echo "<tr>";

								echo "<td>".$flux['id']."</td>";
								echo "<td>".$flux['date']."</td>";
								echo "<td>".$flux['mode']."</td>";
								echo "<td>".$flux['nom']."</td>";
								echo "<td>".$flux['nomObjet']."</td>";
								echo "<td>".$flux['marque']."</td>";
								echo "<td>".$flux['model']."</td>";
								echo "<td>".$flux['cout']."</td>";
								echo "<td>".$flux['nombre']."</td>";
								echo "<td>".$flux['cout']*$flux['nombre']."</td>";

								echo "</tr>";
							}
						 ?>
					</table>
				</div>
            </center>
            
            
           
        </div>
      
      
        
        
    </body>
</html>