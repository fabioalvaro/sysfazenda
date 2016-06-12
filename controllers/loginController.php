<?php

class login extends controller {

    public function index_action() {

        $this->smarty->display('login/login.tpl');
    }

    public function logar() {
        $nome_usuario = isset($_POST['usuario']) ? $_POST['usuario'] : '';
        $senha = isset($_POST['senha']) ? $_POST['senha'] : '';
        $_SESSION['logado'] = false;
        $_SESSION['usuario']['id'] = 0;
        $_SESSION['usuario']['nome'] = '';
        //busca usuario no banco
        $modelUsuario = new usuarioModel();
        $usuario = end($modelUsuario->getUsuarios(" usuario = '{$nome_usuario}' and senha = '{$senha}' "));
        if ($usuario['id_usuario'] > 0) {
            $_SESSION['logado'] = true;
            $_SESSION['usuario']['id'] = isset($usuario['id_usuario']) ? $usuario['id_usuario'] : 0;
            $_SESSION['usuario']['nome'] = isset($usuario['usuario']) ? $usuario['usuario'] : '';
            header('Location: /index');
        }else{
            header('Location: /login');
        }
    }
    
    public function sair(){        
        $_SESSION['logado'] = false;
        $_SESSION['usuario']['id'] = 0;
        $_SESSION['usuario']['nome'] = '';
        header('Location: /login');
    }

}
