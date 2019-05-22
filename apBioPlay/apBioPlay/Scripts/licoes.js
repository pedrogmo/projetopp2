var nomes = new Array();
var quantidade = new Array();
var acumulados = new Array();
var total = 0;

function val(campo) {
    return document.getElementById(campo).innerHTML;
}

window.onload = function () {
    quantidade[0] = parseInt(val("qtd0"));
    quantidade[1] = parseInt(val("qtd1"));

    total = quantidade[0] + quantidade[1];

    nomes[0] = 'Acertos';
    nomes[1] = 'Erros';

    if (quantidade[0] < quantidade[1]) {
        //Inverte vetores:
        var aux = quantidade[0];
        quantidade[0] = quantidade[1];
        quantidade[1] = aux;

        var aux2 = nomes[0];
        nomes[0] = nomes[1];
        nomes[1] = aux2;
    }

    acumulados[0] = (quantidade[0] / total * 100).toFixed(2);
    acumulados[1] = ((quantidade[0] + quantidade[1]) / total * 100).toFixed(2);

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
        label: "Quantidade",
        borderColor: "#d9d9d9",
        backgroundColor: "#d9d9d9",
        data: quantidade,
        yAxisID: 'y-axis-1'
    }]
};

var options = {
    scales: {
        xAxes: [{
            stacked: true,
            scaleLabel: {
                display: true,
                labelString: "Questões respondidas"
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