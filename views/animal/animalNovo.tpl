<!DOCTYPE html>
<html lang="en">
    <head>
        {include file="comum/head.tpl"}
    </head>
    <body class="flat-blue">    
        {include file="comum/menu.tpl"}
        <div class="row">
            <div class="col-xs-12">
                <div class="card">
                    <div class="card-header">
                        <div class="card-title">
                            <div class="title">Novo Animal</div>
                        </div>
                    </div>
                    <div class="card-body">
                        <form  class="form-horizontal" 
                               name="frm_animal" 
                               action="/animal/gravar" 
                               method="post"
                               enctype="multipart/form-data"
                               onsubmit="return validaForm();"
                               >                        
                            <div class="form-group has-error">
                                <label for="data_registro" class="col-sm-2 control-label">Data Registro</label>
                                <div class="col-sm-4">
                                    <input type="hidden" class="form-control" name="id_animal" id="id_animal" value="{$registro.id_animal|default:''}">
                                    <input type="text" class="col-sm-4" id="data_registro" placeholder="Data Registro" value="{$registro.data_registro|default:''|date_format:'d/m/Y'}" name="data_registro">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="data_nascimento" class="col-sm-2 control-label">Data Nascimento</label>
                                <div class="col-sm-4">                                    
                                    <input type="datetime" class="col-sm-4" id="data_nascimento" placeholder="Data Nascimento" name="data_nascimento" value="{$registro.data_nascimento|default:''|date_format:'d/m/Y'}">
                                </div>
                            </div>
                            <div class="form-group has-error">
                                <label for="fazenda" class="col-sm-2 control-label">Fazenda</label>
                                <div class="col-sm-4">
                                    <select id="fazenda" name="fazenda" placeholder="Fazenda" class="col-xs-12">
                                        {html_options options=$options_fazendas|default:'' selected=$registro.id_fazenda}
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="numero_brinco" class="col-sm-2 control-label">Nº Brinco</label>
                                <div class="col-sm-4">
                                    <input type="text" class="form-control" id="numero_brinco" name="numero_brinco" placeholder="Nº Brinco" value="{$registro.numero_brinco|default:''}">
                                </div>
                            </div>
                            <div class="form-group has-error">
                                <label for="nome" class="col-sm-2 control-label">Nome</label>
                                <div class="col-sm-4">
                                    <input type="text" class="form-control" id="nome" name="nome" value="{$registro.nome|default:''}" placeholder="Nome">
                                </div>
                            </div>
                            <div class="form-group has-error">
                                <label for="sexo" class="col-sm-2 control-label">Sexo</label>
                                <div class="col-sm-4">
                                    <select id="sexo" name="sexo" placeholder="Sexo" class="col-xs-12">
                                        {html_options options=$options_sexo|default:'' selected=$registro.sexo}
                                    </select>
                                </div>
                            </div>                            
                            <div class="form-group">
                                <label for="peso" class="col-sm-2 control-label">Peso</label>
                                <div class="col-sm-4">
                                    <input type="text" class="form-control" name="peso" id="peso" value="{$registro.peso|default:''|number_format:2:",":"."}" placeholder="peso">
                                </div>
                            </div>
                            <div class="form-group has-error">
                                <label for="tipo_registro" class="col-sm-2 control-label">Tipo Registro</label>
                                <div class="col-sm-4">
                                    <select id="tipo_registro" name="tipo_registro" placeholder="Tipo Registro" class="col-xs-12">
                                        {html_options options=$options_tipo_registro|default:'' selected=$registro.tipo_registro}
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="id_mae" class="col-sm-2 control-label">Mãe</label>
                                <div class="col-sm-4">
                                    <select id="id_mae" name="id_mae" placeholder="Mãe" class="col-xs-12">
                                        {html_options options=$options_animais_maes|default:'' selected=$registro.id_mae}
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="id_pai" class="col-sm-2 control-label">Pai</label>
                                <div class="col-sm-4">
                                    <select id="id_pai" name="id_pai" placeholder="Pai" class="col-xs-12">
                                        {html_options options=$options_animais_pais|default:'' selected=$registro.id_pai}
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="id_semen" class="col-sm-2 control-label">Semen</label>
                                <div class="col-sm-4">
                                    <select id="id_mae" name="id_semen" placeholder="Semen" class="col-xs-12">
                                        {html_options options=$options_semen|default:'' selected=$registro.id_semen}
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="procedencia" class="col-sm-2 control-label">Procedencia</label>
                                <div class="col-sm-4">
                                    <input type="text" class="form-control" id="procedencia" value="{$registro.procedencia|default:''}" name="procedencia" placeholder="Procedencia">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="caracteristicas" class="col-sm-2 control-label">Caracteristicas</label>
                                <div class="col-sm-4">
                                    <input type="text" class="form-control" id="caracteristicas" name="caracteristicas" value="{$registro.caracteristicas|default:''}" placeholder="Caracteristicas">
                                </div>
                            </div>                           
                            <div class="form-group">
                                <label for="observacao" class="col-sm-2 control-label">Observação</label>
                                <div class="col-sm-4">
                                    <input type="text" class="form-control" id="observacao" name="observacao" value="{$registro.obs|default:''}" placeholder="Observação">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="descontinuado" class="col-sm-2 control-label">Descontinuado</label>
                                <div class="col-sm-4">
                                    <input type="checkbox" class="form-control" id="descontinuado" name="descontinuado" {if $registro.flag_descontinuado == 1} checked="true"{/if} onclick="escondeDescontinuado();">
                                </div>
                            </div>
                            <div id="desc">
                                <div class="form-group">
                                    <label for="data_descontinuado" class="col-sm-2 control-label">Data Descontinuado</label>
                                    <div class="col-sm-4">                                        
                                        <input type="text" class="col-sm-4" id="data_descontinuado" placeholder="Data Descontinuado" value="{$registro.data_descontinuado|default:''|date_format:'d/m/Y'}" name="data_descontinuado">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="motivo_descontinuado" class="col-sm-2 control-label">Motivo Descontinuado</label>
                                    <div class="col-sm-4">
                                        <input type="text" class="form-control" id="motivo_descontinuado" name="motivo_descontinuado" value="{$registro.motivo_descontinuado|default:''}" placeholder="Motivo Descontinuado">
                                    </div>
                                </div>
                            </div>                                    
                            <div class="form-group">
                                {*                                <label for="area_util" class="col-sm-2 control-label">Área Útil</label>*}
                                <div class="col-sm-4">
                                    <input type="submit" id="salvar" class="btn btn-info" value="SALVAR" />
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        {include file="comum/footer.tpl"}        
        <link   rel="stylesheet" type="text/css" href="/files/css/datepicker.css">
        <script type="text/javascript" src="/files/js/bootstrap-datepicker.js"></script>
        <script type="text/javascript" src="/files/js/animal/animal.js"></script>
    </body>
</html>
