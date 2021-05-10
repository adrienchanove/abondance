<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Expires" content="-1">
        <meta charset="utf-8" />
        <title>Mon blog</title>
        <link href="style.css" rel="stylesheet" /> 
    </head>
        
    <body>
        <h1>Choisissez votre nom !</h1>
        <p>Parmis la liste ci-dessous :</p>
        
        <?php
        while ($data = $object->fetch())
        {
        ?>
            <div class="object">
                <h3>
                    <a href=".?p=object&id_cat=<?= htmlspecialchars($data['id']) ?>">   <?= htmlspecialchars($data['nom']) ?>  </a>
                </h3>
                
            </div>
        <?php
        }
        $object->closeCursor();
        ?>
    </body>
</html>