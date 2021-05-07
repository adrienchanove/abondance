<!DOCTYPE html>
<html lang="fr">
    <head> 
        <meta charset="utf-8" />
        <title>Mon login</title>
        <link href="CSS/login.css" rel="stylesheet" />
        <link href="CSS/booting.css" rel="stylesheet" /> 

    </head>
        
    <body>
        
        <div id="userListFrame">
            <div id="userList">
                <?php
                    while ($data = $users->fetch())
                    {
                ?>
                    
                    <img class="userIco" src="images/ico_user.png" alt="icone personnage">
                    <button class="userFrame" onclick="window.location.href = '.?p=nom&id=<?= htmlspecialchars($data['id']) ?>';" ><?= htmlspecialchars($data['nom']) ?></button>

                <?php
                    }
                $users->closeCursor();
                ?>

                
                
            </div>
        </div>
        
        <div id="booting">
            <div id="sleep">
                <img src="Images/ico_turnOn.png">
            </div>
            <div id="loadingFrame">
                <img src="Images/ico_booting.png" id="bootingIco"> 
                
            </div>
        </div>
        
        <script src="JS/booting.js"></script>
    </body>
</html>