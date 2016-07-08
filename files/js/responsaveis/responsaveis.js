function confirmaExcluir(id_usuario) {
    var url_de_Exclusao = "/responsaveis/excluir/id_usuario/" + id_usuario;
    if (confirm("Confirma a exclusão desse usuario ?")) {
        window.location = url_de_Exclusao;

    }
}

function validaForm() {
    var validado = true;
    var texto = '';
   
    if ($("#nome").val().trim() === '') {
        texto = 'Favor informar o Nome do responsável';
        validado = false;
    }
    
    if ($("#usuario").val().trim() === '') {
        texto = texto + ' Favor informar o usuário para logar';
        validado = false;
    }
    
    if ($("#senha").val().trim() === '') {
        texto = texto + ' Favor informar a senha para o login';
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