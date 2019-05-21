
var modal = document.getElementById("bg-modal");
var sino = document.getElementById("notificacao");
var estaAberto = false;

document.getElementById("close").onclick = function () {
    modal.style.visibility = "hidden";
    var estaAberto = false;
}

sino.onclick = function () {
    modal.style.visibility = "initital";
    var estaAberto = true;
}

