var pic0 = document.getElementById("pic0");
var pic1 = document.getElementById("pic1");
var pic2 = document.getElementById("pic2");
var pic3 = document.getElementById("pic3");
var selecionada = document.getElementById("sel");

pic0.onclick = function () {
    selecionada.value = "0";
}

pic1.onclick = function () {
    selecionada.value = "1";
}

pic2.onclick = function () {
    selecionada.value = "2";
}

pic3.onclick = function () {
    selecionada.value = "3";
}