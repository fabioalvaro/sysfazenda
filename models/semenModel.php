<?php
/** 
 * Data that needs to be copied in news Model Entitys
 */


class semenModel extends model {
    
    var $tabPadrao = 'semen';
    var $campo_chave = 'id_semen';

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
    public function getSemen($where = null) {
        $select = array('s.id_semen,
                         s.data_registro,
                         s.id_animal,
                         s.procedencia,
                         a.nome as nomeAnimal');
        return $this->read("{$this->tabPadrao} s left join animais a on a.id_animal = s.id_animal", $select, $where, null, null, null, null);
    }

    /** Save a new Entity  */
    public function setSemen($array) {

        $this->startTransaction();
        $id = $this->transaction($this->insert($this->tabPadrao, $array, false));
        $this->commit();
        return $id;
    }

    /** Update the Entity */
    public function updSemen($array) {
        //Chave    
        $where = $this->campo_chave . " = " . $array[$this->campo_chave];
        $this->startTransaction();
        $this->transaction($this->update($this->tabPadrao, $array, $where));
        $this->commit();
        return true;
    }

     /** Remove the Entity */
    public function delSemen($array) {
        //Key 
        $where = $this->campo_chave . " = " . $array[$this->campo_chave];        
        $this->startTransaction();
        $this->transaction($this->delete($this->tabPadrao, $where));
        $this->commit();
        return true;
    }

}

?>
