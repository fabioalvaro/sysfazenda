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
                               method="POST" >                        
                            <div class="form-group">
                                <label for="data_registro" class="col-sm-2 control-label">Data Registro</label>
                                <div class="col-sm-4">
                                    <input type="hidden" class="form-control" name="id_consulta" id="id_consulta">
                                    <input type="text" class="col-sm-4" id="data_registro" placeholder="Data Registro" name="data_registro">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="fazenda" class="col-sm-2 control-label">Fazenda</label>
                                <div class="col-sm-4">
                                    <select id="fazenda" name="fazenda" class="col-xs-12">
                                        {html_options options=$options_fazendas|default:''}
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="animal" class="col-sm-2 control-label">Animal</label>
                                <div class="col-sm-4">
                                    <select id="animal" name="animal" class="col-xs-12">
                                        {html_options options=$options_animais|default:''}
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="idade" class="col-sm-2 control-label">Idade Atual</label>
                                <div class="col-sm-4">
                                    <input type="text" name="idade" class="form-control" id="idade" placeholder="Idade Atual">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="peso_atual" class="col-sm-2 control-label">Peso Atual</label>
                                <div class="col-sm-4">
                                    <input type="text" class="form-control" name="peso_atual" id="peso_atual" placeholder="Peso Atual">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="tipo_registro" class="col-sm-2 control-label">Tipo Registro</label>
                                <div class="col-sm-4">
                                    <input type="text" name="tipo_registro" class="form-control" id="tipo_registro" placeholder="Tipo Registro">
                                </div>
                            </div>                            
                            <div class="form-group">
                                <label for="cria" class="col-sm-2 control-label">Cria</label>
                                <div class="col-sm-4">
                                    <select id="cria" name="cria" class="col-xs-12">
                                        {html_options options=$options_crias|default:''}
                                    </select>
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
