<?php
header('Content-Type: application/json');
require '../dbPgConnect.php';
require '../classes/Connexion.class.php';
require '../classes/Hydrate.class.php';
require '../classes/Voyage.class.php';
$cnx = Connexion::getInstance($dsn,$user,$password);
$vg = new Voyage($cnx);
$voyages = $vg->addVoyage($_POST['nom_voyage'],$_POST['description'],$_POST['prix'],$_POST['nbr_jours'],$_POST['id_villes']);
print json_encode($voyages);