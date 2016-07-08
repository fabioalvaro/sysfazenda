<?php

class centro_custo extends controller {

    public function index_action() {
        if (util::isLogado()) {
            $modelCentro_custo = new centro_custoModel();
            $centro_custo = $modelCentro_custo->getCentro_custos();
            $this->smarty->assign('centro_custo', $centro_custo);
            $this->smarty->display('centro_custo/centro_custo.tpl');
        } else {
            header('Location: /login');
        }
    }
    
    public function novo() {
        //var_dump($_GET);die;
        $id_centro_custo = $this->getParam('id_centro_custo');
        $registro = array();
        if ((bool) $id_centro_custo) {
            //buscando o animal
            $modelCentro_custo = new centro_custoModel();
            $registro = $modelCentro_custo->getCentro_custos("id_centro_custo = {$id_centro_custo}");
            $registro = $registro[0];
        }
        //buscando as Fazendas
        $modelFazendas = new fazendaModel();
        $options_fazendas = array('' => 'SELECIONE');
        foreach ($modelFazendas->getFazendas() as $value) {
            $options_fazendas[$value['id_fazenda']] = $value['nome'];
        }
        $this->smarty->assign('options_fazendas', $options_fazendas);
        $this->smarty->assign('registro', $registro);
        $this->smarty->display('centro_custo/centro_custoNovo.tpl');
    }

    public function gravar() {
        // var_dump($_POST);die;        
        $data['id_centro_custo'] = isset($_POST['id_centro_custo']) ? $_POST['id_centro_custo'] : 0;
        $data['descricao'] = isset($_POST['descricao']) ? $_POST['descricao'] : '';
        $data['id_fazenda'] = isset($_POST['fazenda']) ? $_POST['fazenda'] : '';

        //var_dump($data);die;
        //gravando os dados
        //gravando os dados
        $modelCentro_custo = new centro_custoModel();
        if (!(bool) $data['id_centro_custo']) {
            $modelCentro_custo->setCentro_custo($data);
        } else {
            $modelCentro_custo->updCentro_custo($data);
        }
        header('Location: /centro_custo');
    }

    public function excluir() {
        $id_centro_custo = $this->getParam('id_centro_custo');
        $data['id_centro_custo'] = $id_centro_custo;
        $modelCentro_custo = new centro_custoModel();
        $modelCentro_custo->delCentro_custo($data);
        header('Location: /centro_custo');
    }

}
