<!DOCTYPE html>
<html lang="en">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/logo.jpg">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

    <script src="${pageContext.request.contextPath}/resources/js/jquery-ui.min.js"></script>


    <style>
        .cont, #content {
            overflow: hidden
        }

        * {
            -webkit-box-sizing: border-box;
            box-sizing: border-box;
            margin: 0;
            padding: 0
        }

        body {
            font-family: Lato, sans-serif;
            background: url("${pageContext.request.contextPath}/resources/images/weather.jpg ") no-repeat;background-size:cover;position:relative;overflow-x:hidden}.nav{background-color:#02a1af;padding:15px 5px;width:100%;color:#fff}a,a:focus,a:hover,abbr{text-decoration:none}.scrollable select{max-height:70px}.nav a{font-weight:700;background-color:#171717;padding:6px;color:#fff;float:left;margin-right:50px;margin-top:2px;font-size:24px;-webkit-transition:all .5s ease-in-out;-o-transition:all .5s ease-in-out;-moz-transition:all .5s ease-in-out;transition:all .5s ease-in-out}.nav a:hover{color:#00afbe;transform:scaleX(1.15)}.nav input{height:37px;width:400px;margin-right:7px;margin-bottom:3px;padding:10px;border:none;border-radius:5px;color:#000;font-size:20px}.nav .form button,.person button{background:0 0;border:none;cursor:pointer;display:inline-block;height:35px;margin:0}.nav .form button{margin-left:7px}.person{margin-top:5px}.person i{cursor:pointer;border-bottom:none;margin-top:5px}#content{padding-top:10px;text-align:center;margin-right:10px}.cont{color:#fff;margin:80px auto;width:55%;border:1px solid #bdbab9;box-shadow:11px 7px 14px 0 #035256}select{padding:10px}#citys,select{overflow-x:scroll;max-height:100px}.cont .day,.cont .night,.cont .tomorow{background-color:#171717;border:1px solid #c8c8c8;border-bottom:3px solid #f05514!important;transition:all .7s ease-in-out;overflow:hidden}.cont .day:hover,.cont .night:hover,.cont .tomorow:hover{background-color:#fff!important;color:#171717;transform:scale(1.05)}.cont h3{color:#00afbe;font-weight:700}.cont h4{color:#99a4be}.cont img{width:160px;height:160px}.info p:first-of-type{font-size:24px;font-weight:700}.info p:last-of-type{margin:10px 2px;font-weight:700;font-size:18px}.info span{color:#999;margin-bottom:-5px}.admin-notes{padding:0;background-color:#fff;float:right;margin:85px -80px 0 0}.admin,.hid{background-color:#171717}.admin{padding:10px 0}.admin-notes h3{color:#00afbe;font-weight:700;font-size:28px}.admin-notes ol li:hover,.hid{color:#fff}hr{margin:0;border-top:3px solid #f05514}.admin-notes ol{padding:10px 8px 0 0;background-color:#00afbe}.admin-notes ol li{font-size:21px;font-weight:700;padding:15px 60px 15px 15px;line-height:1.3;-webkit-transition:color .4s;transition:color .4s;text-align:left;border-bottom:2px dotted #c8c8c8;overflow:hidden}.hid{text-align:center;border-radius:50%;width:30px;height:30px;margin:10px 15px;float:right}.hid i{margin:9px}.fa-plus:before{margin:3px auto;text-align:center}.hiddden{display:none}.faill{color:#bdbab9}footer{background-color:#171717;padding:15px 7px;;text-align:center;color:#fff;position:fixed;bottom:0;left:0;right:0}footer p{font-weight:700;font-size:18px}


    </style>
    <%--<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/Home-User-mob.css"--%>
          <%--media="screen and (max-width: 770px)">--%>
    <title>Home</title>
</head>
<body class="img-responsive">
<!-- Start navbar-->
<div class="nav">
    <div class="container">
        <div class="row">
            <div class="left-side col-sm-10 col-xs-9">
                <a href="Home-User.html">WEATHER</a>
                <div class="inputs">
                    <div class="form">
                        <input oninput="onInput()" list=citys type="text" id="txt" onkeyup="fire()"
                               placeholder="City, Cairo" required autocomplete>
                        <button id="button" class="submitbutton" type="submit">
                            <i class="fa fa-search fa-2x"></i>
                        </button>

                    </div>
                </div>
            </div>

            <div class="person col-sm-2 col-xs-3">
                <form method="post" action="/logout">
                    <button class="submitbutton" type="submit" name="${_csrf.parameterName}"
                            value="${_csrf.token}">
                        <abbr title="Logout"> <i class="fa fa-sign-out fa-2x" aria-hidden="true"></i></abbr>
                    </button>
                </form>
                <%--<button class="submitbutton" type="submit">--%>
                <%--<i class="fa fa-sign-out fa-2x" aria-hidden="true"></i>--%>
                <%--</button>--%>
            </div>
        </div>
    </div>
</div>


<div id="hidden"></div>

<datalist id="citys">
    <%--<select id="select">--%>

    <%--</select>--%>
</datalist>
<!-- new section -->
<section id="content">

    <div class="container">
        <div id="fail"></div>

        <div class="row">
            <div class="cont col-md-6">

                <!--
                      <i class="fa fa-cloud fa-5x" aria-hidden="true"></i>
                      <h2>No City Enterd Yet !!</h2>
              -->
                <div col-md-9>
                    <div class="row">
                        <div class="day active col-md-4 col-xs-12">
                            <h3>TODAY</h3>
                            <h4 id="todayDate">Jul 9</h4>
                            <img class="img-responsive"
                                 src="${pageContext.request.contextPath}/resources/images/sun.png" alt="sun">

                            <div class="info ">
                                <p id="todayT">92°</p>
                                <span>RealFeel®</span>
                                <p id="todayD">Mostly sunny</p>
                            </div>

                        </div>
                        <div class="night col-md-4 col-xs-12">
                            <h3>Tonight</h3>
                            <h4 id="tonightDate">Jul 9</h4>

                            <img class="img-responsive"
                                 src="${pageContext.request.contextPath}/resources/images/moon.ico" alt="Moon">

                            <div class="info">
                                <p id="tonightT">50°</p>
                                <span>RealFeel®</span>
                                <p id="tonightN">SunShine and Hotter</p>
                            </div>


                        </div>
                        <div class="tomorow col-md-4 col-xs-12">

                            <h3>Tomorrow</h3>
                            <h4 id="tomorrowDate">Jul 10</h4>


                            <img class="img-responsive"
                                 src="${pageContext.request.contextPath}/resources/images/cloud sun.png"
                                 alt="Cloud-Sun">

                            <div class="info">
                                <p id="tomorrowT">92°</p>
                                <span>RealFeel®</span>
                                <p id="tomorrowD">Mainly Clear</p>
                            </div>

                        </div>
                    </div>

                </div>

            </div>

            <div class="admin-notes col-md-5 col-xs-12">
                <div class="admin"><h3>Admin Notes</h3></div>
                <hr>
                <ol id="listNotes" class="list">

                </ol>
                <span class="hid"><i class=" fa fa-plus"></i></span>
            </div>
        </div>
    </div>
</section>
<footer>
    <div class="container">

        <p>CopyRight &copy 2017 All Rights Reseived </p>
    </div>
</footer>

</body>


<script defer async src="${pageContext.request.contextPath}/resources/js/autoCompelete.js"></script>


</html>