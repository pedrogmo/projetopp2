
var nao = document.getElementById("nao");
var modal = document.getElementById("bg-modal");
var voltar = document.getElementById("voltar");

nao.onclick = function () {
    modal.style.visibility = "hidden";
}

voltar.onclick = function () {
    modal.style.visibility = "initial";
}