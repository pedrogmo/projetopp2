
var sair = document.getElementById("sair");
var modal = document.getElementById("black-content");
var btnNovo = document.getElementById("new");
var btnBuscar = document.getElementById("buscar");
var temResultado = document.getElementById("temResultado").value;
var caixa = document.getElementById("caixa");
var estaAberto = false;

window.onload = function () {
        modal.classList.add("invisivel");
        /*sessionStorage.removeItem('temResultado');*/
       
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
    sessionStorage.setItem("temResultado", temResultado);
    estaAberto = true;
}