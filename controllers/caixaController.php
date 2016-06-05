<?php

class caixa extends controller {

    public function index_action() {   
            
         $this->smarty->display('caixa/caixa.tpl');
    }
    
    public function novo(){
        //buscando as Fazendas
        $modelFazendas = new fazendaModel();
        $options_fazendas = array('' => 'SELECIONE');
        foreach ($modelFazendas->getFazendas() as $value) {
            $options_fazendas[$value['id_fazenda']] = $value['nome'];
        }
        $this->smarty->assign('options_fazendas', $options_fazendas);
        
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
        $modelCaixa = new caixaModel();
        $modelCaixa->setCaixa($data);
        
        header('Location: /caixa');
    }
    
 
}
