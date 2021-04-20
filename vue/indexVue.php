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
        while ($data = $users->fetch())
        {
        ?>
            <div class="users">
                <h3>
                    <a href=".?p=nom&id=<?= htmlspecialchars($data['id']) ?>">   <?= htmlspecialchars($data['nom']) ?>  </a>
                </h3>
                
            </div>
        <?php
        }
        $users->closeCursor();
        ?>
    </body>
</html>