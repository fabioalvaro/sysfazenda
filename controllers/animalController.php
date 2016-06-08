<?php

class animal extends controller {

    public function index_action() {             
        $modelAnimal = new animalModel();
        $animais = $modelAnimal->getAnimais();
        $this->smarty->assign('animais', $animais); 
        $this->smarty->display('animal/animal.tpl');
    }
    
    public function novo(){
        $id_animal = $this->getParam('id_animal');
        $registro = array();
        if ((bool) $id_animal) {
            //buscando o animal
            $modelAnimal = new animalModel();
            $registro = $modelAnimal->getAnimais("id_animal = {$id_animal}");
            $registro = $registro[0];
        }
        //buscando as Fazendas
        $modelFazendas = new fazendaModel();
        $options_fazendas = array('' => 'SELECIONE');
        foreach ($modelFazendas->getFazendas() as $value) {
            $options_fazendas[$value['id_fazenda']] = $value['nome'];
        }
        $this->smarty->assign('options_fazendas', $options_fazendas);
        
        $options_sexo = array(
            "N" => "SELECIONE",
            "M" => "Macho",
            "F" => "Fêmea"
        );
        $this->smarty->assign('options_sexo', $options_sexo);
        $this->smarty->assign('registro', $registro);
        $this->smarty->display('animal/animalNovo.tpl');
    }
    
    public function gravar(){
        //var_dump($_POST);
        $_POST['data_registro'] = implode("-",array_reverse(explode("/",$_POST['data_registro'])));
        $_POST['data_nascimento'] = implode("-",array_reverse(explode("/",$_POST['data_nascimento'])));
        $data['id_animal']          = isset($_POST['id_animal']) ? $_POST['id_animal'] : 0;
        $data['data_registro']      = isset($_POST['data_registro']) ? $_POST['data_registro'] : '';
        $data['id_fazenda']         = isset($_POST['fazenda']) ? $_POST['fazenda'] : 0;
        $data['numero_brinco']      = isset($_POST['numero_brinco']) ? $_POST['numero_brinco'] : '';
        $data['nome']               = isset($_POST['nome']) ? $_POST['nome'] : '';
        $data['sexo']               = isset($_POST['sexo']) ? $_POST['sexo'] : '';
        $data['data_nascimento']    = isset($_POST['data_nascimento']) ? $_POST['data_nascimento'] : '';
        $data['peso']               = isset($_POST['peso']) ? $_POST['peso'] : 0;
        $data['tipo_registro']      = isset($_POST['tipo_registro']) ? $_POST['tipo_registro'] : '';
        $data['numero_brinco_mae']  = isset($_POST['numero_brinco_mae'])?$_POST['numero_brinco_mae']:'';
        $data['semen']              = isset($_POST['semen'])?$_POST['semen']:'';
        $data['numero_brinco_pai']  = isset($_POST['numero_brinco_pai'])?$_POST['numero_brinco_pai']:'';
        $data['procedencia']        = isset($_POST['procedencia'])?$_POST['procedencia']:'';
        $data['caracteristicas']    = isset($_POST['caracteristicas'])?$_POST['caracteristicas']:'';
        $data['obs']                = isset($_POST['observacao'])?$_POST['observacao']:'';
        
        //var_dump($data);die;
        //gravando os dados
        $modelAnimal = new animalModel();
        if (!(bool) $data['id_animal']) {
            $modelAnimal->setAnimal($data);
        } else {
            $modelAnimal->updAnimal($data);
        }
        header('Location: /animal');
        
    }
    
    public function excluir() {
        $id_animal = $this->getParam('id_animal');
        $data['id_animal'] = $id_animal;
        $modelAnimal = new animalModel();
        $modelAnimal->delAnimal($data);
        header('Location: /animal');
    }
}
