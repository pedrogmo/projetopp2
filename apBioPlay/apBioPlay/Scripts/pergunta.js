
var selecionada = document.getElementById("selecionada");

/*var pics = document.getElementsByName("pic");

for (var i = 0; i < pics.length; ++i)
    pics[i].onclick = clique(i);

function clique(a) {
    selecionada.value = a + "";
}*/

$(document).ready(function () {
    $("input[name='pic']").each(function (index) {
        $(this).on("click", function () {
            selecionada.value = index + "";
        });
    });
})