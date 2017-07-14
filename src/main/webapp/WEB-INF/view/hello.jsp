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


<%--<form action="">--%>
Location Id . <input id="id" type="text"><br>
<button id="button"  >Click Here </button>
<br><br><br><br><br>

<p id="weather"></p>


<%--</form>--%>
<%--<script src="${pageContext.request.contextPath}/resources/js/custom.js"></script>--%>
<script>

    // **************************** Ajax **********************


    var v;
    document.getElementById("button").onclick = function () {

        console.log("Done");
//         127164
        v=document.getElementById("id").value;
        show5Customer(v);

    };
//    function showCustomer(str) {
//        console.log("Done ");
//        var xhttp;
//
//        if (str == "") {
//            document.getElementById("weather").innerHTML = "";
//            return;
//        }
//        xhttp = new XMLHttpRequest();
//        xhttp.onreadystatechange = function () {
//            if (this.readyState == 4 && this.status == 200) {
//                var myObj = JSON.parse(this.responseText);
////                document.getElementById("weather").innerHTML=myObj.Minimum.Value;
//                console.log(v);
//                document.getElementById("weather").innerHTML = myObj.Minimum.Value + '   '+myObj.Maximum.Value;
//
//
//            }
//        };
//        xhttp.open("GET", "http://localhost:8080/weather/"+v, true);
//        xhttp.send();
//    }
//    /weather/5/{locationId}
    function show5Customer(str) {
        console.log("Done ");
        var xhttp;

        if (str == "") {
            document.getElementById("weather").innerHTML = "Enter the loc id ";
            return;
        }
        xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function () {
            if (this.readyState == 4 && this.status == 200) {
                var myObj = JSON.parse(this.responseText);
//                document.getElementById("weather").innerHTML=myObj.Minimum.Value;
                console.log(v);
                document.getElementById("weather").innerHTML = myObj.Headline.Text;


            }
        };
        xhttp.open("GET", "http://localhost:8080/weather/5/"+v, true);
        xhttp.send();
    }

</script>
</body>


</html>
