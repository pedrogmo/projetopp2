var opcao = document.getElementsByName("pic");
for (var i = 0; i < opcao.length; ++i) {
    opcao[i].onclick = function () {
        document.getElementById("selecionada").value = i + "";
    }
}