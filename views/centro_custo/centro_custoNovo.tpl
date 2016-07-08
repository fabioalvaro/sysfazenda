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
                            <div class="title">Novo Centro de Custo</div>
                        </div>
                    </div>
                    <div class="card-body">
                        <form  class="form-horizontal" 
                               name="frm_centro_custo" 
                               action="/centro_custo/gravar" 
                               method="post"
                               enctype="multipart/form-data"
                               onsubmit="return validaForm();">                        
                            <div class="form-group has-error">
                                <label for="descricao" class="col-sm-2 control-label">Descrição</label>
                                <div class="col-sm-4">
                                    <input type="hidden" class="form-control" name="id_centro_custo" id="id_centro_custo" value="{$registro.id_centro_custo|default:''}">
                                    <input type="text" class="col-sm-4" id="descricao" value="{$registro.descricao|default:''}" placeholder="Descricao" name="descricao">
                                </div>
                            </div>                            
                            <div class="form-group has-error">
                                <label for="fazenda" class="col-sm-2 control-label">Fazenda</label>
                                <div class="col-sm-4">
                                    <select id="fazenda" name="fazenda" placeholder="Fazenda" class="col-xs-12">
                                        {html_options options=$options_fazendas|default:'' selected=$registro.id_fazenda}
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
        <script type="text/javascript" src="/files/js/centro_custo/centro_custo.js"></script>
    </body>
</html>
