<!DOCTYPE html>
<html lang="en">
    <head>
        {include file="comum/head.tpl"}
    </head>
    <body class="flat-blue">    
        {include file="comum/menu.tpl"}
        <div class="container-fluid">
{*            <div class="side-body">*}
                <div class="page-title">
                    <span class="title">Nascimentos</span>
                    <div class="description">
                        <label class="col-xs-12">Novo Nascimento</label> 
                        <div class="col-xs-12 col-md-2 col-lg-2 button-m-top">
                            <a class="btn btn-primary glyphicon glyphicon-plus" href="/nascimento/novo">Novo</a>                            
                        </div>
                    </div>                    
                </div>
{*            </div>*}
            <div class="row">
                <div class="col-xs-12">
                    <div class="card">
                        {*<div class="card-header">
                        <div class="card-title">
                        <div class="title">Table</div>
                        </div>
                        </div>*}
                        <div class="card-body">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Data Registro</th>
                                        <th>Data Nascimento</th>
                                        <th>Fazenda</th>
                                        <th>Nº Brinco</th>
                                        <th>Nome</th>
                                        <th>Ação</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    {foreach from=$nascimentos item="linha"}
                                        <tr>
                                            <td>{$linha.id_nascimento}</td>
                                            <td>{$linha.data_registro}</td>
                                            <td>{$linha.data_nascimento}</td>
                                            <td>{$linha.id_fazenda}</td>
                                            <td>{$linha.numero_brinco}</td>
                                            <td>{$linha.nome}</td>
                                            <td class="">
                                                <a class="glyphicon glyphicon-refresh"  href="/nascimento/novo/id_nascimento/{$linha.id_nascimento}"></a>
                                                <a class="glyphicon glyphicon-trash" onclick="confirmaExcluir({$linha.id_nascimento});"></a> 
                                            </td>
                                        </tr>
                                    {foreachelse}
                                        <tr><td colspan="6">Nenhum nascimento encontrado</td></tr>
                                    {/foreach}        
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            {include file="comum/footer.tpl"}
            <script type="text/javascript" src="/files/js/nascimento/nascimento.js"></script>
    </body>
</html>
