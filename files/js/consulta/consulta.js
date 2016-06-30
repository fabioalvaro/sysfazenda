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

function validaForm() {
    var validado = true;
    var texto = '';
   
    if ($("#data_registro").val().trim() === '') {
        texto = 'Favor informar a data do registro';
        validado = false;
    }
    
    if ($("#fazenda").val().trim() === '') {
        texto = texto + ' Favor informar a fazenda';
        validado = false;
    }
    
    if ($("#animal").val().trim() === '') {
        texto = texto + ' Favor informar o animal';
        validado = false;
    }
    
    if ($("#tipo_registro").val() === '0') {
        texto = texto + ' Favor informar o tipo do registro';
        validado = false;
    }    
    
    if (!validado) {
        $.toast({
            heading: 'Erro de Validação',
            text: texto,
            position: 'mid-center',
            showHideTransition: 'slide',
            icon: 'error'
        });
    }


    return validado;
}