
var selecionada = document.getElementById("selecionada");

/* OPÇÕES */

var pic1 = document.getElementById("pic1");
var pic2 = document.getElementById("pic2");
var pic3 = document.getElementById("pic3");
var pic4 = document.getElementById("pic4");

pic1.onclick = function () {
    selecionada.value = "0";
}

pic2.onclick = function () {
    selecionada.value = "1";
}

pic3.onclick = function () {
    selecionada.value = "2";
}

pic4.onclick = function () {
    selecionada.value = "3";
}
