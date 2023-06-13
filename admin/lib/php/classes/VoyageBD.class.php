<?php

class VoyageBD extends Voyage
{
    private $_db;
    private $_array = array();

    public function __construct($cnx)
    {
        $this->_db = $cnx;
    }

    public function editVoyage( $id,$champ, $valeur)
    {
        try {
            $query = "update voyage set $champ=:valeur where id_voyage=:id";
            $res = $this->_db->prepare($query);
            $res->bindValue(':valeur', $valeur);
            $res->bindValue(':id', $id);
            $res->execute();
        } catch (PDOException $e) {
            print "Echec " . $e->getMessage();
        }
    }

    public function addVoyage($nom_voyage,$description,$prix,$image,$nbr_jours,$id_ville){
        try {
            $query ="INSERT INTO voyage(nom_voyage,description,prix,image,nbr_jours,id_ville)VALUES(?,?,?,?,?,?) RETURNING id_voyage";
            $res = $this ->_db->prepare($query);
            $res->execute([$nom_voyage,$description,$prix,$image,$nbr_jours,$id_ville]);
        } catch (PDOException $e) {
            print "Echec " . $e->getMessage();
        }
        return 0;
    }

    public function deleteVoyage($id)
    {
        try {
            $query = "delete from voyage where id_voyage = :id";
            $res = $this->_db->prepare($query);
            $res->bindValue(':id', $id);
            $res->execute();
        } catch (PDOException $e) {
            print "Echec " . $e->getMessage();
        }
    }

    public function getVoyageById($id)
    {
        try {
            $query = "select * from voyage where id_voyage = :id";
            $res = $this->_db->prepare($query);
            $res->bindValue(':id', $id);
            $res->execute();
            $data = $res->fetch();
            return $data;
        } catch (PDOException $e) {
            print "Echec " . $e->getMessage();
        }
    }

    public function getVueAllVoyages()
    {
        try {
            $query = "select * from vue_voyage order by id_voyage";
            $res = $this->_db->prepare($query);
            $res->execute();

            while ($data = $res->fetch()) {
                $_array[] = new Voyage($data);
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
