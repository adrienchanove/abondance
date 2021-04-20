<?php 
//formulaire de selection du nom
 ?>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <title>mode</title>
        <link href="style.css" rel="stylesheet" /> 
    </head>
        
    <body>
        <h1>Choisissez votre mouvement !</h1>
        <p>Parmis la liste ci-dessous :</p>
        <div>
        	<h1><a href=".?p=mode&choix=import">IMPORT</a></h1> <br>
        	<h1><a href=".?p=mode&choix=export">EXPORT</a></h1>
        </div>
        <br><br><br><br>
        <?php
        while ($data = $user->fetch())
        {
        ?>
            <div class="user">
                <h3>
                    <?= htmlspecialchars($data['nom']) ?>
                </h3>
                
            </div>
        <?php
        }
        $user->closeCursor();
        ?>
    </body>
</html>