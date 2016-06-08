$(document).ready(function () {
    $("#data_registro").datepicker({
        format: 'dd/mm/yyyy',
        language: 'pt-BR'
    });    
});

function confirmaExcluir(id_consulta) {
    var url_de_Exclusao = "/consulta/excluir/id_consulta/" + id_consulta;
    if (confirm("Confirma a exclusão dessa consulta ?")) {
        window.location = url_de_Exclusao;

    }
}