<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Login page</title>
    <%--<c:url value="/resources/css/main.css" />--%>
    <%--${pageContext.request.contextPath}/resources/--%>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/logo.jpg">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css">
    <style>

        .error {
            padding: 15px;
            margin-bottom: 20px;
            border: 1px solid transparent;
            border-radius: 4px;
            color: #a94442;
            background-color: #f2dede;
            border-color: #ebccd1;
        }
        <style>
         *{-webkit-box-sizing:border-box;box-sizing:border-box}body{font-family:"Open Sans", sans-serif;overflow:hidden;height:100vh;background:url(${pageContext.request.contextPath}/resources/images/login.jpg) 50% fixed;background-size:cover}@-webkit-keyframes spinner{0%{-webkit-transform:rotateZ(0deg);transform:rotateZ(0deg)}100%{-webkit-transform:rotateZ(359deg);transform:rotateZ(359deg)}}@keyframes spinner{0%{-webkit-transform:rotateZ(0deg);transform:rotateZ(0deg)}100%{-webkit-transform:rotateZ(359deg);transform:rotateZ(359deg)}}.wrapper{display:-webkit-box;display:-ms-flexbox;display:flex;-webkit-box-align:center;-ms-flex-align:center;align-items:center;-webkit-box-orient:vertical;-webkit-box-direction:normal;-ms-flex-direction:column;flex-direction:column;-webkit-box-pack:center;-ms-flex-pack:center;justify-content:center;width:100%;min-height:100%;padding:20px;background: rgba(0,0,0,.75);}.login{border-radius:2px 2px 5px 5px;padding:35px 20px 20px 20px;width:90%;max-width:350px;background:#ffffff;position:relative;padding-bottom:80px;-webkit-box-shadow:0px 1px 5px rgba(0,0,0,0.3);box-shadow:0px 1px 5px rgba(0,0,0,0.3)}.login.loading button{max-height:100%;padding-top:50px}.login.loading button .spinner{opacity:1;top:40%}.login.ok button{background-color:#8bc34a}.login.ok button .spinner{border-radius:0;border-top-color:transparent;border-right-color:transparent;height:20px;-webkit-animation:none;animation:none;-webkit-transform:rotateZ(-45deg);transform:rotateZ(-45deg)}.login input{display:block;padding:15px 10px;margin-bottom:10px;width:100%;border:1px solid #ddd;-webkit-transition:border-width 0.2s ease;transition:border-width 0.2s ease;border-radius:2px;color:#ccc}.login input+i.fa{color:#fff;font-size:1em;position:absolute;margin-top:-47px;opacity:0;left:0;-webkit-transition:all 0.1s ease-in;transition:all 0.1s ease-in}.login input:focus{outline:none;color:#444;border-color:#2196F3;border-left-width:35px}.login input:focus+i.fa{opacity:1;left:30px;-webkit-transition:all 0.25s ease-out;transition:all 0.25s ease-out}.login a{font-size:0.8em;color:#2196F3;text-decoration:none}.login .title{color:#444;font-size:1.4em;font-weight:bold;margin:10px 0 30px 0;border-bottom:2px solid #DDD;padding-bottom:20px}button{width:100%;height:100%;padding:18px 10px;background:#2196F3;color:#fff;font-weight:bold;display:block;border:none;margin-top:20px;position:absolute;left:0;bottom:0;max-height:40px;border:0px solid rgba(0,0,0,0.1);border-radius:0 0 2px 2px;-webkit-transition:all 0.1s ease-out;transition:all 0.1s ease-out;border-bottom-width:7px}button:hover{background:#0d7bd2}.links{padding-top:5px;margin-top:12px;-webkit-transition:border-bottom 1s ease-in-out;transition:border-bottom 1s ease-in-out}.state{margin:-5px auto}.links a:first-child{padding: 5px; margin-left: 10px}.sign-up{font-size:16px;padding:5px 5px;margin-left:-15px;text-align:center}.sign-up:hover{background-color: #175f98; color: #fff; border-radius: 10px}.sign-up:hover,.sign-up:hover a{color:#fff}
        .sign-up a{margin:0}

    </style>

</head>
<body>


<div class="wrapper col-xs-12">
    <p style="color: red;">

        <form:errors path="users.*"></form:errors>
    </p>
    <form class="login" onsubmit="" name="loginForm"
          action="/login" method="post">
        <label style="color: #0d7bd2" >${verify}</label>
        <c:if test="${not empty error}">
            <div class="error">Login UnSuccessfull ..  caused: ${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}  </div>
        </c:if>
        <h3 class="title">Log in</h3>
        <input id="mail" name="email" onfocusout="checkmail()" type="email" placeholder="Example me@gmail.com" autofocus autocomplete/>
        <i class="fa fa-user"></i>
        <p style="color: red; padding-left: 10px;"><form:errors  path="users.emailaddress"></form:errors></p>

        <p id="result"></p>

        <input id="pass" name="password" type="password" onfocusout="checkpass()" placeholder="Password" />
        <i class="fa fa-key"></i>
        <p style="color: red; padding-left: 10px;"><form:errors  path="users.password"></form:errors></p>

        <p id="passresult"></p>
        <div class="row links">

            <a class="col-xs-9 pass" href="#">Forgot your password?</a>
            <p class="sign-up col-xs-3"> <a href="/signpage.html">Sign Up</a> </p>
        </div>

        <button>
            <i class="spinner"></i>
            <p class="state">Login</p>
        </button>
        <input type="hidden" name="${_csrf.parameterName}"
               value="${_csrf.token}"/>
    </form>
</div>
<script>

    function checkmail(){

        var mail = document.getElementById('mail').value;

        var result   =  document.getElementById('result');

        if (mail == ""){
            result.textContent = 'You Must Enter This Fileld'
            result.style.color='red';
            return false;
        }
        else{
            result.textContent = '';
            return true;
        }
    }
    function checkpass(){
        var passs =document.getElementById('pass').value;
        var result2 =document.getElementById('passresult');
        if (passs == ""){
            result2.textContent = 'You Must Enter A Password'
            result2.style.color = 'red';
        }
        else{
            result2.textContent = '';
            return true;
        }
    }
</script>
</body>
</html>
