<?php

class consulta extends controller {

    public function index_action() {
        if (util::isLogado()) {
            $modelConsulta = new consultaModel();
            $consultas = $modelConsulta->getConsultas();
            $this->smarty->assign('consultas', $consultas);
            $this->smarty->display('consulta/consulta.tpl');
        } else {
            header('Location: /login');
        }
    }

    public function novo() {
        $id_consulta = $this->getParam('id_consulta');
        $registro = array();
        if ((bool) $id_consulta) {
            //buscando o animal
            $modelConsulta = new consultaModel();
            $registro = $modelConsulta->getConsultas("id_consulta = {$id_consulta}");
            $registro = $registro[0];
        }

        //buscando fazendas
        $modelFazendas = new fazendaModel();
        $options_fazendas = array('' => 'SELECIONE');
        foreach ($modelFazendas->getFazendas() as $value) {
            $options_fazendas[$value['id_fazenda']] = $value['nome'];
        }
        $this->smarty->assign('options_fazendas', $options_fazendas);

        //buscando animais
        $modelAnimais = new animalModel();
        $options_animais = array('' => 'SELECIONE');
        foreach ($modelAnimais->getAnimais() as $value) {
            $options_animais[$value['id_animal']] = $value['nome'];
        }
        $this->smarty->assign('options_animais', $options_animais);

        //buscando crias        
        $options_crias = array('' => 'SELECIONE');
        foreach ($modelAnimais->getAnimais() as $value) {
            $options_crias[$value['id_animal']] = $value['nome'];
        }

        $options_tipo_registro = array(
            "0" => "SELECIONE",
            "1" => "Vacina",
            "2" => "Maternidade",
            "3" => "Inseminação",
            "4" => "Veterinário",
            "5" => "Pesagem",
            "6" => "Transferência"
        );

        $this->smarty->assign('options_tipo_registro', $options_tipo_registro);
        $this->smarty->assign('options_crias', $options_crias);
        $this->smarty->assign('registro', $registro);
        $this->smarty->display('consulta/consultaNovo.tpl');
    }

    public function gravar() {
        $_POST['data_registro'] = implode("-", array_reverse(explode("/", $_POST['data_registro'])));
        $data['id_consulta'] = isset($_POST['id_consulta']) ? $_POST['id_consulta'] : '';
        $data['data_registro'] = isset($_POST['data_registro']) ? $_POST['data_registro'] : '';
        $data['id_animal'] = isset($_POST['animal']) ? $_POST['animal'] : '';
        $data['idade'] = isset($_POST['idade']) ? $_POST['idade'] : 0;
        $data['tipo_registro'] = isset($_POST['tipo_registro']) ? $_POST['tipo_registro'] : 0;
        $data['id_fazenda'] = isset($_POST['fazenda']) ? $_POST['fazenda'] : '';
        $data['peso_atual'] = isset($_POST['peso_atual']) ? $_POST['peso_atual'] : 0;
        $data['cria'] = isset($_POST['cria']) ? $_POST['cria'] : 0;
        $data['descricao'] = isset($_POST['descricao']) ? $_POST['descricao'] : 0;
        //gravando os dados
        $modelConsulta = new consultaModel();
        if (!(bool) $data['id_consulta']) {
            $modelConsulta->setConsulta($data);
        } else {
            $modelConsulta->updConsulta($data);
        }
        header('Location: /consulta');
    }

    public function excluir() {
        $id_consulta = $this->getParam('id_consulta');
        $data['id_consulta'] = $id_consulta;
        $modelConsulta = new consultaModel();
        $modelConsulta->delConsulta($data);
        header('Location: /consulta');
    }

    public function relatorio() {
        //buscando as Fazendas
        $modelFazendas = new fazendaModel();
        $options_fazendas = array('0' => 'TODAS');
        foreach ($modelFazendas->getFazendas() as $value) {
            $options_fazendas[$value['id_fazenda']] = $value['nome'];
        }

        $this->smarty->assign('options_fazendas', $options_fazendas);
        $this->smarty->display('relatorios/pre_relatorio_consultas.tpl');
    }

    public function rel_consulta() {
        $fazenda = isset($_POST['fazenda']) ? $_POST['fazenda'] : 0;
        $this->relatorioGeral($fazenda);
    }

    public function relatorioGeral($id_fazenda) {
        $modelFazendas = new fazendaModel();
        if ($id_fazenda == 0) {
            $fazendas = $modelFazendas->getFazendas();
        } else {
            $fazendas = $modelFazendas->getFazendas("f.id_fazenda = {$id_fazenda}");
        }
        foreach ($fazendas as $fazenda) {
            $where = "c.id_fazenda = {$fazenda['id_fazenda']}";
//            if (!empty($data_inicial) && !empty($data_final)) {
//                $where = $where . " and a.data_registro >= '{$data_inicial}' and a.data_registro <= '{$data_final}'";
//            }
            $modelConsultas = new consultaModel();
            $consultasTemp = array();
            //busca as crias
            $consultas = $modelConsultas->getConsultasAnimais($where);
            foreach ($consultas as $consulta) {
                switch ($consulta['tipo_registro']) {
                    case 0:
                        $consulta['tipo_registro'] = 'Vazio';
                        break;
                    case 1:
                        $consulta['tipo_registro'] = 'Vacina';
                        break;
                    case 2:
                        $consulta['tipo_registro'] = 'Maternidade';
                        break;
                    case 3:
                        $consulta['tipo_registro'] = 'Inseminação';
                        break;
                    case 4:
                        $consulta['tipo_registro'] = 'Veterinário';
                        break;
                    case 5:
                        $consulta['tipo_registro'] = 'Pesagem';
                        break;
                    case 6:
                        $consulta['tipo_registro'] = 'Transferência';
                        break;
                }
                //var_dump($consulta);die;
                $consultasTemp[] = array(
                    "numero_brinco" => $consulta['numero_brinco'],
                    "data_nascimento" => $consulta['data_nascimento'],
                    "sexo" => $consulta['sexo'],
                    "idade" => $consulta['idade'],
                    "tipo_registro" => $consulta['tipo_registro'],
                    "data_registro" => $consulta['data_registro'],
                    "peso_atual" => $consulta['peso_atual'],
                    "semen" => $consulta['id_semen'],
                    "descricao" => $consulta['descricao']
                );
            }
            $registros[] = array(
                "nome_fazenda" => $fazenda["nome"],
                "consultas" => $consultasTemp
            );
        }
        //print_r($registros);die;
        $this->smarty->assign('registros', $registros);
        $this->smarty->display('relatorios/consultaGeral.tpl');
    }

}
