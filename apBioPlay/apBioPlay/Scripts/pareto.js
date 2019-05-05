var nomes = new Array();
var ocasioes = new Array();
var acumulados = new Array();
var totalOcasioes = 0;

function val(campo) {
    return document.getElementById(campo).innerHTML;
}

function acumulada(numero) {
    var result=0;
    for (var i = 0; i <= numero; i++)
        result += ocasioes[i];
    result = result / totalOcasioes;
    return (result * 100).toFixed(2);
}

window.onload = function () {
    var qtd = parseInt(val("quantidade"));
    for (var i = 0; i < qtd; i++) {
        nomes[i] = val("nome" + i);
        ocasioes[i] = parseInt(val("ocasioes" + i));
        totalOcasioes += ocasioes[i];
    }
    for (var i = 0; i < qtd; i++)
        acumulados[i] = acumulada(i);
    var ctx = document.getElementById("canvas").getContext("2d");
    window.myBar = new Chart(ctx, {
        type: 'bar',
        data: data,
        options: options
    });
};

var data = {
    labels: nomes,
    datasets: [{
        type: "line",
        label: "Acumulado",
        borderColor: "#BA1E14",
        backgroundColor: "#BA1E14",
        pointBorderWidth: 5,
        fill: false,
        data: acumulados,
        yAxisID: 'y-axis-2'
    }, {
        type: "bar",
        label: "Ocasiões",
        borderColor: "#000FAA",
        backgroundColor: "#000FAA",
        data: ocasioes,
        yAxisID: 'y-axis-1'
    }]
};

var options = {
    scales: {
        xAxes: [{
            stacked: true,
            scaleLabel: {
                display: true,
                labelString: "Erros"
            }
        }],

        yAxes: [{
            type: "linear",
            position: "left",
            id: "y-axis-1",
            stacked: true,
            ticks: {
                suggestedMin: 0
            },
            scaleLabel: {
                display: true,
                labelString: "Número"
            }
        }, {
            type: "linear",
            position: "right",
            id: "y-axis-2",
            ticks: {
                suggestedMin: 0,
                callback: function (value) {
                    return value + "%";
                }
            },
            scaleLabel: {
                display: true,
                labelString: "Porcentagem"
            }
        }]
    }
};