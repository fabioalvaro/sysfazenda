<?php
/** 
 * Data that needs to be copied in news Model Entitys
 */


class caixaModel extends model {
    
    var $tabPadrao = 'caixa';
    var $campo_chave = 'id_caixa';

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
    public function getCaixas($where = null) {
        $select = array('c.id_caixa,
                         c.data_registro,
                         c.historico,
                         c.valor,
                         c.id_fazenda,
                         c.id_centro_custo,
                         ce.descricao,
                         f.nome as nomeFazenda');
        return $this->read("$this->tabPadrao c left join fazendas f on f.id_fazenda = c.id_fazenda left join centro_custo ce on ce.id_centro_custo = c.id_centro_custo" , $select, $where, null, null, null, null);
    }

    /** Save a new Entity  */
    public function setCaixa($array) {

        $this->startTransaction();
        $id = $this->transaction($this->insert($this->tabPadrao, $array, false));
        $this->commit();
        return $id;
    }

    /** Update the Entity */
    public function updCaixa($array) {
        //Chave    
        $where = $this->campo_chave . " = " . $array[$this->campo_chave];
        $this->startTransaction();
        $this->transaction($this->update($this->tabPadrao, $array, $where));
        $this->commit();
        return true;
    }

     /** Remove the Entity */
    public function delCaixa($array) {
        //Key 
        $where = $this->campo_chave . " = " . $array[$this->campo_chave];        
        $this->startTransaction();
        $this->transaction($this->delete($this->tabPadrao, $where));
        $this->commit();
        return true;
    }

}

?>
