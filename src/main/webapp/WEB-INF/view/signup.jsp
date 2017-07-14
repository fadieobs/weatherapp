<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>sign-up page</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/logo.jpg">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css">
    <style>
        * {
            -webkit-box-sizing: border-box;
            box-sizing: border-box
        }

        body {
            font-family: "Open Sans", sans-serif;
            height: 100vh;
            background: url(${pageContext.request.contextPath}/resources/images/signup.jpg) 50% fixed;
            background-size: cover
        }

        @-webkit-keyframes spinner {
            0% {
                -webkit-transform: rotateZ(0);
                transform: rotateZ(0)
            }
            100% {
                -webkit-transform: rotateZ(359deg);
                transform: rotateZ(359deg)
            }
        }

        @keyframes spinner {
            0% {
                -webkit-transform: rotateZ(0);
                transform: rotateZ(0)
            }
            100% {
                -webkit-transform: rotateZ(359deg);
                transform: rotateZ(359deg)
            }
        }

        .wrapper {
            display: -webkit-box;
            display: -ms-flexbox;
            display: flex;
            -webkit-box-align: center;
            -ms-flex-align: center;
            align-items: center;
            -webkit-box-orient: vertical;
            -webkit-box-direction: normal;
            -ms-flex-direction: column;
            flex-direction: column;
            -webkit-box-pack: center;
            -ms-flex-pack: center;
            justify-content: center;
            width: 100%;
            min-height: 100%;
            padding: 20px;
            background: rgba(0, 0, 0, .5)
        }

        .login {
            border-radius: 2px 2px 5px 5px;
            padding: 35px 20px 80px;
            width: 90%;
            max-width: 450px;
            background: #fff;
            position: relative;
            -webkit-box-shadow: 0 1px 5px rgba(0, 0, 0, .3);
            box-shadow: 0 1px 5px rgba(0, 0, 0, .3)
        }

        .login input, button {
            width: 100%;
            display: block
        }

        .login.loading button {
            max-height: 100%;
            padding-top: 50px
        }

        .login.loading button .spinner {
            opacity: 1;
            top: 40%
        }

        .login.ok button {
            background-color: #8bc34a
        }

        .login.ok button .spinner {
            border-radius: 0;
            border-top-color: transparent;
            border-right-color: transparent;
            height: 20px;
            -webkit-animation: none;
            animation: none;
            -webkit-transform: rotateZ(-45deg);
            transform: rotateZ(-45deg)
        }

        .login input {
            padding: 15px 10px;
            margin-bottom: 10px;
            border: 1px solid #ddd;
            -webkit-transition: border-width .2s ease;
            transition: border-width .2s ease;
            border-radius: 2px;
            color: #ccc
        }

        .login input + i.fa {
            color: #fff;
            font-size: 1em;
            position: absolute;
            margin-top: -47px;
            opacity: 0;
            left: 0;
            -webkit-transition: all .1s ease-in;
            transition: all .1s ease-in
        }

        .login input:focus {
            outline: 0;
            color: #444;
            border-color: #2196F3;
            border-left-width: 35px
        }

        .login input:focus + i.fa {
            opacity: 1;
            left: 30px;
            -webkit-transition: all .25s ease-out;
            transition: all .25s ease-out
        }

        .login a {
            font-size: .8em;
            color: #2196F3;
            text-decoration: none
        }

        .login .title {
            color: #444;
            font-size: 1.4em;
            font-weight: 700;
            margin: 10px 0 30px;
            border-bottom: 2px solid #DDD;
            padding-bottom: 20px
        }

        .back {
            margin-top: 25px;
            margin-bottom: 0 !important
        }

        .back i:hover {
            color: #0d7bd2
        }

        button {
            margin-top: -20px !important;
            height: 100%;
            padding: 18px 10px;
            background: #2196F3;
            color: #fff;
            font-weight: 700;
            border: none;
            position: absolute;
            left: 0;
            bottom: 0;
            max-height: 40px;
            border: 0 solid rgba(0, 0, 0, .1);
            border-radius: 0 0 2px 2px;
            -webkit-transition: all .1s ease-out;
            transition: all .1s ease-out;
            border-bottom-width: 7px
        }

        button:hover {
            background: #0d7bd2
        }

        .links {
            padding-top: 5px;
            margin-top: 12px;
            -webkit-transition: border-bottom 1s ease-in-out;
            transition: border-bottom 1s ease-in-out
        }

        .state {
            margin: -5px auto
        }

        .sign-up {
            font-size: 16px;
            padding: 0 5px;
            margin-bottom: 5px;
            margin-left: -15px;
            text-align: center
        }

    </style>

</head>
<body>
<div class="wrapper col-xs-12">

    <form class="login" action="/adduser.html" method="post">

        <h3 class="title">Sign-Up</h3>
        <input type="text" required placeholder="username" value="" name="username" autofocus>
        <i class="fa fa-user"></i>
        <p style="color: red; padding-left: 10px;"><form:errors path="users.username"></form:errors></p>


        <input name="emailaddress" type="email" placeholder="Example me@gmail.com" required autocomplete/>
        <i class="fa fa-user"></i>
        <p style="color: red; padding-left: 10px;"><form:errors path="users.emailaddress"></form:errors></p>
        <label style="color: red">${errorEmail}</label>

        <input id="num" name="mobileNumber" type="number" onfocusout="checknum()" required placeholder="mobile number"
               value="">
        <i class="fa fa-mobilebile"></i>
        <p style="color: red; padding-left: 10px;"><form:errors path="users.mobileNumber"></form:errors></p>

        <p id="validnum"></p>


        <input id="pass1" name="password" type="password" onfocusout="Lengthpass()" placeholder="Password" required/>
        <i class="fa fa-key"></i>
        <p style="color: red; padding-left: 10px;"><form:errors path="users.password"></form:errors></p>

        <p id="passres"></p>

        <input id="pass2" name="confirm_password" type="password" onfocusout="ConfirmPass()"
               placeholder="Confirm Password" required/>
        <i class="fa fa-key"></i>
        <label style="color: red">${passerror}</label>

        <p id="finalres"></p>

        <div class="back"><a href="/login.html"><i class="fa fa-chevron-circle-left fa-3x"></i></a></div>
        <button>
            <i class="spinner"></i>
            <p class="state">Confirm</p>
        </button>

        <input type="hidden" name="${_csrf.parameterName}"
               value="${_csrf.token}"/>
    </form>
</div>
<%--<script src="${pageContext.request.contextPath}/resources/js/custom.js" type="application/javascript" async defer/>--%>

<script >

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




</script>



</body>
</html>
