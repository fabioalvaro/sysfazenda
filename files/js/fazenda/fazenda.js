function confirmaExcluir(id_fazenda) {
    var url_de_Exclusao = "/fazenda/excluir/id_fazenda/" + id_fazenda;
    if (confirm("Confirma a exclusão dessa fazenda ?")) {
        window.location = url_de_Exclusao;

    }
}