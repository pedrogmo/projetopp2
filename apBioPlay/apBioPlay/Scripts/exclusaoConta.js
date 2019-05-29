var confirm = document.getElementById("modal-confirm")
var exibirConfirm = document.getElementById("exibirExcluir").innerHTML;

if (exibirConfirm == 'N') {
    confirm.style.visibility = "hidden";
} else if (exibirConfirm == 'S') {
    confirm.style.visibility = "initial";
}