<%--
  Created by IntelliJ IDEA.
  User: fadie
  Date: 6/17/2017
  Time: 3:05 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
    <title>Title</title>
</head>
<body>
<h5 style="color: red;">

    <form:errors path="post.*"></form:errors>
</h5>

<h3>${message}</h3><br>
<h1>Add Employee ..... </h1>
<br>

<form action="/addPost" method="post">

    Name : <input type="text" name="name" value=""> <br>
    Date : <input type="text" name="date" value="">
    <br>
    <input type="submit" value="Add">

    <input type="hidden" name="${_csrf.parameterName}"
           value="${_csrf.token}"/>
</form>


</body>
</html>
