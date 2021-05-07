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
                
            </div>
            <div id="loadingFrame">
                <img src="Images/ico_booting.png" id="bootingIco">
                Loading  Abondance OS V 1.0.2<br />
                Initializing CPU #0<br />
                Detected 128MHz processor<br />
                CPU .......................... OK<br />
                Memory 4096Ko/4096Ko available<br />
                kern.sts.abcizd .............. OK<br />
                Checking disk<br />
                Disk ......................... OK<br />
                Mounting local filesystems<br />
                kern.sts.shnmza .............. OK<br />
                kern.sts.nach.syn ............ OK<br />
                kern.sts.shnni ............... OK<br />
                kern.sts.skmzoc .............. OK<br />
                kern.sts.abcizd .............. OK<br />
                Deamon loaded<br />
                All system loaded ............ OK<br />
                Loading login menu ...
            </div>
        </div>
        
        <script src="JS/booting.js"></script>
    </body>
</html>