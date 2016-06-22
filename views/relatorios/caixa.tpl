<!DOCTYPE html>
<html>
    <head>
        {include file="comum/head.tpl"}
    </head>
    <body>
        <div>
            {$data = date('Y-m-d H:i:s')}            
            <h1>Caixa</h1>            
            <p class="user">Usuário: {$smarty.session.usuario.nome} | Data: {$data|date_format:'d/m/Y'}</p>            
            {foreach from=$registros item="linha_fazenda"}
                <label>Fazenda: {$linha_fazenda.nome_fazenda}</label>
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th>Data Registro</th>                            
                            <th>Histórico</th>                            
                            <th>Valor</th>                            
                        </tr>
                    </thead>
                    <tbody>
                        {foreach from=$linha_fazenda.caixas item="linha_caixas"}
                            <tr>
                                <td>{$linha_caixas.data_registro}</td> 
                                <td>{$linha_caixas.historico}</td>
                                <td>{$linha_caixas.valor}</td>                                                                
                            </tr>
                        {foreachelse}
                            <tr><td colspan="6">Nenhum registro encontrado</td></tr>
                        {/foreach}        
                    </tbody>
                </table>
                <h1>Total: {$linha_fazenda.saldoFinal} </h1>
            {foreachelse}
                <tr><td colspan="6">Nenhum registro encontrado</td></tr>
            {/foreach}
            
        </div>
    </body>
</html>
