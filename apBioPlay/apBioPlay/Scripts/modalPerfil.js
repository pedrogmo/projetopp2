
var modalP = document.getElementById("modal-perfil");

document.getElementById("alter").onclick = function () {
    modalP.style.visibility = "initial";
}

document.getElementById("close").onclick = function () {
    modalP.style.visibility = "hidden";
}

/* MODAL DE ERRO */

if (document.getElementById("msg").innerHTML.trim() != "")
    document.getElementById("bg-modal").style.visibility = "initial";

document.getElementById("btn-ok").onclick = function () {
    document.getElementById("bg-modal").style.visibility = "hidden";
}