<?php

class semen extends controller {

    public function index_action() {          
        $modelSemen = new semenModel();
        $semen = $modelSemen->getSemen();
        $this->smarty->assign('semen', $semen); 
        $this->smarty->display('semen/semen.tpl');
    }
    
    public function novo(){        
        $id_semen = $this->getParam('id_semen');
        $registro = array();
        if ((bool) $id_semen) {
            //buscando o animal
            $modelSemen = new semenModel();
            $registro = $modelSemen->getSemen("id_semen = {$id_semen}");            
            $registro = $registro[0];            
        }
        
        //buscando animais
        $modelAnimais = new animalModel();
        $options_animais = array('' => 'SELECIONE');
        foreach ($modelAnimais->getAnimais() as $value) {
            $options_animais[$value['id_animal']] = $value['nome'];
        }        
        $this->smarty->assign('options_animais', $options_animais);
        $this->smarty->assign('registro', $registro);
        $this->smarty->display('semen/semenNovo.tpl');
    }
    
    public function gravar(){        
        $_POST['data_registro'] = implode("-",array_reverse(explode("/",$_POST['data_registro'])));
        $data['id_semen'] = isset($_POST['id_semen']) ? $_POST['id_semen'] : 0;
        $data['procedencia'] = isset($_POST['procedencia']) ? $_POST['procedencia'] : 0;
        $data['data_registro'] = isset($_POST['data_registro']) ? $_POST['data_registro'] : '';
        $data['id_animal'] = isset($_POST['animal']) ? $_POST['animal'] : 0;        
        
        //gravando os dados
        $modelSemen = new semenModel();
        if (!(bool) $data['id_semen']) {
            $modelSemen->setSemen($data);
        } else {
            $modelSemen->updSemen($data);
        }
        header('Location: /semen');        
    }
    
    public function excluir() {
        $id_semen = $this->getParam('id_semen');
        $data['id_semen'] = $id_semen;
        $modelSemen = new semenModel();
        $modelSemen->delSemen($data);
        header('Location: /semen');
    }
    
 
}
