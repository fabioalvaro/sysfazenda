$(document).ready(function () {
    $("#data_inicial").datepicker({
        format: 'dd/mm/yyyy',
        language: 'pt-BR'
    });
    $("#data_final").datepicker({
        format: 'dd/mm/yyyy',
        language: 'pt-BR'
    });
});
//
//function alteraFiltro(){
//    if($("#modelo").val() == 2){
//        $("#filtro").show("slow");
//    }else{
//        $("#filtro").hide("slow");
//    }
//}
