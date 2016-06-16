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
                    <span class="title">Caixa</span>
                    <div class="description">
                        <label class="col-xs-12">Lançamento de Caixa</label> 
                        <div class="col-xs-12 col-md-2 col-lg-2 button-m-top">
                            <a class="btn btn-primary glyphicon glyphicon-plus" href="/caixa/novo">Novo</a>                            
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
                                        <th>Data Registro</th>
                                        <th>Fazenda</th>
                                        <th>Historico</th>
                                        <th>Valor</th>
                                        <th>Ação</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    {foreach from=$caixas item="linha"}
                                        <tr>
                                            <td>{$linha.id_caixa}</td>
                                            <td>{$linha.data_registro|date_format:'d/m/Y'}</td>
                                            <td>{$linha.nomeFazenda}</td>
                                            <td>{$linha.historico}</td>
                                            <td>{$linha.valor|string_format:"%.2f"}</td>
                                            <td class="">
                                                <a class="glyphicon glyphicon-refresh"  href="/caixa/novo/id_caixa/{$linha.id_caixa}"></a>
                                                <a class="glyphicon glyphicon-trash" onclick="confirmaExcluir({$linha.id_caixa});"></a> 
                                            </td>
                                        </tr>
                                    {foreachelse}
                                        <tr><td colspan="6">Nenhum lançamento de caixa encontrado</td></tr>
                                    {/foreach}        
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            {include file="comum/footer.tpl"}
            <script type="text/javascript" src="/files/js/caixa/caixa.js"></script>
    </body>
</html>
