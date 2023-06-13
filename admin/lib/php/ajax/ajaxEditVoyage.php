<?php
//header('Content-Type: application/json');
/*
la fonction header('Content-Type: application/json') assure que la réponse du serveur est correctement
et directement interprétée comme objet JSON et non texte ou html.
*/
require '../dbPgConnect.php';
require '../classes/Connexion.class.php';
require '../classes/Voyage.class.php';
require '../classes/VoyageBD.class.php';

$cnx = Connexion::getInstance($dsn,$user,$pass);
$vg = new VoyageBD($cnx);
$vg ->editVoyage($_GET["id"], $_GET["champ"], $_GET["valeur"]);


