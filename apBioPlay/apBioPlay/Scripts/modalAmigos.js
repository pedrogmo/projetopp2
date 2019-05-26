
var sair = document.getElementById("sair");
var modal = document.getElementById("black-content");
var btnNovo = document.getElementById("new");
var btnBuscar = document.getElementById("buscar");
var temResultado = document.getElementById("temResultado");
var caixa = document.getElementById("caixa");
var estaAberto = false;


if (temResultado.value=="N")
    modal.classList.add("invisivel");       

sair.onclick = function () {
    modal.classList.add("invisivel");
}

btnNovo.onclick = function () {
    modal.classList.remove("invisivel");
}

btnBuscar.onclick = function () {
    modal.classList.remove("invisivel");
    estaAberto = true;
}