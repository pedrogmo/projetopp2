var mostrar = true;
document.getElementById("mostrarMenu").onclick = function(){
    if (mostrar)
        document.getElementById("menuV").style.left = 0;
    else
    {
        document.getElementById("menuV").style.left = '-30em';
    }
    mostrar = !mostrar;
}