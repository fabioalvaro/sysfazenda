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
                            <div class="title">Novo Responsável</div>
                        </div>
                    </div>
                    <div class="card-body">
                        <form  class="form-horizontal" 
                               name="frm_responsavel" 
                               action="/responsaveis/gravar" 
                               method="post"
                               enctype="multipart/form-data"
                               onsubmit="return validaForm();">                        
                            <div class="form-group has-error">
                                <label for="nome" class="col-sm-2 control-label">Nome</label>
                                <div class="col-sm-4">
                                    <input type="hidden" class="form-control" name="id_usuario" id="id_usuario" value="{$registro.id_usuario|default:''}">
                                    <input type="text" class="form-control" id="nome" name="nome" value="{$registro.nome|default:''}" placeholder="Nome">
                                </div>
                            </div>                                                        
                            <div class="form-group">
                                <label for="cpf" class="col-sm-2 control-label">CPF</label>
                                <div class="col-sm-4">
                                    <input type="text" class="form-control" id="cpf" name="cpf" value="{$registro.cpf|default:''}" placeholder="CPF">
                                </div>
                            </div>
                            <div class="form-group has-error">
                                <label for="usuario" class="col-sm-2 control-label">Usuario</label>
                                <div class="col-sm-4">
                                    <input type="text" class="form-control" id="usuario" name="usuario" value="{$registro.usuario|default:''}" placeholder="Usuario Login">
                                </div>
                            </div>
                            <div class="form-group has-error">
                                <label for="senha" class="col-sm-2 control-label">Senha</label>
                                <div class="col-sm-4">
                                    <input type="password" class="form-control" id="senha" name="senha" value="{$registro.senha|default:''}" placeholder="Senha Login">
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
        <script type="text/javascript" src="/files/js/responsaveis/responsaveis.js"></script>
    </body>
</html>
