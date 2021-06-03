<!DOCTYPE html>
<html lang="fr">
    <head> 
        <meta http-equiv="Expires" content="-1">
        <meta charset="utf-8" />
        <title>Mon login</title>
        <link href="CSS/login.css" rel="stylesheet" />
        <link href="CSS/booting.css" rel="stylesheet" /> 

    </head>
        
    <body>
        <audio id="audioBoot">
            <source src="Audio/snd_booting.mp3" type="audio/mpeg">
        </audio>
        
        <div id="userListFrame">
            <div id="userList">
                <?php
                    while ($data = $users->fetch())
                    {
                ?>
                    
                    <img class="userIco" src="Images/ico_user.png" alt="icone personnage">
                    <button class="userFrame" onclick="window.location.href = '.?p=nom&id=<?= htmlspecialchars($data['id']) ?>';" ><?= htmlspecialchars($data['nom']) ?></button>

                <?php
                    }
                $users->closeCursor();
                ?>

                
                
            </div>
        </div>
        
        <div id="booting">
            <div id="sleep">
                
            </div>
            <div id="loadingFrame">
                <img src="Images/ico_booting.png" id="bootingIco">
                
            </div>
        </div>
        
        <script src="JS/booting.js"></script>
    </body>
</html>