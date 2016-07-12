<!DOCTYPE html>
<html lang="en">
    <head>
        {include file="comum/head.tpl"}
    </head>
    <body>
        <div>
            {$data = date('Y-m-d H:i:s')}            
            <h1>Caixa</h1>            
            <p class="user">Usuário: {$smarty.session.usuario.nome} | Data: {$data|date_format:'d/m/Y'}</p>            
            {foreach from=$registros item="linha_fazenda"}
                <label>Fazenda: {$linha_fazenda.nome_fazenda}</label><br>
                {foreach from=$linha_fazenda.centro_custo item="custo"}                     
                    <label>Centro Custo: {$custo.nome_centro_custo|default:'VAZIO'}</label>
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th>Data Registro</th>                            
                                <th>Histórico</th>                            
                                <th>Valor</th>                            
                            </tr>
                        </thead>
                        <tbody>
                            {foreach from=$custo.lancamentos item="caixa" name="total"}                    
                                <tr>
                                    <td>{$caixa.data_registro|date_format:'d/m/Y'}</td> 
                                    <td>{$caixa.historico}</td>
                                    <td>{$caixa.valor|number_format:2:",":"."}</td>                                                                
                                </tr>
                                {if $smarty.foreach.total.last}
                                <td></td>
                                <td></td>                                
                                <td><h2>Total: {$linha_fazenda.saldoFinal[$custo.id_centro_custo]|number_format:2:",":"."} </h2></td>
                            {/if}
                        {/foreach}
                        </tbody>
                    </table>
                {foreachelse}
                    <tr><td colspan="6">Nenhum registro encontrado</td></tr>
                {/foreach}
            {foreachelse}
                <tr><td colspan="6">Nenhum registro encontrado</td></tr>
            {/foreach}            
        </div>    
    </body>
</html>
