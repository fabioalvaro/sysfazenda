<!DOCTYPE html>
<html lang="en">
    <head>
        {include file="comum/head.tpl"}
    </head>
    <body class="flat-blue">    
        {include file="comum/menu.tpl"}
        <div class="row">
            <div class="col-xs-12">
                <div class="card">
                    <div class="card-header">
                        <div class="card-title">
                            <div class="title">Relatório de Animais</div>
                        </div>
                    </div>
                    <div class="card-body">
                        <form name="pre_relatorio_animais" 
                              action="/animal/rel_animal"
                              method="POST"
                              enctype="multipart/form-data"
                              target="_blank">
                            <div class="row">
                                <div class="col-xs-3">
                                    <div class="form-group">
                                        <label for="modelo">Modelo Relatório</label>
                                        <select class="form-control" name="relatorio">                                                
                                            {html_options options=$options_fazendas}
                                        </select>
                                    </div>
                                </div>                                    
                            </div>
                            <div class="row">
                                <div class="col-xs-3">
                                    <div class="form-group">
                                        <label for="fazendas">Fazenda</label>
                                        <select class="form-control" name="fazenda">                                                
                                            {html_options options=$options_fazendas}
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-xs-2">
                                    <div class="form-group">
                                        <label for="data_registro" >Data Inicial</label>
                                        <input type="text"  class="form-control" id="data_registro" placeholder="Data Registro" value="{$registro.data_registro|default:''}" name="data_registro">
                                    </div>
                                </div>
                                <div class="col-xs-2">
                                    <div class="form-group">
                                        <label for="data_registro" >Data Final</label>                                                                          
                                        <input type="text" class="form-control" id="data_registro" placeholder="Data Registro" value="{$registro.data_registro|default:''}" name="data_registro">                                       
                                    </div>
                                </div>
                            </div>
                            {*<div class="row">

                            <div class="col-xs-3">
                            <div class="form-group">
                            <label for="status">TIPO DE RELACIONAMENTO</label>
                            <select class="form-control" name="tipo_relacionamento">
                            <option value="TODOS">TODOS</option>
                            {html_options options=$lista_tiporelacionamento}
                            </select>
                            </div>
                            </div>

                            <div class="col-xs-3">
                            <div class="form-group">
                            <label for="status">SETOR</label>
                            <select class="form-control" name="setor">
                            <option value="TODOS">TODOS</option>
                            {html_options options=$lista_parceiro_setor}
                            </select>
                            </div>
                            </div>
                            </div>

                            <div class="row">

                            <div class="col-xs-3">
                            <div class="form-group">
                            <label for="parceiro_inicial">Parceiro Inicial</label>
                            <input class="form-control" value="0"  id="parceiro_inicial" name="parceiro_inicial" onkeypress="if (!isNaN(String.fromCharCode(window.event.keyCode)))
                            return true;
                            else
                            return false;"</input>
                            </div>
                            </div>

                            <div class="col-xs-3">
                            <div class="form-group">
                            <label for="parceiro_final"><br>Parceiro Final</label>
                            <input class="form-control" value="9999"  id="parceiro_final" name="parceiro_final" onkeypress="if (!isNaN(String.fromCharCode(window.event.keyCode)))
                            return true;
                            else
                            return false;"onkeypress='return SomenteNumero(event)'></input>
                            </div>
                            </div>
                            </div>
                            <div class="row">
                            <div class="col-xs-6">
                            <label>Tipo do relatorio</label>
                            <select class="form-control" name="tipo_rel">
                            <option value="1" selected="selected">LISTAGEM GERAL</option>
                            <option value="2">FICHA CADASTRAL</option>
                            </select>
                            </div>
                            </div>*}
                            <div class="row">
                                <div class="col-xs-2 button-m-top">  
                                    <input type="submit" id="buscar" name="btnGerar" class="btn btn-default btn-gradientgray2" value="GERAR RELATORIO" />
                                </div>
                            </div>
                            {*                            </fieldset>*}
                        </form>
                    </div>
                </div>
            </div>
        </div>
        {include file="comum/footer.tpl"}        
        <link   rel="stylesheet" type="text/css" href="/files/css/datepicker.css">
        <script type="text/javascript" src="/files/js/bootstrap-datepicker.js"></script>
        <script type="text/javascript" src="/files/js/animal/animal.js"></script>
    </body>
</html>
