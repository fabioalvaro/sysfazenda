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
                            <div class="title">Nova Fazenda</div>
                        </div>
                    </div>
                    <div class="card-body">
                        <form  class="form-horizontal" 
                               name="frmFazenda" 
                               action="/fazenda/gravar" 
                               method="POST" 
                               onsubmit = "return validaForm();">                        
                            <div class="form-group has-error">
                                <label for="nome" class="col-sm-2 control-label">Nome</label>
                                <div class="col-sm-4">
                                    <input type="hidden" class="form-control" id="id_Fazenda" name="id_fazenda" value="{$registro.id_fazenda}">
                                    <input type="text" name="nome"class="form-control" id="nome" value="{$registro.nome|default:''}" placeholder="Nome">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="localidade" class="col-sm-2 control-label">Localidade</label>
                                <div class="col-sm-4">
                                    <input type="text" name="localidade" class="form-control" value="{$registro.localidade|default:''}" id="localidade" placeholder="Localidade">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="area_total" class="col-sm-2 control-label">Área Total</label>
                                <div class="col-sm-4">
                                    <input type="text" name="area_total" value="{$registro.area_total|default:''|number_format:0:"":"."}" class="form-control" id="areaTotal" placeholder="Área Total">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="area_util" class="col-sm-2 control-label">Área Útil</label>
                                <div class="col-sm-4">
                                    <input type="text" class="form-control" name="area_util" value="{$registro.area_util|default:''|number_format:0:"":"."}" id="areaUtil" placeholder="Área Útil">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="cartao_produtor" class="col-sm-2 control-label">Cartão Produtor</label>
                                <div class="col-sm-4">
                                    <input type="text" class="form-control" id="cartaoProdutor" name="cartaoProdutor" value="{$registro.cartao_produtor|default:''}" placeholder="Cartão Produtor">
                                </div>
                            </div>
                            <div class="form-group has-error">
                                <label for="responsavel" class="col-sm-2 control-label">Responsável</label>
                                <div class="col-sm-4">
                                    <select id="responsavel" name="responsavel" class="col-xs-12">
                                        {html_options options=$options_responsaveis|default:'' selected=$registro.id_responsavel}
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
        <script type="text/javascript" src="/files/js/fazenda/fazenda.js"></script>
        {include file="comum/footer.tpl"}
    </body>
</html>
