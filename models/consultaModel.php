<?php
/** 
 * Data that needs to be copied in news Model Entitys
 */


class consultaModel extends model {
    
    var $tabPadrao = 'consultas';
    var $campo_chave = 'id_consulta';

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
    public function getConsultas($where = null) {
        $select = array('c.id_consulta,
                         c.data_registro,
                         c.id_animal,
                         c.idade,
                         c.tipo_registro,
                         c.id_fazenda,
                         c.peso_atual,
                         c.cria,
                         f.nome as nomeFazenda,
                         a.nome as nomeAnimal');
        return $this->read("{$this->tabPadrao} c 
                            left join fazendas f on c.id_fazenda = f.id_fazenda
                            left join animais a on a.id_animal = c.id_animal", $select, $where, null, null, null, null);
    }

    /** Save a new Entity  */
    public function setConsulta($array) {

        $this->startTransaction();
        $id = $this->transaction($this->insert($this->tabPadrao, $array, false));
        $this->commit();
        return $id;
    }

    /** Update the Entity */
    public function updConsulta($array) {
        //Chave    
        $where = $this->campo_chave . " = " . $array[$this->campo_chave];
        $this->startTransaction();
        $this->transaction($this->update($this->tabPadrao, $array, $where));
        $this->commit();
        return true;
    }

     /** Remove the Entity */
    public function delConsulta($array) {
        //Key 
        $where = $this->campo_chave . " = " . $array[$this->campo_chave];        
        $this->startTransaction();
        $this->transaction($this->delete($this->tabPadrao, $where));
        $this->commit();
        return true;
    }

}

?>
