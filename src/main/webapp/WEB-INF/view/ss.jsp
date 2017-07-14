<%--
  Created by IntelliJ IDEA.
  User: fadie
  Date: 6/5/2017
  Time: 6:05 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<html>
<head>
    <title>Title</title>
</head>
<body>


<a href="<c:url value="/logout" />">Logout >> </a>
<<br>
<a href="/post.html">Post Page .....</a>


<br>
<h3>posts :</h3>
<br>
<%--${posts}--%>
<c:forEach items="${posts}" var="p">

    name : ${p.name} <br>
    Date : ${p.date} <br>

</c:forEach>
<br>
<h1> ------------------------------------------------------- </h1><br>

<%--************************ Get the Name Of User **************--%>
<h4>Hello : <sec:authentication property="name"></sec:authentication></h4>

<%--********************* Check If Has Role Admin TO View This Part *********--%>
<sec:authorize access="hasRole('ROLE_ADMIN')">
    Add Employee ya admin
</sec:authorize>
<br>
<sec:authorize access="hasRole('ROLE_USER')">
    Hello Ya User
</sec:authorize>


</body>
</html>
