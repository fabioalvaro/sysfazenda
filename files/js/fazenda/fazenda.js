function confirmaExcluir(id_fazenda) {
    var url_de_Exclusao = "/fazenda/excluir/id_fazenda/" + id_fazenda;
    if (confirm("Confirma a exclusão dessa fazenda ?")) {
        window.location = url_de_Exclusao;

    }
}

function validaForm() {
    var validado = true;
    var texto = '';
   
    if ($("#nome").val().trim() === '') {
        texto = 'Favor informar o nome da fazenda';
        validado = false;
    }
    
    if ($("#responsavel").val().trim() === '') {
        texto = texto + ' Favor informar o responsavel';
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