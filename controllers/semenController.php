<?php

class semen extends controller {

    public function index_action() {          
        
        $this->smarty->display('semen/semen.tpl');
    }
    
    public function novo(){
        //buscando animais
        $modelAnimais = new animalModel();
        $options_animais = array('' => 'SELECIONE');
        foreach ($modelAnimais->getAnimais() as $value) {
            $options_animais[$value['id_animal']] = $value['nome'];
        }        
        $this->smarty->assign('options_animais', $options_animais);          
        $this->smarty->display('semen/semenNovo.tpl');
    }
    
    public function gravar(){        
        $_POST['data_registro'] = implode("-",array_reverse(explode("/",$_POST['data_registro'])));
        $data['id_semen'] = isset($_POST['id_semen']) ? $_POST['id_semen'] : 0;
        $data['data_registro'] = isset($_POST['data_registro']) ? $_POST['data_registro'] : '';
        $data['id_animal'] = isset($_POST['animal']) ? $_POST['animal'] : 0;        
        $modelSemen = new semenModel();
        $modelSemen->setSemen($data);
        
        header('Location: /semen');
        
    }
    
 
}
