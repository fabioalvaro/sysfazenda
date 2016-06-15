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
        $select = array('a.id_animal,
                         a.data_registro,
                         a.id_fazenda,
                         a.numero_brinco,
                         a.nome,
                         a.sexo,
                         a.data_nascimento,
                         a.peso,
                         a.tipo_registro,
                         a.procedencia,
                         a.caracteristicas,
                         a.obs,
                         a.id_mae,
                         a.id_pai,
                         a.id_semen,
                         a.flag_descontinuado,
                         a.data_descontinuado,
                         a.motivo_descontinuado,
                         f.nome as nomeFazenda');
        return $this->read("{$this->tabPadrao} a left join fazendas f on f.id_fazenda = a.id_fazenda", $select, $where, null, null, null, null);
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
