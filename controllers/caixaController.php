<?php

class caixa extends controller {

    public function index_action() {   
        $modelCaixa = new caixaModel();
        $caixas = $modelCaixa->getCaixas();
        $this->smarty->assign('caixas', $caixas);    
        $this->smarty->display('caixa/caixa.tpl');
    }
    
    public function novo(){
        //var_dump($_GET);die;
        $id_caixa = $this->getParam('id_caixa');        
        $registro = array();
        if ((bool) $id_caixa) {
            //buscando o animal
            $modelCaixa = new caixaModel();
            $registro = $modelCaixa->getCaixas("id_caixa = {$id_caixa}");            
            $registro = $registro[0];            
        }
        //buscando as Fazendas
        $modelFazendas = new fazendaModel();
        $options_fazendas = array('' => 'SELECIONE');
        foreach ($modelFazendas->getFazendas() as $value) {
            $options_fazendas[$value['id_fazenda']] = $value['nome'];
        }
        $this->smarty->assign('options_fazendas', $options_fazendas);
        $this->smarty->assign('registro', $registro);
        $this->smarty->display('caixa/caixaNovo.tpl');
    }
    
    public function gravar(){
       // var_dump($_POST);die;
        $_POST['data_registro'] = implode("-",array_reverse(explode("/",$_POST['data_registro'])));        
        $data['id_caixa']       = isset($_POST['id_caixa']) ? $_POST['id_caixa'] : 0;
        $data['data_registro']  = isset($_POST['data_registro']) ? $_POST['data_registro'] : '';
        $data['historico']      = isset($_POST['historico']) ? $_POST['historico'] : 0;
        $data['valor']          = isset($_POST['valor']) ? $_POST['valor'] : '';
        $data['id_fazenda']     = isset($_POST['fazenda']) ? $_POST['fazenda'] : '';        
        
        //var_dump($data);die;
        //gravando os dados
        //gravando os dados
        $modelCaixa = new caixaModel();
        if (!(bool) $data['id_caixa']) {
            $modelCaixa->setCaixa($data);
        } else {
            $modelCaixa->updCaixa($data);
        }
        header('Location: /caixa');
    }
    
    public function excluir() {
        $id_caixa = $this->getParam('id_caixa');
        $data['id_caixa'] = $id_caixa;
        $modelCaixa = new caixaModel();
        $modelCaixa->delCaixa($data);
        header('Location: /caixa');
    }
    
 
}
