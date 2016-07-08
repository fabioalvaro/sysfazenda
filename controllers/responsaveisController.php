<?php

class responsaveis extends controller {

    public function index_action() {        
        if (util::isLogado()) {
            $modelUsuario = new usuarioModel();
            $usuarios = $modelUsuario->getUsuarios();
            $this->smarty->assign('usuarios', $usuarios);
            $this->smarty->display('responsaveis/responsaveis.tpl');
        } else {
            header('Location: /login');
        }
    }
    
//    public function relatorio() {
//        //buscando as Fazendas
//        $modelFazendas = new fazendaModel();
//        $options_fazendas = array('0' => 'TODAS');
//        foreach ($modelFazendas->getFazendas() as $value) {
//            $options_fazendas[$value['id_fazenda']] = $value['nome'];
//        }
//
//        $this->smarty->assign('options_fazendas', $options_fazendas);
//        $this->smarty->display('relatorios/pre_relatorio_caixa.tpl');
//    }
//    
//    public function rel_caixa() {
//        //var_dump($_POST);die;        
//        $fazenda     = isset($_POST['fazenda']) ? $_POST['fazenda'] : 0;
//        $dataInicial = isset($_POST['data_inicial']) ? implode("-", array_reverse(explode("/", $_POST['data_inicial']))) : '';
//        $dataFinal   = isset($_POST['data_final']) ? implode("-", array_reverse(explode("/", $_POST['data_final']))) : '';
//        $this->relatorioGeral($fazenda,$dataInicial,$dataFinal);
//    }
//    
//    public function relatorioGeral($id_fazenda,$dataInicial,$dataFinal) {
//        $modelFazendas = new fazendaModel();
//        if ($id_fazenda == 0) {
//            $fazendas = $modelFazendas->getFazendas();
//        } else {
//            $fazendas = $modelFazendas->getFazendas("f.id_fazenda = {$id_fazenda}");
//        }       
//        foreach ($fazendas as $fazenda) {
//            $where = "c.id_fazenda = {$fazenda['id_fazenda']}";
//            if (!empty($dataInicial) && !empty($dataFinal)) {
//                $where = $where . " and c.data_registro >= '{$dataInicial}' and c.data_registro <= '{$dataFinal}'";
//            }
//            $modelCaixa = new caixaModel();
//            $caixasTemp = array();
//            //busca as crias            
//            $lancamentos = $modelCaixa->getCaixas($where);            
//            $saldo = 0;
//            foreach ($lancamentos as $lancamento) {
//                $saldo = $saldo + $lancamento['valor'];
//                $caixasTemp[] = array(
//                    "data_registro" => $lancamento['data_registro'],
//                    "historico" => $lancamento['historico'],
//                    "valor" => $lancamento['valor']
//                );
//            }
//            $registros[] = array(
//                "nome_fazenda" => $fazenda["nome"],
//                "caixas" => $caixasTemp,
//                "saldoFinal" => $saldo
//            );
//        }
//        //print_r($registros);die;
//        $this->smarty->assign('registros', $registros);
//        $this->smarty->display('relatorios/caixa.tpl');
//    }
//    
    
    public function novo() {
        //var_dump($_GET);die;
        $id_usuario = $this->getParam('id_usuario');
        $registro = array();
        if ((bool) $id_usuario) {
            //buscando o animal
            $modelUsuario = new usuarioModel();
            $registro = $modelUsuario->getUsuarios("id_usuario = {$id_usuario}");
            $registro = $registro[0];
        }        
        $this->smarty->assign('registro', $registro);
        $this->smarty->display('responsaveis/responsaveisNovo.tpl');
    }

    public function gravar() {
        //var_dump($_POST);die;        
        $data['id_usuario'] = isset($_POST['id_usuario']) ? $_POST['id_usuario'] : 0;
        $data['nome'] = isset($_POST['nome']) ? $_POST['nome'] : '';
        $data['cpf'] = isset($_POST['cpf']) ? $_POST['cpf'] : 0;
        $data['usuario'] = isset($_POST['usuario']) ? $_POST['usuario'] : '';
        $data['senha'] = isset($_POST['senha']) ? $_POST['senha'] : '';

        //var_dump($data);die;        
        //gravando os dados
        $modelUsuario = new usuarioModel();
        if (!(bool) $data['id_usuario']) {
            $modelUsuario->setUsuario($data);
        } else {
            $modelUsuario->updUsuario($data);
        }
        header('Location: /responsaveis');
    }

    public function excluir() {
        $id_caixa = $this->getParam('id_caixa');
        $data['id_caixa'] = $id_caixa;
        $modelCaixa = new caixaModel();
        $modelCaixa->delCaixa($data);
        header('Location: /caixa');
    }

}
