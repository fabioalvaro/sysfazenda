<!DOCTYPE html>
<html lang="en">
    <head>
        {include file="comum/head.tpl"}         
    </head>

    <body class="flat-blue login-page" style="background-image:url('/files/images/img_4.jpg')">
        <div class="container" >
            <div class="login-box ">
                <div>
                    <div class="login-form row">                       
                        <div class="col-sm-12" >
                            <div class="login-body" style="background-color:rgba(0, 0, 0, 0.3)">
                                <div class="progress hidden" id="login-progress">
                                    <div class="progress-bar progress-bar-success progress-bar-striped active" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width: 100%">
                                        Log In...
                                    </div>
                                </div>
                                <form 
                                 action="/">
                                    <div class="control">
                                        <input type="text" class="form-control" value="admin@gmail.com" />
                                    </div>
                                    <div class="control">
                                        <input type="password" class="form-control" value="123456" />
                                    </div>
                                    <div class="login-button text-center">
                                        <input type="submit" class="btn btn-primary" value="Login">
                                    </div>
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
