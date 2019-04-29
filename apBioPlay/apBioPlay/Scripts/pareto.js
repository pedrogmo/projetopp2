﻿var data = {
    labels: ["8", "7", "9", "11", "10"],
    datasets: [{
        type: "line",
        label: "Acumulado",
        borderColor: "#BA1E14",
        backgroundColor: "#BA1E14",
        pointBorderWidth: 5,
        fill: false,
        data: [34.04, 57.45, 76.60, 89.36, 100.00],
        yAxisID: 'y-axis-2'
    }, {
        type: "bar",
        label: "Asistencia",
        borderColor: "#56B513",
        backgroundColor: "#56B513",
        data: [16, 11, 9, 6, 5],
        yAxisID: 'y-axis-1'
    }, {
        type: "bar",
        label: "Solución",
        borderColor: "#000FAA",
        backgroundColor: "#000FAA",
        data: [16, 11, 9, 6, 5],
        yAxisID: 'y-axis-1'
    }]
};

var options = {
    scales: {
        xAxes: [{
            stacked: true,
            scaleLabel: {
                display: true,
                labelString: "Estaciones"
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
                labelString: "Minutos"
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
                labelString: "Porcentaje"
            }
        }]
    }
};

window.onload = function () {
    var ctx = document.getElementById("canvas").getContext("2d");

    window.myBar = new Chart(ctx, {
        type: 'bar',
        data: data,
        options: options
    });
};