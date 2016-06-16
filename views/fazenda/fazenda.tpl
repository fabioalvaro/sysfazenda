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
                <span class="title">Fazendas</span>
                <div class="description">
                    <label class="col-xs-12">Cadastro de Fazenda</label> 
                    <div class="col-xs-12 col-md-2 col-lg-2 button-m-top">
                        <a class="btn btn-primary glyphicon glyphicon-plus" href="/fazenda/novo">Novo</a>                            
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
                            <table class="datatable table table-striped" cellspacing="0" width="100%">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Nome</th>
                                        <th>Localidade</th>
                                        <th>Área Total</th>
                                        <th>Área Útil</th>
                                        <th>Cartão Produtor</th>
                                        <th>Responsavel</th>
                                        <th>Ação</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    {foreach from=$fazendas item="linha"}
                                        <tr>
                                            <td>{$linha.id_fazenda}</td>
                                            <td>{$linha.nome}</td>
                                            <td>{$linha.localidade}</td>                                            
                                            <td>{$linha.area_total|string_format:"%d"}</td>
                                            <td>{$linha.area_util|string_format:"%d"}</td>
                                            <td>{$linha.cartao_produtor}</td>
                                            <td>{$linha.nomeResponsavel}</td>
                                            <td class="">
                                                <a class="glyphicon glyphicon-refresh"  href="/fazenda/novo/id_fazenda/{$linha.id_fazenda}"></a>
                                                <a class="glyphicon glyphicon-trash" onclick="confirmaExcluir({$linha.id_fazenda});"></a> 
                                            </td>
                                        </tr>
                                    {foreachelse}
                                        <tr><td colspan="6">Nenhuma Fazenda encontrada</td></tr>
                                    {/foreach}        
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            {include file="comum/footer.tpl"}
            <script type="text/javascript" src="/files/js/fazenda/fazenda.js"></script>
    </body>
</html>