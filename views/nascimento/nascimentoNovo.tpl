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
                            <div class="title">Novo Nascimento</div>
                        </div>
                    </div>
                    <div class="card-body">
                        <form  class="form-horizontal" 
                               name="frmNascimento" 
                               action="/nascimento/gravar" 
                               method="POST" >                        
                            <div class="form-group">
                                <label for="data_registro" class="col-sm-2 control-label">Data Registro</label>
                                <div class="col-sm-4">
                                    <input type="hidden" class="form-control" id="id_nascimento">                                                                        
                                    <input type="data_registro" class="col-sm-4" id="data_registro" placeholder="Data Registro" name="data_registro">                                
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="data_nascimento" class="col-sm-2 control-label">Data Nascimento</label>
                                <div class="col-sm-4">                                                                                                            
                                    <input type="data_nascimento" class="col-sm-4" id="data_nascimento" placeholder="Data Nascimento" name="data_nascimento">                                
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
                                <label for="numero_brinco" class="col-sm-2 control-label">Nº Brinco</label>
                                <div class="col-sm-4">
                                    <input type="text" class="form-control" id="numero_brinco" name="numero_brinco" placeholder="Nº Brinco">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="nome" class="col-sm-2 control-label">Nome</label>
                                <div class="col-sm-4">
                                    <input type="text" class="form-control" id="nome" name="nome" placeholder="Nome">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="sexo" class="col-sm-2 control-label">Sexo</label>
                                <div class="col-sm-4">
                                    <select id="sexo" name="sexo" placeholder="Sexo" class="col-xs-12">
                                        {html_options options=$options_sexo|default:''}
                                    </select>
                                </div>
                            </div>                            
                            <div class="form-group">
                                <label for="tipo_registro" class="col-sm-2 control-label">Tipo Registro</label>
                                <div class="col-sm-4">
                                    <input type="text" class="form-control" id="tipo_registro" name="tipo_registro" placeholder="Tipo Registro">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="pai" class="col-sm-2 control-label">Pai</label>
                                <div class="col-sm-4">
                                    <select id="pai" name="pai" class="col-xs-12">
                                        {html_options options=$options_pai|default:''}
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="mae" class="col-sm-2 control-label">Mãe</label>
                                <div class="col-sm-4">
                                    <select id="mae" name="mae" class="col-xs-12">
                                        {html_options options=$options_mae|default:''}
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="Semen" class="col-sm-2 control-label">Semen</label>
                                <div class="col-sm-4">
                                    <select id="semen" name="semen" class="col-xs-12">
                                        {html_options options=$options_semen|default:''}
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
        <link   rel="stylesheet" type="text/css" href="../../files/css/datepicker.css">
        <script type="text/javascript" src="../../files/js/bootstrap-datepicker.js"></script>
        <script type="text/javascript" src="../../files/js/nascimento/nascimento.js"></script>
    </body>
</html>
