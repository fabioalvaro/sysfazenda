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
    
    if ($("#centro_custo").val() == '0') {
        texto = texto + ' Favor informar o centro de custo';
        validado = false;
    }
    
    if ($("#valor").val().trim() === '') {
        texto = texto + ' Favor informar o valor';
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