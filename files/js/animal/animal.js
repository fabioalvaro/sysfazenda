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

function escondeDescontinuado(){    
    if($("#descontinuado:checked").length > 0){
        $("#desc").show("slow");
    }else{
        $("#desc").hide("slow");
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
        texto = texto + ' Favor informar a fazenda do animal';
        validado = false;
    }

    if ($("#nome").val().trim() === '') {
        texto = texto + ' Favor informar o nome do animal';
        validado = false;
    }

    if ($("#sexo").val().trim() === 'N') {
        texto = texto + ' Favor informar o sexo do animal';
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