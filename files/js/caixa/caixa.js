$(document).ready(function () {
    $("#data_registro").datepicker({
        format: 'dd/mm/yyyy',
        language: 'pt-BR'
    });
});

function confirmaExcluir(id_caixa) {
    var url_de_Exclusao = "/caixa/excluir/id_caixa/" + id_caixa;
    if (confirm("Confirma a exclusão desse caixa ?")) {
        window.location = url_de_Exclusao;

    }
}