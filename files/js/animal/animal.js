$(document).ready(function () {
    $("#data_registro").datepicker({
        format: 'dd/mm/yyyy',
        language: 'pt-BR'
    });
    $("#data_nascimento").datepicker({
        format: 'dd/mm/yyyy',
        language: 'pt-BR'
    });
    $("#data_descontinuado").datepicker({
        format: 'dd/mm/yyyy',
        language: 'pt-BR'
    });
});

function confirmaExcluir(id_animal) {
    var url_de_Exclusao = "/animal/excluir/id_animal/" + id_animal;
    if (confirm("Confirma a exclusão desse animal ?")) {
        window.location = url_de_Exclusao;

    }
}