<?php


class DestinationBD extends Destination
{
    private $_db;
    private $_array = array();

    public function __construct($cnx)
    {
        $this->_db = $cnx;
    }

    public function editDestination($champ, $id, $valeur)
    {
        try {
            $query = "update Villes set $champ ='$valeur' where id_ville='$id'";
            //print "query : ".$query;
            $res = $this->_db->prepare($query);
            /*$res->bindValue(':champ',$champ);
            $res->bindValue(':valeur',$valeur);
            $res->bindValue(':id',$id);
            */
            $res->execute();

        } catch (PDOException $e) {
            print "Echec " . $e->getMessage();
        }
    }

    public function addDestination($champ, $valeur){
        try {
            $nom_ville="";
            $image_ville="";
            //insérer Ville aux champs vides et récupérer l'id --> procédure embarquée
            $query = "insert into villes (nom_ville,image_ville) values ('','')";
            $res = $this->_db->prepare($query);
            $res->execute();
            //faire un update avec le champ et la valeur reçue
            $query = "";
            //print "query : ".$query;
            $res = $this->_db->prepare($query);
        } catch (PDOException $e) {
            print "Echec " . $e->getMessage();
        }
    }

    public function deleteDestination($id)
    {
        try {
            $query = "delete from villes where id_ville = :id";
            $res = $this->_db->prepare($query);
            $res->bindValue(':id', $id);
            $res->execute();
        } catch (PDOException $e) {
            print "Echec " . $e->getMessage();
        }
    }

    public function getDestinationById($id)
    {
        try {
            $query = "select * from villes where id_ville = :id";
            $res = $this->_db->prepare($query);
            $res->bindValue(':id', $id);
            $res->execute();
            $data = $res->fetch();
            return $data;
        } catch (PDOException $e) {
            print "Echec " . $e->getMessage();
        }
    }

    public function getVueAllVilles()
    {
        try {
            $query = "select * from vue_villes order by id_ville";
            $res = $this->_db->prepare($query);
            $res->execute();

            while ($data = $res->fetch()) {
                $_array[] = new Destination($data);
            }
            if (!empty($_array)) {
                return $_array;
            } else {
                return null;
            }


        } catch (PDOException $e) {
            print "Echec " . $e->getMessage();
        }
    }

}

