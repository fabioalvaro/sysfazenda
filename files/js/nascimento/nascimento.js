$(document).ready(function () {
    $("#data_registro").datepicker({
        format: 'dd/mm/yyyy',
        language: 'pt-BR'
    });
    $("#data_nascimento").datepicker({
        format: 'dd/mm/yyyy',
        language: 'pt-BR'
    });
});

function confirmaExcluir(id_nascimento) {
    var url_de_Exclusao = "/nascimento/excluir/id_nascimento/" + id_nascimento;
    if (confirm("Confirma a exclusão desse registro ?")) {
        window.location = url_de_Exclusao;

    }
}