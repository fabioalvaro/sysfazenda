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
                    <span class="title">Animais</span>
                    <div class="description">
                        <label class="col-xs-12">Cadastro de Animal</label> 
                        <div class="col-xs-12 col-md-2 col-lg-2 button-m-top">
                            <a class="btn btn-primary glyphicon glyphicon-plus" href="/animal/novo">Novo</a>                            
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
                                        <th>Nome</th>
                                        <th>Nº Brinco</th>
                                        <th>Sexo</th>
                                        <th>Peso</th>
                                        <th>Ação</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    {foreach from=$animais item="linha"}
                                        <tr>
                                            <td>{$linha.id_animal}</td>
                                            <td>{$linha.data_registro|date_format:'d/m/Y'}</td>
                                            <td>{$linha.nomeFazenda}</td>                                            
                                            <td>{$linha.nome}</td>
                                            <td>{$linha.numero_brinco}</td>
                                            <td>{$linha.sexo}</td>
                                            <td>{$linha.peso|string_format:"%.2f"}</td>
                                            <td class="">
                                                <a class="glyphicon glyphicon-refresh"  href="/animal/novo/id_animal/{$linha.id_animal}"></a>
                                                <a class="glyphicon glyphicon-trash" onclick="confirmaExcluir({$linha.id_animal});"></a> 
                                            </td>
                                        </tr>
                                    {foreachelse}
                                        <tr><td colspan="6">Nenhum Animal encontrado</td></tr>
                                    {/foreach}        
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            {include file="comum/footer.tpl"}
            <script type="text/javascript" src="/files/js/animal/animal.js"></script>
    </body>
</html>
