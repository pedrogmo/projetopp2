
var modal = document.getElementById("bg-modal");
var sino = document.getElementById("notificacao");
var EstaAberto = false;

document.getElementById("close").onclick = function () {
    modal.style.visibility = "hidden";
    var EstaAberto = false;
}

sino.onclick = function () {
    modal.style.visibility = "initital";
    var EstaAberto = true;
}

