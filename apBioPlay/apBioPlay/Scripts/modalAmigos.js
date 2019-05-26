
var sair = document.getElementById("sair");
var modal = document.getElementById("black-content");
var btnNovo = document.getElementById("new");
var btnBuscar = document.getElementById("buscar");
var temResultado = document.getElementById("temResultado");
var caixa = document.getElementById("caixa");
var estaAberto = false;

window.onload = function () {
    if (sessionStorage.getItem("temResultado") == null)
        modal.classList.add("invisivel");
       
}

sair.onclick = function () {
    modal.classList.add("invisivel");

    if (sessionStorage.getItem("temResultado") != null)
        sessionStorage.removeItem('temResultado');
}

btnNovo.onclick = function () {
    modal.classList.remove("invisivel");
}

btnBuscar.onclick = function () {
    modal.classList.remove("invisivel");
    estaAberto = true;
    sessionStorage.setItem("temResultado", temResultado.value);
}