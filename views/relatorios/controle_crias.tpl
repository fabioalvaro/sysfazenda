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
                            <th>Nº Brinco</th>                            
                            <th>Sexo</th>                            
                            <th>Data Nascimento</th>
                            <th>Idade</th>
                            <th>Nº Brinco Pai</th>
                            <th>Tipo Registro</th>
                            <th>Observações</th>
                        </tr>
                    </thead>
                    <tbody>
                        {foreach from=$linha_fazenda.animais item="linha_animais"}
                            <tr>
                                <td>{$linha_animais.numero_brinco}</td> 
                                <td>{$linha_animais.nome}</td>
                                <td>{$linha_animais.sexo}</td>                                
                                <td>{$linha_animais.data_nascimento|date_format:'d/m/Y'}</td>
                                <td>{$linha_animais.idade}</td>                                
                                <td>{$linha_animais.obs}</td>
                                <td>{$linha_animais.obs}</td>
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
