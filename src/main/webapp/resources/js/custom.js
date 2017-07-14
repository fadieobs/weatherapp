/**
 * Created by fadie on 7/14/2017.
 */
function Lengthpass(){
    var pass = document.getElementById('pass1').value;
    var result   =  document.getElementById('passres');
    if (pass =="" || pass.length  < 6 ){
        result.textContent = 'password must at least 6 charter'
        result.style.color = 'red';
        return false;
    }else{
        result.textContent = '';
        return true;
    }
}
function ConfirmPass(){
    var pass1 = document.getElementById('pass1').value;
    var pass2 = document.getElementById('pass2').value;
    var result   =  document.getElementById('finalres');
    if (pass1 != pass2 ){
        result.textContent = "password didn't match";
        result.style.color = 'red';
        return false;
    }else{
        result.textContent ="";
        return true;
    }
}
function checknum(){
    var num = document.getElementById('num').value;
    var validnum =document.getElementById('validnum');
    if (num.length < 11){
        validnum.innerText = 'enter a valid Length'
        validnum.style.color = 'red';
        return false;
    }
    else{
        validnum.innerText = '';
        return true;
    }
}