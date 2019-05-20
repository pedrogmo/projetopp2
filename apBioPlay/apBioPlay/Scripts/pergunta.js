var opcao = document.getElementsByName("pic");
for (var i = 0; i < opcao.length; ++i)
    opcao[i].onclick = clique(i);

function clique(a) {
    document.getElementById("selecionada").value = a;
}