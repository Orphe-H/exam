<?php

include_once('connexion.php');

$co = getconnexion();

//var_dump($_POST);
//die;
if(isset($_POST['submit'])) {

    if(!empty($_POST['filiere']) && !empty($_POST['departement']) && !empty($_POST['commune']) && !empty($_POST['arrondissement']) && !empty($_POST['village']) && !empty($_POST['nom']) ) {
        $insCLu = "INSERT INTO clusters(nom, idfiliere, idvillage) VALUES (:no, :idf, :idv)";

        $stmt = $co->prepare($insCLu);
        $stmt->execute([
            ':no' => $_POST['nom'],
            ':idf' => $_POST['filiere'],
            'idv' => $_POST['village']
        ]);

        //echo "Cluster enregistré avec succès";
        header('location:liste.php');
    }
    else {
        echo "Veuillez remplir tous les champs";
    }
}