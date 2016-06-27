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

    public function getNascimentosPorData(){
        $select = array('c.data_registro,count(*) as total');
        $where = "c.tipo_registro = 2";
        return $this->read("{$this->tabPadrao} c", $select, $where, "c.data_registro", "30", null, null);
    }    
    
    /** Retrieve the Entity */
    public function getConsultas($where = null) {
        $select = array('c.id_consulta,
                         c.data_registro,
                         c.id_animal,
                         c.idade,
                         c.descricao,
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

    public function getConsultasAnimais($where = null) {
        $select = array('a.numero_brinco,
                         a.data_nascimento,
                         a.sexo,
                         c.idade,
                         c.tipo_registro,
                         c.data_registro,
                         c.peso_atual,
                         a.id_semen,
                         c.descricao');
        return $this->read("{$this->tabPadrao} c 
                            left join animais a on a.id_animal = c.id_animal", $select, $where, null, null, null, "a.id_animal,c.data_registro desc");
    }

}

?>
