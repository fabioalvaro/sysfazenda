function confirmaExcluir(id_centro_custo) {
    var url_de_Exclusao = "/centro_custo/excluir/id_centro_custo/" + id_centro_custo;
    if (confirm("Confirma a exclusão desse centro de custo ?")) {
        window.location = url_de_Exclusao;

    }
}

function validaForm() {
    var validado = true;
    var texto = '';
   
    if ($("#descricao").val().trim() === '') {
        texto = 'Favor informar a descriçao do registro';
        validado = false;
    }
    
    if ($("#fazenda").val().trim() === '') {
        texto = texto + ' Favor informar a fazenda';
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