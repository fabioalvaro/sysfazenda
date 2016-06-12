<?php

class index extends controller {

    public function index_action() {
        if (util::isLogado()) {
            $this->smarty->display('index/index.tpl');
        } else {
            header('Location: /login');
        }
    }

}
