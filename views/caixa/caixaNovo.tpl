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
                            <div class="title">Novo Caixa</div>
                        </div>
                    </div>
                    <div class="card-body">
                        <form  class="form-horizontal" 
                               name="frm_caixa" 
                               action="/caixa/gravar" 
                               method="post"
                               enctype="multipart/form-data"
                               >                        
                            <div class="form-group">
                                <label for="data_registro" class="col-sm-2 control-label">Data Registro</label>
                                <div class="col-sm-4">
                                    <input type="hidden" class="form-control" name="id_caixa" id="id_caixa" value="{$registro.id_caixa|default:''}">
                                    <input type="text" class="col-sm-4" id="data_registro" value="{$registro.data_registro}" placeholder="Data Registro" name="data_registro">
                                </div>
                            </div>                            
                            <div class="form-group">
                                <label for="fazenda" class="col-sm-2 control-label">Fazenda</label>
                                <div class="col-sm-4">
                                    <select id="fazenda" name="fazenda" placeholder="Fazenda" class="col-xs-12">
                                        {html_options options=$options_fazendas|default:'' selected=$registro.id_fazenda}
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="historico" class="col-sm-2 control-label">Histórico</label>
                                <div class="col-sm-4">
                                    <input type="text" class="form-control" id="historico" name="historico" value="{$registro.historico|default:''}" placeholder="Histórico">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="valor" class="col-sm-2 control-label">Valor</label>
                                <div class="col-sm-4">
                                    <input type="text" class="form-control" id="valor" name="valor" value="{$registro.valor|default:''}" placeholder="Valor">
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
        <link   rel="stylesheet" type="text/css" href="/files/css/datepicker.css">
        <script type="text/javascript" src="/files/js/bootstrap-datepicker.js"></script>
        <script type="text/javascript" src="/files/js/caixa/caixa.js"></script>
    </body>
</html>
