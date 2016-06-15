<?php

class animal extends controller {

    public function index_action() {
        if (util::isLogado()) {
            $modelAnimal = new animalModel();
            $animais = $modelAnimal->getAnimais();
            $this->smarty->assign('animais', $animais);
            $this->smarty->display('animal/animal.tpl');
        } else {
            header('Location: /login');
        }
    }

    public function novo() {
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

        $modelAnimais = new animalModel();
        //buscando as Maes        
        $options_animais_pais = array('' => 'SELECIONE');
        foreach ($modelAnimais->getAnimais() as $value) {
            $options_animais_pais[$value['id_animal']] = $value['nome'];
        }
        $this->smarty->assign('options_animais_pais', $options_animais_pais);

        //buscando os Pais        
        $options_animais_maes = array('' => 'SELECIONE');
        foreach ($modelAnimais->getAnimais() as $value) {
            $options_animais_maes[$value['id_animal']] = $value['nome'];
        }
        $this->smarty->assign('options_animais_maes', $options_animais_maes);

        //buscando Semen
        $modelSemen = new semenModel();
        $options_semen = array('' => 'SELECIONE');
        foreach ($modelSemen->getSemen() as $value) {
            $options_semen[$value['id_semen']] = $value['id_semen'];
        }
        $this->smarty->assign('options_semen', $options_semen);

        $options_sexo = array(
            "N" => "SELECIONE",
            "M" => "Macho",
            "F" => "Fêmea"
        );
        $options_tipo_registro = array(
            "0" => "SELECIONE",
            "1" => "Natural",
            "2" => "Inseminado",
            "3" => "Compra",
            "4" => "Transferido"
        );
        $this->smarty->assign('options_sexo', $options_sexo);
        $this->smarty->assign('options_tipo_registro', $options_tipo_registro);
        $this->smarty->assign('registro', $registro);
        $this->smarty->display('animal/animalNovo.tpl');
    }

    public function gravar() {
        //var_dump($_POST);
        $_POST['data_registro'] = implode("-", array_reverse(explode("/", $_POST['data_registro'])));
        $_POST['data_nascimento'] = implode("-", array_reverse(explode("/", $_POST['data_nascimento'])));
        $_POST['data_descontinuado'] = implode("-", array_reverse(explode("/", $_POST['data_descontinuado'])));
        $data['id_animal'] = isset($_POST['id_animal']) ? $_POST['id_animal'] : 0;
        $data['data_registro'] = isset($_POST['data_registro']) ? $_POST['data_registro'] : '';
        $data['id_fazenda'] = isset($_POST['fazenda']) ? $_POST['fazenda'] : 0;
        $data['numero_brinco'] = isset($_POST['numero_brinco']) ? $_POST['numero_brinco'] : '';
        $data['nome'] = isset($_POST['nome']) ? $_POST['nome'] : '';
        $data['sexo'] = isset($_POST['sexo']) ? $_POST['sexo'] : '';
        $data['data_nascimento'] = isset($_POST['data_nascimento']) ? $_POST['data_nascimento'] : '';
        $data['peso'] = isset($_POST['peso']) ? $_POST['peso'] : 0;
        $data['tipo_registro'] = isset($_POST['tipo_registro']) ? $_POST['tipo_registro'] : '';
        $data['id_mae'] = isset($_POST['id_mae']) ? $_POST['id_mae'] : '';
        $data['id_semen'] = isset($_POST['id_semen']) ? $_POST['id_semen'] : '';
        $data['id_pai'] = isset($_POST['id_pai']) ? $_POST['id_pai'] : '';
        $data['procedencia'] = isset($_POST['procedencia']) ? $_POST['procedencia'] : '';
        $data['caracteristicas'] = isset($_POST['caracteristicas']) ? $_POST['caracteristicas'] : '';
        $data['obs'] = isset($_POST['observacao']) ? $_POST['observacao'] : '';
        $data['data_descontinuado'] = isset($_POST['data_descontinuado']) ? $_POST['data_descontinuado'] : '';
        $data['flag_descontinuado'] = isset($_POST['descontinuado']) ? 1 : 2;
        $data['motivo_descontinuado'] = isset($_POST['motivo_descontinuado']) ? $_POST['motivo_descontinuado'] : '';
        
        //var_dump($data);die;

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

    public function relatorio() {
        //buscando as Fazendas
        $modelFazendas = new fazendaModel();
        $options_fazendas = array('0' => 'TODAS');
        foreach ($modelFazendas->getFazendas() as $value) {
            $options_fazendas[$value['id_fazenda']] = $value['nome'];
        }
        $this->smarty->assign('options_fazendas', $options_fazendas);
        $this->smarty->display('relatorios/pre_relatorio_animais.tpl');
    }

    public function rel_animal() {
        //var_dump($_POST);die;
        //busca as fazendas e os animais delas
        $modelFazendas = new fazendaModel();
        $fazendas = $modelFazendas->getFazendas();
        foreach ($fazendas as $fazenda) {
            $modelAnimais = new animalModel();
            $regAnimais = $modelAnimais->getAnimais(" id_fazenda = {$fazenda["id_fazenda"]}");
            $animais = array();
            foreach ($regAnimais as $animal) {
                $animais[] = array(
                    "numero_brinco" => $animal['numero_brinco'],
                    "nome" => $animal['nome'],
                    "sexo" => $animal['sexo'],
                    "classificacao" => "",
                    "data_nascimento" => $animal['data_nascimento'],
                    "idade" => "",
                    "peso" => $animal['peso'],
                    "observacao" => $animal['obs'],
                );
            }
            $registros[] = array(
                "id_fazenda" => $fazenda["id_fazenda"],
                "nome_fazenda" => $fazenda["nome"],
                "animais" => $animais
            );
        }
        $this->smarty->assign('registros', $registros);
        $this->smarty->display('relatorios/relatorio_animais.tpl');        
    }

}
