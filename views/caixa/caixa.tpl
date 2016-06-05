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
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Data</th>
                                        <th>Fazenda</th>
                                        <th>Nº do brinco</th>
                                        <th>Nome</th>
                                        <th>Sexo</th>
                                        <th>Data Nascimento</th>
                                        <th>Peso</th>                                        
                                        <th>Ação</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <th scope="row">1</th>
                                        <td>Fazenda São Francisco</td>
                                        <td>Jundiaí</td>
                                        <td>10.000 M²</td>
                                        <td>8.000 M²</td>
                                        <td>1234564477</td>
                                        <td>José</td>
                                        <td>José</td>                                        
                                        <td><span class="glyphicon glyphicon-refresh" aria-hidden="true"></span> | <span class="glyphicon glyphicon-trash" aria-hidden="true"></span></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">2</th>
                                        <td>Fazenda Joãozinho</td>
                                        <td>São Paulo</td>
                                        <td>5.000 M²</td>
                                        <td>4.000 M²</td>
                                        <td>12123211121</td>
                                        <td>João</td>
                                        <td>João</td>
                                        <td><span class="glyphicon glyphicon-refresh" aria-hidden="true"></span> | <span class="glyphicon glyphicon-trash" aria-hidden="true"></span></td>
                                    </tr>                                    
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            {include file="comum/footer.tpl"}
    </body>
</html>
