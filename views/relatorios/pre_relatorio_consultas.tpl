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
                            <div class="title">Relatório de Consultas</div>
                        </div>
                    </div>
                    <div class="card-body">
                        <form name="pre_relatorio_consultas" 
                              action="/consulta/rel_consulta"
                              method="POST"
                              enctype="multipart/form-data"
                              target="_blank">                            
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
    </body>
</html>
