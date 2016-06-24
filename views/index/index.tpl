<!DOCTYPE html>
<html lang="en">
    <head>
        {include file="comum/head.tpl"}
    </head>
    <body class="flat-blue">    
        {include file="comum/menu.tpl"}
        <div class="row  no-margin-bottom">
            <div class="row">
                <div class="col-xs-6">
                    <div class="card primary">
                        <div class="card-header">
                            <div class="card-title">
                                <div class="title">Nascimentos por Data</div>
                            </div>
                        </div
                        <div class="card-jumbotron no-padding">
                            <canvas id="jumbotron-line-chart" class="chart no-padding"></canvas>
                        </div>
                        {*<div class="card-body half-padding">
                        <h4 class="float-left no-margin font-weight-300">Nascimentos por Data</h4>
                        <div class="clear-both"></div>
                        </div>*}
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-6">
                    <div class="card">
                        <div class="card-header">
                            <div class="card-title">
                                <div class="title">Animais por Genero</div>
                            </div>
                        </div>
                        <div class="card-body no-padding">
                            <canvas id="pie-chart" class="chart"></canvas>
                        </div>
                    </div>
                </div>
                <div class="col-xs-6">
                    <div class="card">
                        <div class="card-header">
                            <div class="card-title">
                                <div class="title">Animais por Fazenda</div>
                            </div>
                        </div>
                        <div class="card-body no-padding">
                            <canvas id="bar-chart" class="chart"></canvas>
                        </div>
                    </div>
                </div>
            </div>



            {*<div class="col-sm-6 col-xs-12">
            <div class="row">
            <div class="col-md-6 col-sm-12">
            <div class="card primary">
            <div class="card-jumbotron no-padding">
            <canvas id="jumbotron-bar-chart" class="chart no-padding"></canvas>
            </div>
            <div class="card-body half-padding">
            <h4 class="float-left no-margin font-weight-300">Orders</h4>
            <div class="clear-both"></div>
            </div>
            </div>
            </div>
            {*<div class="col-md-6 col-sm-12">
            <div class="card primary">
            <div class="card-jumbotron no-padding">
            <canvas id="jumbotron-line-2-chart" class="chart no-padding"></canvas>
            </div>
            <div class="card-body half-padding">
            <h4 class="float-left no-margin font-weight-300">Animais por Fazenda</h4>
            <div class="clear-both"></div>
            </div>
            </div>
            </div>*}
        </div>
    </div>*}
    {*<div class="card card-success">
    <div class="card-header">
    <div class="card-title">
    <div class="title"><i class="fa fa-comments-o"></i> Last Message</div>
    </div>
    <div class="clear-both"></div>
    </div>
    <div class="card-body no-padding">
    <ul class="message-list">
    <a href="#">
    <li>
    <img src="img/profile/profile-1.jpg" class="profile-img pull-left">
    <div class="message-block">
    <div><span class="username">Tui2Tone</span> <span class="message-datetime">12 min ago</span>
    </div>
    <div class="message">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur bibendum ornare dolor, quis ullamcorper ligula sodales.</div>
    </div>
    </li>
    </a>
    <a href="#">
    <li>
    <img src="img/profile/profile-1.jpg" class="profile-img pull-left">
    <div class="message-block">
    <div><span class="username">Tui2Tone</span> <span class="message-datetime">15 min ago</span>
    </div>
    <div class="message">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur bibendum ornare dolor, quis ullamcorper ligula sodales.</div>
    </div>
    </li>
    </a>
    <a href="#">
    <li>
    <img src="img/profile/profile-1.jpg" class="profile-img pull-left">
    <div class="message-block">
    <div><span class="username">Tui2Tone</span> <span class="message-datetime">2 hour ago</span>
    </div>
    <div class="message">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur bibendum ornare dolor, quis ullamcorper ligula sodales.</div>
    </div>
    </li>
    </a>
    <a href="#">
    <li>
    <img src="img/profile/profile-1.jpg" class="profile-img pull-left">
    <div class="message-block">
    <div><span class="username">Tui2Tone</span> <span class="message-datetime">1 day ago</span>
    </div>
    <div class="message">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur bibendum ornare dolor, quis ullamcorper ligula sodales.</div>
    </div>
    </li>
    </a>
    <a href="#" id="message-load-more">
    <li class="text-center load-more">
    <i class="fa fa-refresh"></i> load more..
    </li>
    </a>
    </ul>
    </div>
    </div>*}

</div>

{include file="comum/footer.tpl"}
<script type="text/javascript" src="/files/js/index.js"></script>
<script type="text/javascript" src="/files/js/chartjs.js"></script>
<script type="text/javascript" src="/files/js/Chart.min.js"></script>
</body>
</html>
