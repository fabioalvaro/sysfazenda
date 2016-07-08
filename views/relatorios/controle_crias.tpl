<!DOCTYPE html>
<html>
    <head>
        {include file="comum/head.tpl"}
    </head>
    <body>
        <div>
            {$data = date('Y-m-d H:i:s')}            
            <h1>Controle de Crias</h1>            
            <p class="user">Usuário: {$smarty.session.usuario.nome} | Data: {$data|date_format:'d/m/Y'}</p>            
            {foreach from=$registros item="linha_fazenda"}
                <label>Fazenda: {$linha_fazenda.nome_fazenda}</label>
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th>Nº Brinco Mãe</th>                             
                            <th>Nº Brinco</th>                            
                            <th>Sexo</th>                            
                            <th>Data Nascimento</th>
                            <th>Idade Atual</th>
                            <th>Nº Brinco Pai</th>
                            <th>Tipo Registro</th>
                            <th>Observações</th>
                        </tr>
                    </thead>
                    <tbody>
                        {foreach from=$linha_fazenda.crias item="linha_crias"}
                            <tr>
                                <td>{$linha_crias.brincoMae}</td>                                
                                <td>{$linha_crias.numero_brinco}</td> 
                                <td>{$linha_crias.sexo}</td>
                                <td>{$linha_crias.data_nascimento|date_format:'d/m/Y'}</td>                                
                                <td>{$linha_crias.idade}</td>
                                <td>{$linha_crias.brincoPai}</td> 
                                <td>{$linha_crias.tipo_registro}</td>
                                <td>{$linha_crias.obs}</td>
                            </tr>
                        {foreachelse}
                            <tr><td colspan="6">Nenhum registro encontrado</td></tr>
                        {/foreach}        
                    </tbody>
                </table>
            {foreachelse}
                <tr><td colspan="6">Nenhum registro encontrado</td></tr>
            {/foreach}    
        </div>
    </body>
</html>
