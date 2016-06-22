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
                            <div class="title">Caixa</div>
                        </div>
                    </div>
                    <div class="card-body">
                        <form name="pre_relatorio_caixas" 
                              action="/caixa/rel_caixa"
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
                                <div class="col-xs-2">
                                    <div class="form-group">
                                        <label for="data_inicial" >Data Inicial</label>
                                        <input type="text"  class="form-control" id="data_inicial" placeholder="Data Inicial" name="data_inicial">
                                    </div>
                                </div>
                                <div class="col-xs-2">
                                    <div class="form-group">
                                        <label for="data_final" >Data Final</label>                                                                          
                                        <input type="text" class="form-control" id="data_final" placeholder="Data Final" name="data_final">                                       
                                    </div>
                                </div>
                            </div>                            
                            <div class="row">
                                <div class="col-xs-2 button-m-top">  
                                    <input type="submit" id="buscar" name="btnGerar" class="btn btn-default btn-gradientgray2" value="GERAR RELATORIO" />
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
        <script type="text/javascript" src="/files/js/caixa/relatorioCaixa.js"></script>
    </body>
</html>
