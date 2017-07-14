<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Login page</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/logo.jpg">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css">
    <title>Title</title>
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

        .msg {
            padding: 15px;
            margin-bottom: 20px;
            border: 1px solid transparent;
            border-radius: 4px;
            color: #31708f;
            background-color: #d9edf7;
            border-color: #bce8f1;
        }

        #login-box {
            width: 300px;
            padding: 20px;
            margin: 100px auto;
            background: #fff;
            -webkit-border-radius: 2px;
            -moz-border-radius: 2px;
            border: 1px solid #000;
        }
    </style>
</head>
<body onload='document.loginForm.j_username.focus();'>

<h1>Spring Security Custom Login Form (XML)</h1>

<label style="color:#a94442">${verify}</label>

<div id="login-box">

    <h2>Login with email and Password</h2>

    <c:if test="${not empty error}">
        <div class="error">Login UnSuccessfull ..
            caused: ${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}  </div>
    </c:if>
    <%--<c:if test="${not empty msg}">--%>
    <%--<div class="msg">${msg}</div>--%>
    <%--</c:if>--%>

    <br>


    <form name="loginForm"
          action="/login" method="post">

        <table>
            <tr>
                <td>Email:</td>
                <td><input type='email' name="email" value=''></td>
            </tr>
            <tr>
                <td>Password:</td>
                <td><input type='password' name="password"/></td>
            </tr>
            <tr>
                <td colspan='2'><input name="submit" type="submit"
                                       value="submit"/></td>
            </tr>
        </table>

        <input type="hidden" name="${_csrf.parameterName}"
               value="${_csrf.token}"/>

    </form>
</div>

</body>
</html>
