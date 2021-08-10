<?php
    include_once('connexion.php');
    $co =getconnexion();

    $req = "SELECT * FROM clusters ORDER BY nom ASC";
    $stmt = $co->prepare($req);
    $stmt->execute();
    $clusters = $stmt->fetchAll(PDO::FETCH_ASSOC); 
    
    ?>

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Liste des clusters</title>
</head>
<body>

    <center>
        <table border="1"  width="90%">
            <tr>
                <th>Nom</th>
                <th>Filière</th>
                <th>Village</th>
            </tr>

            <?php
            foreach ($clusters as $cluster) {

                $req1 = "SELECT * FROM filieres WHERE idfiliere = :id";
                $stmt = $co->prepare($req1);
                $stmt->execute(['id' => $cluster['idfiliere']]);
                $filiere = $stmt->fetch();

                $req2 = "SELECT * FROM villages WHERE idvillage = :id";
                $stmt = $co->prepare($req2);
                $stmt->execute(['id' => $cluster['idvillage']]);
                $village = $stmt->fetch();

                echo "<tr> <td>". $cluster['nom'] . "</td> <td>". $filiere['nom'] . "</td><td>". $village['nom'] . "</td> </tr>";
            }

            ?>

        </table>
    </center>

</body>
</html>