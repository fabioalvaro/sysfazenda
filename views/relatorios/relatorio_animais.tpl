<!DOCTYPE html>
<html>
    <head>
        {include file="comum/head.tpl"}
    </head>
    <body>
        <div>
            {$data = date('Y-m-d H:i:s')}            
            <h1>Relatorio de Animais</h1>            
            <p class="user">Usuário: {$smarty.session.usuario.nome} | Data: {$data}</p>            
            {foreach from=$registros item="linha_fazenda"}
                <label>Fazenda: {$linha_fazenda.nome_fazenda}</label>
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th>Nº Brinco</th>
                            <th>Nome</th>
                            <th>Sexo</th>
                            <th>Classificação</th>
                            <th>Data Nascimento</th>
                            <th>Idade</th>
                            <th>Peso</th>
                            <th>Observações</th>
                        </tr>
                    </thead>
                    <tbody>
                        {foreach from=$linha_fazenda.animais item="linha_animais"}
                            <tr>
                                <td>{$linha_animais.numero_brinco}</td> 
                                <td>{$linha_animais.nome}</td>
                                <td>{$linha_animais.sexo}</td>
                                <td>{$linha_animais.classificacao}</td>
                                <td>{$linha_animais.data_nascimento}</td>
                                <td>{$linha_animais.idade}</td>
                                <td>{$linha_animais.peso}</td>
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
