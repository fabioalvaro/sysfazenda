<?php
/** 
 * Data that needs to be copied in news Model Entitys
 */


class animalModel extends model {
    
    var $tabPadrao = 'animais';
    var $campo_chave = 'id_animal';

    // An empty structure to create news Entitys 
    public function estrutura_vazia() {
        $dados = null;
        $dados[0]['id'] = NULL;
        $dados[0]['name'] = NULL;
        $dados[0]['created'] = NULL;
        $dados[0]['active'] = NULL;        
        return $dados;
    }

    
    /** Retrieve the Entity */
    public function getAnimais($where = null) {
        $select = array('*');
        return $this->read($this->tabPadrao, $select, $where, null, null, null, null);
    }
    
    public function relAnimais(){
        $table = "";
        $fields = array('*');
        $where = "";
        return $this->read($table, $fields, $where, null, null, null, null);
    }

    /** Save a new Entity  */
    public function setAnimal($array) {

        $this->startTransaction();
        $id = $this->transaction($this->insert($this->tabPadrao, $array, false));
        $this->commit();
        return $id;
    }

    /** Update the Entity */
    public function updAnimal($array) {
        //Chave    
        $where = $this->campo_chave . " = " . $array[$this->campo_chave];
        $this->startTransaction();
        $this->transaction($this->update($this->tabPadrao, $array, $where));
        $this->commit();
        return true;
    }

     /** Remove the Entity */
    public function delAnimal($array) {
        //Key 
        $where = $this->campo_chave . " = " . $array[$this->campo_chave];        
        $this->startTransaction();
        $this->transaction($this->delete($this->tabPadrao,$where));
        $this->commit();
        return true;
    }

}

?>
