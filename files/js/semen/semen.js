$(document).ready(function () {
    $("#data_registro").datepicker({
        format: 'dd/mm/yyyy',
        language: 'pt-BR'
    });
});

function confirmaExcluir(id_semen) {
    var url_de_Exclusao = "/semen/excluir/id_semen/" + id_semen;
    if (confirm("Confirma a exclusão desse registro ?")) {
        window.location = url_de_Exclusao;

    }
}