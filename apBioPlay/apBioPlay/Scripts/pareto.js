function val(campo) {
    return document.getElementById(campo).innerHTML;
}

function acumulada(numero) {
    var total = parseInt(val("ocasioes1")) + parseInt(val("ocasioes2")) + parseInt(val("ocasioes3")) + parseInt(val("ocasioes4")) + parseInt(val("ocasioes5"));
    var result;
    switch (numero) {
        case 1:
            result = parseInt(val("ocasioes1")) / total;
            break;
        case 2:
            result = (parseInt(val("ocasioes1")) + parseInt(val("ocasioes2"))) / total;
            break;
        case 3:
            result = (parseInt(val("ocasioes1")) + parseInt(val("ocasioes2")) + parseInt(val("ocasioes3"))) / total;
            break;
        case 4:
            result = (parseInt(val("ocasioes1")) + parseInt(val("ocasioes2")) + parseInt(val("ocasioes3")) + parseInt(val("ocasioes4"))) / total;
            break;
        case 5:
            result = 1;
            break;
    }
    return (result * 100).toFixed(2);
}

var data = {
    labels: [val("nome1"), val("nome2"), val("nome3"), val("nome4"), val("nome5")],
    datasets: [{
        type: "line",
        label: "Acumulado",
        borderColor: "#BA1E14",
        backgroundColor: "#BA1E14",
        pointBorderWidth: 5,
        fill: false,
        data: [acumulada(1), acumulada(2), acumulada(3), acumulada(4), acumulada(5)],
        yAxisID: 'y-axis-2'
    }, {
        type: "bar",
        label: "Ocasiões",
        borderColor: "#000FAA",
        backgroundColor: "#000FAA",
        data: [val("ocasioes1"), val("ocasioes2"), val("ocasioes3"), val("ocasioes4"), val("ocasioes5")],
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

window.onload = function () {
    var ctx = document.getElementById("canvas").getContext("2d");

    window.myBar = new Chart(ctx, {
        type: 'bar',
        data: data,
        options: options
    });
};