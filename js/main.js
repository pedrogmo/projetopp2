
document.getElementById("h").onmouseover = function(){

    document.getElementById('logo').src = 'img/logoDesk2.png'
    document.getElementById('logo').style.transition = '250ms';
}

document.getElementById("h").onmouseleave = function(){
    
    document.getElementById('logo').src = 'img/logoMobile.png'
    document.getElementById('logo').style.transition = '250ms';
}