<?php

class fazenda extends controller {

    public function index_action() {               
         $this->smarty->display('fazenda/fazenda.tpl');
    }
    
    public function novo(){
        //buscando responsaveis
        $modelResponsaveis = new responsavelModel();
        $options_responsaveis = array('' => 'SELECIONE');
        foreach ($modelResponsaveis->getResponsavel() as $value) {
            $options_responsaveis[$value['id_responsavel']] = $value['nome'];
        }
        $this->smarty->assign('options_responsaveis', $options_responsaveis);
        
        $this->smarty->display('fazenda/fazendaNovo.tpl');
    }
    
    public function gravar(){        
        //var_dump($_POST);die;
        $data['nome']            = isset($_POST['nome']) ? $_POST['nome'] : '';
        $data['localidade']      = isset($_POST['localidade']) ? $_POST['localidade'] : '';
        $data['area_total']      = isset($_POST['area_total']) ? $_POST['area_total'] : 0;
        $data['area_util']       = isset($_POST['area_util']) ? $_POST['area_util'] : 0;
        $data['cartao_produtor'] = isset($_POST['cartaoProdutor']) ? $_POST['cartaoProdutor'] : '';
        $data['id_responsavel']  = isset($_POST['responsavel']) ? $_POST['responsavel'] : 0;
        
        if($data['nome'] != ''){
            $modelFazenda = new fazendaModel();
            $modelFazenda->setFazenda($data);
        }
        header('Location: /fazenda');
    }
    
 
}
