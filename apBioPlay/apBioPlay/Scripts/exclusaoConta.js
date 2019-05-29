var confirm = document.getElementById("modal-confirm")
var exibirConfirm = document.getElementById("exibirExclusao").value;

if (exibirConfirm == 'N') {
    confirm.style.visibility = "hidden";
} else if (exibirConfirm == 'S') {
    confirm.style.visibility = "initial";
}