<?php
/** 
 * Data that needs to be copied in news Model Entitys
 */


class centro_custoModel extends model {
    
    var $tabPadrao = 'centro_custo';
    var $campo_chave = 'id_centro_custo';

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
    public function getCentro_custos($where = null) {
        $select = array("c.id_centro_custo,
                         c.id_fazenda,
                         c.descricao,
                         f.nome");
        return $this->read("$this->tabPadrao c left join fazendas f on f.id_fazenda = c.id_fazenda" , $select, $where, null, null, null, null);
    }

    /** Save a new Entity  */
    public function setCentro_custo($array) {

        $this->startTransaction();
        $id = $this->transaction($this->insert($this->tabPadrao, $array, false));
        $this->commit();
        return $id;
    }

    /** Update the Entity */
    public function updCentro_custo($array) {
        //Chave    
        $where = $this->campo_chave . " = " . $array[$this->campo_chave];
        $this->startTransaction();
        $this->transaction($this->update($this->tabPadrao, $array, $where));
        $this->commit();
        return true;
    }

     /** Remove the Entity */
    public function delCentro_custo($array) {
        //Key 
        $where = $this->campo_chave . " = " . $array[$this->campo_chave];        
        $this->startTransaction();
        $this->transaction($this->delete($this->tabPadrao, $where));
        $this->commit();
        return true;
    }

}
