<?php

class Animal {

    private $table = "animal";
    private $id;

    public function __construct($id='') {
        $this->id = $id;
    }
    
    public function get($col) {
        $db_connect = new dbConnect();
        return $db_connect->select($this->table, $this->id, $col);
    }

    public function getEverything() {
        $db_connect = new dbConnect();
        return $db_connect->sendQuery("SELECT * FROM `".$this->table."`");
    }

    public function getAnimalData() {
        $db_connect = new dbConnect();
        return $db_connect->sendQuery("SELECT * FROM `".$this->table."` WHERE `id_".$this->table."` = ".$this->id)[0];
    }

    public function update($col, $value) {
        $db_connect = new dbConnect();
        return $db_connect->update($this->table, $this->id, $col, $value);
    }

    public function declareDead($death_timestamp) {
        $db_connect = new dbConnect();
        return $db_connect->sendQuery("UPDATE `".$this->table."` SET `death_timestamp` = '".$death_timestamp."' WHERE `id_".$this->table."` = ".$this->id);
    }

    public function delete($id) {
        $db_connect = new dbConnect();
        $query = "DELETE FROM `".$this->table."` WHERE `id_".$this->table."` = '".$id."'";
        $db_connect->sendQuery($query);
    }

    public function countAnimals() {
        $db_connect = new dbConnect();
        return $db_connect->sendQuery("SELECT COUNT(*) as count_table FROM `".$this->table."`");
    }

    // Récupère prénom + nom à partir du usr_login
    public function getName() {
        $db_connect = new dbConnect();
        $result = $db_connect->sendQuery("SELECT `animal_name` FROM `".$this->table."` WHERE id_".$this->table." = '".$this->id."'");
        return $result[0]['animal_name'];
    }

    public function selectAll() {
        $db_connect = new dbConnect();
        return $db_connect->sendQuery("SELECT * FROM `".$this->table."`");
    }

    public function getColumnNames() {
        $db_connect = new dbConnect();
        return $db_connect->getColumnNames($this->table);
    }

    public function getColumnNamesAndInputType() {
        $db_connect = new dbConnect();
        return $db_connect->getColumnNamesAndInputType($this->table);
    }
}


?>