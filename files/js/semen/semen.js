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

function validaForm() {
    var validado = true;
    var texto = '';
   
    if ($("#data_registro").val().trim() === '') {
        texto = 'Favor informar a data do registro';
        validado = false;
    }
    
    if ($("#animal").val().trim() === '') {
        texto = texto + ' Favor informar o animal';
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