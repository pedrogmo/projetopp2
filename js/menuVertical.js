
//////////////////////////////////////////////////////////////////
//Metodo de manutencao de abertura e fechamento do menu vertical
//////////////////////////////////////////////////////////////////

var mostrar = true;
document.getElementById("telaEscura").style.visibility = "hidden";

document.getElementById("mostrarMenu").onclick = function(){
    if (mostrar)
    {
        //mostrando
        document.getElementById("menuV").style.left = 0;
        document.getElementById("telaEscura").style.visibility = "initial";
    }
    else
    {
        //escondido
        document.getElementById("menuV").style.left = '-30em';
        document.getElementById("telaEscura").style.visibility = "hidden";
    }
    mostrar = !mostrar;
}

document.getElementById("telaEscura").onclick = function()
{
    document.getElementById("menuV").style.left = '-30em';
    document.getElementById("telaEscura").style.visibility = "hidden";
}

//////////////////////////////////////////////////////////////////