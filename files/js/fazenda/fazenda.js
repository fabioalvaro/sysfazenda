function confirmaExcluir(id_fazenda) {
    var url_de_Exclusao = "/fazenda/excluir/id_fazenda/" + id_fazenda;
    if (confirm("Confirma a exclusão dessa fazenda ?")) {
        window.location = url_de_Exclusao;

    }
}

function validaForm() {
    var validado = true;     
    if ($("#nome").val().trim() === '') {
        alert('INSIRA O NOME DA FAZENDA');
        validado = false;
    }    
    

    return validado;
}