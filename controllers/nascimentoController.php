<?php

class nascimento extends controller {

    public function index_action() {
        if (util::isLogado()) {
            $modelNascimento = new nascimentoModel();
            $nascimentos = $modelNascimento->getNascimentos();
            $this->smarty->assign('nascimentos', $nascimentos);
            $this->smarty->display('nascimento/nascimento.tpl');
        } else {
            header('Location: /login');
        }
    }

    public function novo() {
        $id_nascimento = $this->getParam('id_nascimento');
        $registro = array();
        if ((bool) $id_nascimento) {
            //buscando o animal
            $modelNascimento = new nascimentoModel();
            $registro = $modelNascimento->getNascimentos("id_nascimento = {$id_nascimento}");
            $registro = $registro[0];
        }
        //buscando Fazendas
        $modelFazendas = new fazendaModel();
        $options_fazendas = array('' => 'SELECIONE');
        foreach ($modelFazendas->getFazendas() as $value) {
            $options_fazendas[$value['id_fazenda']] = $value['nome'];
        }
        $this->smarty->assign('options_fazendas', $options_fazendas);

        //sexo
        $options_sexo = array(
            "N" => "SELECIONE",
            "M" => "Macho",
            "F" => "Fêmea"
        );
        $this->smarty->assign('options_sexo', $options_sexo);

        //pai
        $modelAnimais = new animalModel();
        $options_pai = array('' => 'SELECIONE');
        foreach ($modelAnimais->getAnimais() as $value) {
            $options_pai[$value['id_animal']] = $value['nome'];
        }
        $this->smarty->assign('options_pai', $options_pai);

        //mae        
        $options_mae = array('' => 'SELECIONE');
        foreach ($modelAnimais->getAnimais() as $value) {
            $options_mae[$value['id_animal']] = $value['nome'];
        }
        $this->smarty->assign('options_mae', $options_mae);

        //semen        
        $modelSemen = new semenModel();
        $options_semen = array('' => 'SELECIONE');
        foreach ($modelSemen->getSemen() as $value) {
            $options_semen[$value['id_semen']] = $value['id_semen'];
        }
        $this->smarty->assign('options_semen', $options_semen);
        $this->smarty->assign('registro', $registro);
        $this->smarty->display('nascimento/nascimentoNovo.tpl');
    }

    public function gravar() {
        $_POST['data_registro'] = implode("-", array_reverse(explode("/", $_POST['data_registro'])));
        $_POST['data_nascimento'] = implode("-", array_reverse(explode("/", $_POST['data_nascimento'])));
        $data['id_nascimento'] = isset($_POST['id_nascimento']) ? $_POST['id_nascimento'] : 0;
        $data['data_registro'] = isset($_POST['data_registro']) ? $_POST['data_registro'] : '';
        $data['id_fazenda'] = isset($_POST['fazenda']) ? $_POST['fazenda'] : 0;
        $data['numero_brinco'] = isset($_POST['numero_brinco']) ? $_POST['numero_brinco'] : '';
        $data['nome'] = isset($_POST['nome']) ? $_POST['nome'] : '';
        $data['sexo'] = isset($_POST['sexo']) ? $_POST['sexo'] : '';
        $data['data_nascimento'] = isset($_POST['data_nascimento']) ? $_POST['data_nascimento'] : '';
        $data['tipo_registro'] = isset($_POST['tipo_registro']) ? $_POST['tipo_registro'] : '';
        $data['id_pai'] = isset($_POST['pai']) ? $_POST['pai'] : '';
        $data['id_mae'] = isset($_POST['mae']) ? $_POST['mae'] : '';
        $data['id_semen'] = isset($_POST['semen']) ? $_POST['semen'] : '';

        //var_dump($data);die;
        //gravando os dados
        $modelNascimento = new nascimentoModel();
        if (!(bool) $data['id_nascimento']) {
            $modelNascimento->setNascimento($data);
        } else {
            $modelNascimento->updNascimento($data);
        }
        header('Location: /nascimento');
    }

    public function excluir() {
        $id_nascimento = $this->getParam('id_nascimento');
        $data['id_nascimento'] = $id_nascimento;
        $modelNascimento = new nascimentoModel();
        $modelNascimento->delNascimento($data);
        header('Location: /nascimento');
    }

}
