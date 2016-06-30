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
                            <div class="title">Nova Consulta</div>
                        </div>
                    </div>
                    <div class="card-body">
                        <form  class="form-horizontal" 
                               name="frmConsulta" 
                               action="/consulta/gravar" 
                               method="POST" 
                               onsubmit="return validaForm();">                        
                            <div class="form-group has-error">
                                <label for="data_registro" class="col-sm-2 control-label">Data Registro</label>
                                <div class="col-sm-4">
                                    <input type="hidden" class="form-control" value="{$registro.id_consulta}" name="id_consulta" id="id_consulta">
                                    <input type="text" class="col-sm-4" id="data_registro" value="{$registro.data_registro|date_format:'d/m/Y'}" placeholder="Data Registro" name="data_registro">
                                </div>
                            </div>
                            <div class="form-group has-error">
                                <label for="fazenda" class="col-sm-2 control-label">Fazenda</label>
                                <div class="col-sm-4">
                                    <select id="fazenda" name="fazenda" class="col-xs-12">
                                        {html_options options=$options_fazendas|default:'' selected=$registro.id_fazenda}
                                    </select>
                                </div>
                            </div>
                            <div class="form-group has-error">
                                <label for="animal" class="col-sm-2 control-label">Animal</label>
                                <div class="col-sm-4">
                                    <select id="animal" name="animal" class="col-xs-12">
                                        {html_options options=$options_animais|default:'' selected=$registro.id_animal}
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="idade" class="col-sm-2 control-label">Idade Atual</label>
                                <div class="col-sm-4">
                                    <input type="text" name="idade" class="form-control" id="idade" value="{$registro.idade}" placeholder="Idade Atual">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="peso_atual" class="col-sm-2 control-label">Peso Atual</label>
                                <div class="col-sm-4">
                                    <input type="text" class="form-control" name="peso_atual" id="peso_atual" value="{$registro.peso_atual|number_format:2:",":"."}" placeholder="Peso Atual">
                                </div>
                            </div>
                            <div class="form-group has-error">
                                <label for="tipo_registro" class="col-sm-2 control-label">Tipo Registro</label>
                                <div class="col-sm-4">
                                    <select id="tipo_registro" name="tipo_registro" class="col-xs-12">
                                        {html_options options=$options_tipo_registro|default:'' selected=$registro.tipo_registro}
                                    </select>
                                </div>
                            </div>                            
                            <div class="form-group">
                                <label for="cria" class="col-sm-2 control-label">Cria</label>
                                <div class="col-sm-4">
                                    <select id="cria" name="cria" class="col-xs-12">
                                        {html_options options=$options_crias|default:'' selected=$registro.cria}
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="descricao" class="col-sm-2 control-label">Descrição</label>
                                <div class="col-sm-4">
                                    <input type="text" class="form-control" id="descricao" name="descricao" value="{$registro.descricao|default:''}" placeholder="Descrição">
                                </div>
                            </div>
                            <div class="form-group">
                                {*                                <label for="area_util" class="col-sm-2 control-label">Área Útil</label>*}
                                <div class="col-sm-4">
                                    <input type="submit" id="salvar" class="btn btn-info" value="SALVAR" />
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        {include file="comum/footer.tpl"}
        <link   rel="stylesheet" type="text/css" href="../../files/css/datepicker.css">
        <script type="text/javascript" src="../../files/js/bootstrap-datepicker.js"></script>
        <script type="text/javascript" src="../../files/js/consulta/consulta.js"></script>
    </body>
</html>
