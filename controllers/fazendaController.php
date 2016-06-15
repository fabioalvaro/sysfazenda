<?php

class fazenda extends controller {

    public function index_action() {
        if (util::isLogado()) {
            $modelFazenda = new fazendaModel();
            $fazendas = $modelFazenda->getFazendas();            
            $this->smarty->assign('fazendas', $fazendas);
            $this->smarty->display('fazenda/fazenda.tpl');
        } else {
            header('Location: /login');
        }
    }

    public function novo() {
        $id_fazenda = $this->getParam('id_fazenda');
        $registro = array();
        if ((bool) $id_fazenda) {
            //buscando a fazenda
            $modelFazenda = new fazendaModel();
            $registro = $modelFazenda->getFazendas(" id_fazenda = {$id_fazenda}");
            $registro = $registro[0];
        }

        //buscando responsaveis
        $modelResponsaveis = new responsavelModel();
        $options_responsaveis = array('' => 'SELECIONE');
        foreach ($modelResponsaveis->getResponsavel() as $value) {
            $options_responsaveis[$value['id_responsavel']] = $value['nome'];
        }
        $this->smarty->assign('options_responsaveis', $options_responsaveis);
        $this->smarty->assign('registro', $registro);
        $this->smarty->display('fazenda/fazendaNovo.tpl');
    }

    public function gravar() {
        //var_dump($_POST);die;
        $data['id_fazenda'] = isset($_POST['id_fazenda']) ? $_POST['id_fazenda'] : 0;
        $data['nome'] = isset($_POST['nome']) ? $_POST['nome'] : '';
        $data['localidade'] = isset($_POST['localidade']) ? $_POST['localidade'] : '';
        $data['area_total'] = isset($_POST['area_total']) ? $_POST['area_total'] : 0;
        $data['area_util'] = isset($_POST['area_util']) ? $_POST['area_util'] : 0;
        $data['cartao_produtor'] = isset($_POST['cartaoProdutor']) ? $_POST['cartaoProdutor'] : '';
        $data['id_responsavel'] = isset($_POST['responsavel']) ? $_POST['responsavel'] : 0;
        $modelFazenda = new fazendaModel();
        if (!(bool) $data['id_fazenda']) {
            $modelFazenda->setFazenda($data);
        } else {
            $modelFazenda->updFazenda($data);
        }
        header('Location: /fazenda');
    }

    public function excluir() {
        $id_fazenda = $this->getParam('id_fazenda');
        $data['id_fazenda'] = $id_fazenda;
        $modelFazenda = new fazendaModel();
        $modelFazenda->delFazenda($data);
        header('Location: /fazenda');
    }

}
