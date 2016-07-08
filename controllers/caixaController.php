<?php

class caixa extends controller {

    public function index_action() {
        if (util::isLogado()) {
            $modelCaixa = new caixaModel();
            $caixas = $modelCaixa->getCaixas();
            $this->smarty->assign('caixas', $caixas);
            $this->smarty->display('caixa/caixa.tpl');
        } else {
            header('Location: /login');
        }
    }
    
    public function relatorio() {
        //buscando as Fazendas
        $modelFazendas = new fazendaModel();
        $options_fazendas = array('0' => 'TODAS');
        foreach ($modelFazendas->getFazendas() as $value) {
            $options_fazendas[$value['id_fazenda']] = $value['nome'];
        }

        $this->smarty->assign('options_fazendas', $options_fazendas);
        $this->smarty->display('relatorios/pre_relatorio_caixa.tpl');
    }
    
    public function rel_caixa() {
        //var_dump($_POST);die;        
        $fazenda     = isset($_POST['fazenda']) ? $_POST['fazenda'] : 0;
        $dataInicial = isset($_POST['data_inicial']) ? implode("-", array_reverse(explode("/", $_POST['data_inicial']))) : '';
        $dataFinal   = isset($_POST['data_final']) ? implode("-", array_reverse(explode("/", $_POST['data_final']))) : '';
        $this->relatorioGeral($fazenda,$dataInicial,$dataFinal);
    }
    
    public function relatorioGeral($id_fazenda,$dataInicial,$dataFinal) {
        $modelFazendas = new fazendaModel();
        if ($id_fazenda == 0) {
            $fazendas = $modelFazendas->getFazendas();
        } else {
            $fazendas = $modelFazendas->getFazendas("f.id_fazenda = {$id_fazenda}");
        }       
        foreach ($fazendas as $fazenda) {
            $where = "c.id_fazenda = {$fazenda['id_fazenda']}";
            if (!empty($dataInicial) && !empty($dataFinal)) {
                $where = $where . " and c.data_registro >= '{$dataInicial}' and c.data_registro <= '{$dataFinal}'";
            }
            $modelCaixa = new caixaModel();
            $caixasTemp = array();
            //busca as crias            
            $lancamentos = $modelCaixa->getCaixas($where);            
            $saldo = 0;
            foreach ($lancamentos as $lancamento) {
                $saldo = $saldo + $lancamento['valor'];
                $caixasTemp[] = array(
                    "data_registro" => $lancamento['data_registro'],
                    "historico" => $lancamento['historico'],
                    "valor" => $lancamento['valor']
                );
            }
            $registros[] = array(
                "nome_fazenda" => $fazenda["nome"],
                "caixas" => $caixasTemp,
                "saldoFinal" => $saldo
            );
        }
        //print_r($registros);die;
        $this->smarty->assign('registros', $registros);
        $this->smarty->display('relatorios/caixa.tpl');
    }
    
    
    public function novo() {
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
         //buscando Centro de Custo
        $modelCustos = new centro_custoModel();
        $options_custos = array('' => 'SELECIONE');
        foreach ($modelCustos->getCentro_custos() as $value) {
            $options_custos[$value['id_centro_custo']] = $value['descricao'];
        }
        $this->smarty->assign('options_custos', $options_custos);
        $this->smarty->assign('options_fazendas', $options_fazendas);
        $this->smarty->assign('registro', $registro);
        $this->smarty->display('caixa/caixaNovo.tpl');
    }

    public function gravar() {
        // var_dump($_POST);die;
        $_POST['data_registro'] = implode("-", array_reverse(explode("/", $_POST['data_registro'])));
        $data['id_caixa'] = isset($_POST['id_caixa']) ? $_POST['id_caixa'] : 0;
        $data['data_registro'] = isset($_POST['data_registro']) ? $_POST['data_registro'] : '';
        $data['historico'] = isset($_POST['historico']) ? $_POST['historico'] : 0;
        $data['valor'] = isset($_POST['valor']) ?  str_replace(',','.',$_POST['valor']) : '';
        $data['id_fazenda'] = isset($_POST['fazenda']) ? $_POST['fazenda'] : '';

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
