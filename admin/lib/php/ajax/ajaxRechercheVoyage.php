<?php
header('Content-Type: application/json');
//chemin d'accès depuis le fichier ajax php
require '../dbPgConnect.php';
require '../classes/Connexion.class.php';
require '../classes/Voyage.class.php';
require '../classes/VoyageBD.class.php';
$cnx = Connexion::getInstance($dsn,$user,$password);

$vg = new VoyageBD($cnx);
$data[] = $vg->getVoyageById($_GET['id_voyage']);
print json_encode($data);
