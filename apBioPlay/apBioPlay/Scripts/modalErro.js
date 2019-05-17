
var modal = document.getElementById("bg-modal");
var valido = document.getElementById("valido");
var EstaAberto = false;
var mensagem = '<span class="field-validation-valid" data-valmsg-for="u.Nome" data-valmsg-replace="true"></span><span class="field-validation-valid" data-valmsg-for="u.Senha" data-valmsg-replace="true"></span><span class="field-validation-valid" data-valmsg-for="u.Email" data-valmsg-replace="true"></span><span class="field-validation-valid" data-valmsg-for="u.DataNascimento" data-valmsg-replace="true"></span>';

if (valido.innerHTML == "NAO")
{
    modal.style.visibility = "initial";
    EstaAberto = true;
    console.log(EstaAberto);
}

document.getElementById("btn-ok").onclick = function() {
    if (EstaAberto)
        modal.style.visibility = "hidden";
}