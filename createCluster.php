<?php
    include_once('connexion.php');
    $co = getconnexion();

    $req = "SELECT * FROM :table"; // modifier pour utiliser une seule table
    $reqSFil = "SELECT * FROM filieres";
    $reqSDep = "SELECT * FROM departements";
    $reqSCom = "SELECT * FROM communes";
    $reqSArr = "SELECT * FROM arrondissements";
    $reqSVlg = "SELECT * FROM villages";

    $stmt = $co->prepare($reqSFil);
    $stmt->execute();
    $filieres = $stmt->fetchAll(PDO::FETCH_ASSOC) ;

    $stmt = $co->prepare($reqSDep);
    $stmt->execute();
    $departements = $stmt->fetchAll(PDO::FETCH_ASSOC) ;

    $stmt = $co->prepare($reqSCom);
    $stmt->execute();
    $communes = $stmt->fetchAll(PDO::FETCH_ASSOC) ;

    $stmt = $co->prepare($reqSArr);
    $stmt->execute();
    $arrondissements = $stmt->fetchAll(PDO::FETCH_ASSOC) ;

    $stmt = $co->prepare($reqSVlg);
    $stmt->execute();
    $villages = $stmt->fetchAll(PDO::FETCH_ASSOC) ;
?>

<!doctype html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Nouveau Cluster</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <h2>Nouveau Cluster</h2>
    <fieldset>
        <form action="save.php" method="post">
            <div>
                <div>
                    <p><label for="filiere"><b>Filière</b></label></p>
                    <p>
                        <select name="filiere" id="filiere" style="width: 100%; height: 2em">
                            <option value="*">Sélectionner une filière</option>
                            <?php
                            foreach ($filieres as $filiere) {
                                echo "<option value='". $filiere['idfiliere'] ."'>". $filiere['nom'] ."</option>";
                            }
                            ?>
                        </select>
                    </p>
                </div>
                <div style="display: flex">
                    <div style="width: 50%">
                        <p><label for="departement"><b>Département</b></label></p>

                        <select name="departement" id="departement" class="mid-select" style="width: 90%; height: 2em">
                            <option value="*">Sélectionner un département</option>
                            <?php
                            foreach ($departements as $departement) {
                                echo "<option value='". $departement['iddepartement'] ."'>". $departement['nom'] ."</option>";
                            }
                            ?>
                        </select>
                    </div>

                    <div style="width: 50%">
                        <p><label for="commune"><b>Commune</b></label></p>
                        <p>
                            <select name="commune" id="commune" class="mid-select" style="width: 100%; height: 2em">
                                <option value="*">Sélectionner une commune</option>
                                <?php
                                foreach ($communes as $commune) {
                                    echo "<option value='". $commune['idcommune'] ."'>". $commune['nom'] ."</option>";
                                }
                                ?>
                            </select>
                        </p>
                    </div>

                </div>

                <div style="display: flex">
                    <div style="width: 50%">
                        <p><label for="arrondissement"><b>Arrondissement</b></label></p>
                        <p>
                            <select name="arrondissement" id="arrondissement" class="mid-select" style="width: 90%; height: 2em">
                                <option value="*">Sélectionner un arrondissement</option>
                                <?php
                                foreach ($arrondissements as $arrondissement) {
                                    echo "<option value='". $arrondissement['idarrondissement'] ."'>". $arrondissement['nom'] ."</option>";
                                }
                                ?>
                            </select>
                        </p>
                    </div>
                    <div style="width: 50%">
                        <p><label for="village"><b>Village</b></label></p>
                        <p>
                            <select name="village" id="village" class="mid-select" style="width: 100%; height: 2em">
                                <option value="*">Sélectionner un village</option>
                                <?php
                                foreach ($villages as $village) {
                                    echo "<option value='". $village['idvillage'] ."'>". $village['nom'] ."</option>";
                                }
                                ?>
                            </select>
                        </p>
                    </div>
                </div>

                <div>
                    <p><label for="nom"><b>Nom du cluster</b></label></p>
                    <p><input type="text" name="nom" id="nom" style="width: 99%; height: 2em"></p>
                    </p>
                </div>

                <p>
                    <input type="submit" value="Enregister" id="enregistrer" name="submit">
                    <input type="reset" value="Annuler" id="annuler">
                </p>
            </div>

        </form>
    </fieldset>
</body>
</html>

<?php
