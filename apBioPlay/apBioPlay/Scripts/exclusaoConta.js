var confirm = document.getElementById("modal-confirm")
var botaoConfirm = document.getElementById("clicouExcluir")
var nao = document.getElementById("confirmNao")
confirm.style.visibility = "hidden";

botaoConfirm.onclick = function () {
    confirm.style.visibility = "initial";
}

nao.onclick = function () {
    confirm.style.visibility = "hidden";
}