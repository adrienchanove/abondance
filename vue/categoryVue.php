<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <title>Mon blog</title>
        <link href="style.css" rel="stylesheet" /> 
    </head>
        
    <body>
        <h1>Choisissez votre nom !</h1>
        <p>Parmis la liste ci-dessous :</p>
        
        <?php
        while ($data = $categorys->fetch())
        {
        ?>
            <div class="category">
                <h3>
                    <a href=".?p=category&id_parent=<?= htmlspecialchars($data['id']) ?>">   <?= htmlspecialchars($data['nom']) ?>  </a>
                </h3>
                
            </div>
        <?php
        }
        $categorys->closeCursor();
        ?>
    </body>
</html>