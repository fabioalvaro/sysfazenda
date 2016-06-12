<!DOCTYPE html>
<html lang="en">
    <head>
        {include file="comum/head.tpl"}         
    </head>

    <body class="flat-blue login-page" style="background-image:url('/files/images/img_3.jpg')">
        <div class="container" >
            <div class="login-box ">
                <div>
                    <div class="login-form row">                       
                        <div class="col-sm-12" >
                            <div class="login-body" style="background-color:rgba(0, 0, 0, 0.3)">                                
                                <form                                     
                                    action="/login/logar"
                                    method="post">
                                    <h2 class="form-signin-heading" style="color: #DDDDDD" >Login</h2>
                                    <label for="usuario" class="sr-only">Usuário</label>
                                    <input type="text" id="usuario" name="usuario" class="form-control" placeholder="Usuário" required autofocus>
                                    <label for="senha" class="sr-only">Senha</label>
                                    <input type="password" id="senha" class="form-control" name="senha" placeholder="Senha" required>                                    
                                    <button class="btn btn-lg btn-primary btn-block" type="submit">Logar</button>
                                </form>
                            </div>                           
                        </div>
                    </div>
                </div>
            </div>
        </div>
        {include file="comum/footer.tpl"}
    </body>

</html>
