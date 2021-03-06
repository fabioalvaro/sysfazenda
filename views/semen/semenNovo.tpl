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
                            <div class="title">Novo Cadastro de Semen</div>
                        </div>
                    </div>
                    <div class="card-body">
                        <form  class="form-horizontal" 
                               name="frmSemen" 
                               action="/semen/gravar" 
                               method="POST" 
                               onsubmit="return validaForm();">                        
                            <div class="form-group has-error">
                                <label for="data_registro" class="col-sm-2 control-label">Data Registro</label>
                                <div class="col-sm-4">
                                    <input type="hidden" class="form-control" name='id_semen' id="id_semen" value="{$registro.id_semen|default:''}">                                                                        
                                    <input type="data_registro" class="col-sm-4" id="data_registro" value="{$registro.data_registro|default:''|date_format:'d/m/Y'}" placeholder="Data Registro" name="data_registro">                                
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="procedencia" class="col-sm-2 control-label">Procedência</label>
                                <div class="col-sm-4">
                                    <input type="text" name="procedencia" class="form-control" placeholder="Procedência" value="{$registro.procedencia|default:''}" id="procedencia">
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
        <link   rel="stylesheet" type="text/css" href="/files/css/datepicker.css">
        <script type="text/javascript" src="/files/js/bootstrap-datepicker.js"></script>
        <script type="text/javascript" src="/files/js/semen/semen.js"></script>
    </body>
</html>
