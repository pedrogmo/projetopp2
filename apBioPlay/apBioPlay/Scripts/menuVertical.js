
//////////////////////////////////////////////////////////////////
//Metodo de manutencao de abertura e fechamento do menu vertical
//////////////////////////////////////////////////////////////////

var mostrar = false;
var loginAberto = false;
var erroAberto = false;

document.getElementById("telaEscura").style.visibility = "hidden";
document.getElementById("telaEscura-desk").style.visibility = "hidden";

$(document).ready(function(){
    $('.icon').click(function(){
        $('.icon').toggleClass('active');
    });

    if (document.getElementById("msg").innerHTML.trim() == "") 
        document.getElementById("bg-modal").style.visibility = "hidden";
    else {
        document.getElementById("bg-modal").style.visibility = "initial";
        document.getElementById("telaEscura-desk").style.visibility = "initial";
        document.getElementById("telaEscura").style.visibility = "initial";
        erroAberto = true;
    }
});

document.getElementById("btnLogin").onclick = function()
{
    loginAberto = !loginAberto;
    if(loginAberto)
    {
        document.getElementById("modalLogin").style.visibility = 'initial';
        document.getElementById("menuV").style.left = '-30em';
        document.getElementById("telaEscura-desk").style.visibility = "initial";
    }
    else
        document.getElementById("modalLogin").style.visibility = 'hidden';       
}

document.getElementById("btnLogin2").onclick = function()
{
    loginAberto = !loginAberto;    
    if(loginAberto)
    {
        document.getElementById("modalLogin").style.visibility = 'initial';
        document.getElementById("telaEscura-desk").style.visibility = "initial";
        document.getElementById("telaEscura").style.visibility = "initial";
    }         
}

document.getElementById("mostrarMenu").onclick = function(){
    mostrar = !mostrar;
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
        document.getElementById("telaEscura-desk").style.visibility = "hidden";        
        if(loginAberto)
        {
            document.getElementById("modalLogin").style.visibility = 'hidden';
            loginAberto = false;
        }
    }    
}

// $(document).ready(function(){
//     $('telaEscura').click(function(){
//         // $('.icon').toggleClass('inactive');
//         $('#menuV').css('left', '-30em');
//         $('#telaEscura').css('visibilty', 'hidden');
//         mostrar = !mostrar;

//     });
// });

document.getElementById("telaEscura").onclick = function()
{
    if(!loginAberto)
    {
        document.getElementById("menuV").style.left = '-30em';
        document.getElementById("telaEscura").style.visibility = "hidden";        
        mostrar = !mostrar;    
        var menu = document.querySelector('.icon')
        menu.classList.toggle('active');
    }
    if (erroAberto) {
        document.getElementById("bg-modal").style.visibility = "hidden";
        document.getElementById("telaEscura").style.visibility = "hidden";
        document.getElementById("telaEscura-desk").style.visibility = "hidden";
        erroAberto = false;
    }
}

document.getElementById("telaEscura-desk").onclick = function()
{
    if(loginAberto)
    {
        document.getElementById("menuV").style.left = '-30em';
        document.getElementById("telaEscura").style.visibility = "hidden";
        mostrar = !mostrar;    
        var menu = document.querySelector('.icon')
        document.getElementById("telaEscura-desk").style.visibility = "hidden";
        document.getElementById("modalLogin").style.visibility = 'hidden';
        loginAberto = false;
    
        var menu = document.querySelector('.icon')
        menu.classList.toggle('active');
    }

    if (erroAberto) {
        document.getElementById("bg-modal").style.visibility = "hidden";
        document.getElementById("telaEscura").style.visibility = "hidden";
        document.getElementById("telaEscura-desk").style.visibility = "hidden";
        erroAberto = false;
    }
}

//////////////////////////////////////////////////////////////////

document.getElementById("btn-ok").onclick = function () {
    if (erroAberto) {
        document.getElementById("bg-modal").style.visibility = "hidden";
        document.getElementById("telaEscura").style.visibility = "hidden";
        document.getElementById("telaEscura-desk").style.visibility = "hidden";    
    }
}