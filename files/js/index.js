$(function () {
    var ctx, dataRetorno, data, myLineChart, options;
    Chart.defaults.global.responsive = true;
    ctx = $('#jumbotron-line-chart').get(0).getContext('2d');
    options = {
        showScale: true,
        scaleShowGridLines: false,
        scaleGridLineColor: "rgba(0,0,0,.05)",
        scaleGridLineWidth: 0,
        scaleShowHorizontalLines: false,
        scaleShowVerticalLines: false,
        bezierCurve: false,
        bezierCurveTension: 0.4,
        pointDot: true,
        pointDotRadius: 0,
        pointDotStrokeWidth: 2,
        pointHitDetectionRadius: 20,
        datasetStroke: true,
        datasetStrokeWidth: 4,
        datasetFill: true,
        legendTemplate: "<ul class=\"<%=name.toLowerCase()%>-legend\"><% for (var i=0; i<datasets.length; i++){%><li><span style=\"background-color:<%=datasets[i].strokeColor%>\"></span><%if(datasets[i].label){%><%=datasets[i].label%><%}%></li><%}%></ul>"
    };
    //buscando dados do banco
    $.ajax({
        url: "/index/graficoNascimentoPorData/",
        type: 'POST',
        data: {'id_grafico': 1},
        dataType: 'json',
        async: false,
        success: function (result) {
            dataRetorno = result;
        }
    });

    data = dataRetorno;
    myLineChart = new Chart(ctx).Line(data, options);
});

$(function () {
    var ctx, data, dataRetorno, myBarChart, option_bars;
    Chart.defaults.global.responsive = true;
    ctx = $('#bar-chart').get(0).getContext('2d');
    option_bars = {
        scaleBeginAtZero: true,
        scaleShowGridLines: true,
        scaleGridLineColor: "rgba(0,0,0,.05)",
        scaleGridLineWidth: 1,
        scaleShowHorizontalLines: false,
        scaleShowVerticalLines: false,
        barShowStroke: true,
        barStrokeWidth: 1,
        barValueSpacing: 5,
        barDatasetSpacing: 3,
        legendTemplate: "<ul class=\"<%=name.toLowerCase()%>-legend\"><% for (var i=0; i<datasets.length; i++){%><li><span style=\"background-color:<%=datasets[i].fillColor%>\"></span><%if(datasets[i].label){%><%=datasets[i].label%><%}%></li><%}%></ul>"
    };
    //busca os dados do banco
    $.ajax({
        url: "/index/graficoAnimaisPorFazenda/",
        type: 'POST',
        data: {'id_grafico': 2},
        dataType: 'json',
        async: false,
        success: function (result) {
            dataRetorno = result;
        }
    });
    data = dataRetorno;
    myBarChart = new Chart(ctx).Bar(data, option_bars);
});

$(function () {
    var ctx, data,dataRetorno, myLineChart, options;
    Chart.defaults.global.responsive = true;
    ctx = $('#pie-chart').get(0).getContext('2d');
    options = {
        showScale: false,
        scaleShowGridLines: false,
        scaleGridLineColor: "rgba(0,0,0,.05)",
        scaleGridLineWidth: 0,
        scaleShowHorizontalLines: false,
        scaleShowVerticalLines: false,
        bezierCurve: false,
        bezierCurveTension: 0.4,
        pointDot: false,
        pointDotRadius: 0,
        pointDotStrokeWidth: 2,
        pointHitDetectionRadius: 20,
        datasetStroke: true,
        datasetStrokeWidth: 4,
        datasetFill: true,
        legendTemplate: "<ul class=\"<%=name.toLowerCase()%>-legend\"><% for (var i=0; i<datasets.length; i++){%><li><span style=\"background-color:<%=datasets[i].strokeColor%>\"></span><%if(datasets[i].label){%><%=datasets[i].label%><%}%></li><%}%></ul>"
    };
    //busca os dados do banco
    $.ajax({
        url: "/index/graficoAnimaisPorSexo/",
        type: 'POST',
        data: {'id_grafico': 3},
        dataType: 'json',
        async: false,
        success: function (result) {
            dataRetorno = result;
        }
    });
    data = dataRetorno;
    
//    data = [
//        {
//            value: 50,
//            color: "#FA2A00",
//            highlight: "#FA2A00",
//            label: "Femea"
//        }, {
//            value: 50,
//            color: "#00008B",
//            highlight: "#00008B",
//            label: "Macho"
//        }
//    ];
    myLineChart = new Chart(ctx).Pie(data, options);
});