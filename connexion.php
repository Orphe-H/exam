<?php
 function getconnexion () {
     try {
         $connexion = new PDO('mysql:host=localhost;dbname=cluster', 'root', '');
     }
     catch (PDOException $exception) {
         echo "Erreur de connexion: " . $exception->getMessage();
     }
     return $connexion;
 }