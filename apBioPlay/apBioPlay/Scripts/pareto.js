﻿var nomes = new Array();
var ocasioes = new Array();
var acumulados = new Array();
var totalOcasioes = 0;

function val(campo) {
    return document.getElementById(campo).innerHTML;
}

window.onload = function () {
    var qtd = parseInt(val("quantidade"));
    for (var i = 0; i < qtd; i++) {
        nomes[i] = val("nome" + i);
        ocasioes[i] = parseInt(val("poluicao" + i));
        totalOcasioes += ocasioes[i];
    }
    var valorAcumulado = 0;
    for (var i = 0; i < qtd; i++) {
        valorAcumulado += ocasioes[i];
        acumulados[i] = (valorAcumulado / totalOcasioes * 100).toFixed(2);
    }
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
        borderColor: "#77ff33",
        backgroundColor: "#77ff33",
        pointBorderWidth: 5,
        fill: false,
        data: acumulados,
        yAxisID: 'y-axis-2'
    }, {
        type: "bar",
        label: "Poluição (µg/m³)",
        borderColor: "#d9d9d9",
        backgroundColor: "#d9d9d9",
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
                labelString: "Cidades"
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