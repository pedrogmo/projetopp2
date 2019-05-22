
var modal = document.getElementById("bg-modal");
var estaAberto = false;

document.getElementById("close").onclick = function () {
    console.log("FECHOU");
    modal.style.visibility = "hidden";
    estaAberto = false;
}

document.getElementById("notificacao").onclick = function () {

    if (!estaAberto) {
        modal.style.visibility = "initial";
        estaAberto = true;
    }
}

document.getElementById("notificacao2").onclick = function () {
    if (!estaAberto) {
        modal.style.visibility = "initial";
        estaAberto = true;
    }
}

