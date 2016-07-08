<?php
/** 
 * Data that needs to be copied in news Model Entitys
 */


class fazendaModel extends model {
    
    var $tabPadrao = 'fazendas';
    var $campo_chave = 'id_fazenda';

    // An empty structure to create news Entitys 
    public function estrutura_vazia() {        
        $dados = null;
        $dados[0]['id_fazenda'] = NULL;
        $dados[0]['nome'] = NULL;
        $dados[0]['localidade'] = NULL;
        $dados[0]['area_total'] = NULL;
        $dados[0]['area_util'] = NULL;
        $dados[0]['cartao_produtor'] = NULL;
        $dados[0]['id_responsavel'] = NULL;
        return $dados;
    }

    
    /** Retrieve the Entity */
    public function getFazendas($where = null) {
        $select = array('f.id_fazenda,
                         f.nome,
                         f.localidade,
                         f.area_total,
                         f.area_util,
                         f.cartao_produtor,
                         f.id_responsavel,
                         r.nome as nomeResponsavel');
        return $this->read("{$this->tabPadrao} f left join usuarios r on r.id_usuario = f.id_responsavel", $select, $where, null, null, null, null);
    }

    /** Save a new Entity  */
    public function setFazenda($array) {

        $this->startTransaction();
        $id = $this->transaction($this->insert($this->tabPadrao, $array, false));
        $this->commit();
        return $id;
    }

    /** Update the Entity */
    public function updFazenda($array) {
        //Chave    
        $where = $this->campo_chave . " = " . $array[$this->campo_chave];
        $this->startTransaction();
        $this->transaction($this->update($this->tabPadrao, $array, $where));
        $this->commit();
        return true;
    }

     /** Remove the Entity */
    public function delFazenda($array) {
        //Key 
        $where = $this->campo_chave . " = " . $array[$this->campo_chave];        
        $this->startTransaction();
        $this->transaction($this->delete($this->tabPadrao,$where));
        $this->commit();
        return true;
    }

}

?>
