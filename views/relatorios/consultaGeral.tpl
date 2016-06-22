<!DOCTYPE html>
<html>
    <head>
        {include file="comum/head.tpl"}
    </head>
    <body>
        <div>
            {$data = date('Y-m-d H:i:s')}            
            <h1>Consultas</h1>            
            <p class="user">Usuário: {$smarty.session.usuario.nome} | Data: {$data|date_format:'d/m/Y'}</p>            
            {foreach from=$registros item="linha_fazenda"}
                <label>Fazenda: {$linha_fazenda.nome_fazenda}</label>
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th>Nº Brinco</th>
                            <th>Data Nascimento</th>
                            <th>Sexo</th>                            
                            <th>Idade Atual</th>                            
                            <th>Tipo Registro</th>
                            <th>Data Registro</th>
                            <th>Pesagem</th>
                            <th>Inseminação</th>
                            <th>Descrição</th>
                        </tr>
                    </thead>
                    <tbody>
                        {foreach from=$linha_fazenda.consultas item="linha_consultas"}
                            <tr>
                                <td>{$linha_consultas.numero_brinco}</td>
                                <td>{$linha_consultas.data_nascimento|date_format:'d/m/Y'}</td>
                                <td>{$linha_consultas.sexo}</td>
                                <td>{$linha_consultas.idade}</td>
                                <td>{$linha_consultas.tipo_registro}</td>                                
                                <td>{$linha_consultas.data_registro|date_format:'d/m/Y'}</td>
                                <td>{$linha_consultas.peso_atual}</td>
                                <td>{$linha_consultas.semen}</td>
                                <td>{$linha_consultas.descricao}</td>
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
