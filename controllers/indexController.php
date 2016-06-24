<?php

class index extends controller {

    public function index_action() {
        if (util::isLogado()) {
            $this->smarty->display('index/index.tpl');
        } else {
            header('Location: /login');
        }
    }

    public function graficoAnimaisPorFazenda() {
        //animais por fazenda    
        $modelAnimais = new animalModel();
        $animais = $modelAnimais->getAnimaisPorFazenda();
        $labelsTemp = array();
        $dataTemp = array();
        foreach ($animais as $animal) {
            $labelsTemp[] = $animal['nome'];
            $dataTemp[] = $animal['total'];
        }

        $retorno = array(
            'labels' => $labelsTemp,
            'datasets' => array(array(
                    'label' => $animal['nome'],
                    'fillColor' => "rgba(26, 188, 156,0.6)",
                    'strokeColor' => "#1ABC9C",
                    'pointColor' => "#1ABC9C",
                    'pointStrokeColor' => "#fff",
                    'pointHighlightFill' => "#fff",
                    'pointHighlightStroke' => "#1ABC9C",
                    'data' => $dataTemp
                ))
        );

        echo json_encode($retorno);
    }

    public function graficoAnimaisPorSexo() {
        //animais por sexo
        $modelAnimais = new animalModel();
        $animais = $modelAnimais->getAnimaisPorSexo();
        $retorno[0] = array(
            'value'=> $animais[0]['total'],
            'color'=> "#FA2A00",
            'highlight'=> "#FA2A00",
            'label'=> $animais[0]['sexo'] == "M" ? "Macho" : "Femea");
        $retorno[1] = array(
            'value'=> $animais[1]['total'],
            'color'=> "#00008B",
            'highlight'=> "#00008B",
            'label'=> $animais[1]['sexo'] == "F" ? "Femea" : "Macho");        
        echo json_encode($retorno);
    }

    public function graficoNascimentoPorData() {
        //nascimento por data
        $modelConsultas = new consultaModel();
        $nascimentos = $modelConsultas->getNascimentosPorData();
        $labelsTemp = array();
        $dataTemp = array();
        foreach ($nascimentos as $nascimento) {
            $labelsTemp[] = date("d/m/Y", strtotime($nascimento['data_registro']));
            $dataTemp[] = $nascimento['total'];
        }
        $retorno = array(
            'labels' => $labelsTemp,
            'datasets' => array(array(
                    'label' => "Nascimentos",
                    'fillColor' => "rgba(34, 167, 240,0.2)",
                    'strokeColor' => "#22A7F0",
                    'pointColor' => "#22A7F0",
                    'pointStrokeColor' => "#fff",
                    'pointHighlightFill' => "#fff",
                    'pointHighlightStroke' => "#22A7F0",
                    'data' => $dataTemp
                ))
        );

        echo json_encode($retorno);
    }

}
