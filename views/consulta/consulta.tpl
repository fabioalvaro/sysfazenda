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
                    <span class="title">Consultas</span>
                    <div class="description">
                        <label class="col-xs-12">Nova Consulta</label> 
                        <div class="col-xs-12 col-md-2 col-lg-2 button-m-top">
                            <a class="btn btn-primary glyphicon glyphicon-plus" href="/consulta/novo">Novo</a>                            
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
                                        <th>Fazenda</th>
                                        <th>Animal</th>
                                        <th>Idade Atual</th>
                                        <th>Peso Atual</th>
                                        <th>Ação</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    {foreach from=$consultas item="linha"}
                                        <tr>
                                            <td>{$linha.id_consulta}</td>
                                            <td>{$linha.data_registro}</td>
                                            <td>{$linha.id_fazenda}</td>
                                            <td>{$linha.id_animal}</td>
                                            <td>{$linha.idade}</td>
                                            <td>{$linha.peso_atual}</td>
                                            <td class="">
                                                <a class="glyphicon glyphicon-refresh"  href="/consulta/novo/id_consulta/{$linha.id_consulta}"></a>
                                                <a class="glyphicon glyphicon-trash" onclick="confirmaExcluir({$linha.id_consulta});"></a> 
                                            </td>
                                        </tr>
                                    {foreachelse}
                                        <tr><td colspan="6">Nenhuma consulta encontrado</td></tr>
                                    {/foreach}        
                                </tbody>
                            </table>
                        </div>
                    </div>
                    </div>
                </div>
            </div>
            {include file="comum/footer.tpl"}
            <script type="text/javascript" src="/files/js/consulta/consulta.js"></script>
    </body>
</html>
