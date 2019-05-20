
var modalErro = document.getElementById("bg-modal");
var valido = document.getElementById("valido");
var EstaAberto = false;


if (valido.innerHTML == "NAO")
{
    modalErro.style.visibility = "initial";
    EstaAberto = true;
}

document.getElementById("btn-ok").onclick = function() {
    if (EstaAberto)
        modalErro.style.visibility = "hidden";
}