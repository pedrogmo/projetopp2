
var sair = document.getElementById("sair");
var modal = document.getElementById("black-content");
var btnNovo = document.getElementById("new");
var estaAberto = false;

sair.onclick = function () {
    modal.style.visibility = "hidden";
    estaAberto = false;
}

btnNovo.onclick = function () {
    modal.style.visibility = "initial";
    estaAberto = true;
}