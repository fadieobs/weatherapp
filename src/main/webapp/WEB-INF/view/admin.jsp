<html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Admin</title>
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/logo.jpg">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin.css">
    </head>
    <body id="body">
    <section>
        <div class="nav">
            <div class="container">
                <div class="row">
                    <div class="left-side  col-xs-4">
                        <h1><a href="admin.html">ADMIN</a></h1>

                    </div>

                    <div class="person col-xs-4  col-xs-offset-3">
                        <form method="post" action="/logout">
                            <button class="submitbutton" type="submit" name="${_csrf.parameterName}"
                                    value="${_csrf.token}">
                                <i class="fa fa-sign-out fa-2x" aria-hidden="true"></i>
                            </button>
                        </form>
                    </div>
                </div>

            </div>
        </div>


        <!--    Start Custom Navbar  -->

        <!--    Start Custom Navbar  -->
        <section class="nav-home">
            <div class="container" style="height: 35px;">
                <div class="row">

                    <div class="tab">
                        <ul class="tabs row">
                            <button data-class="first" class="col-xs-3 select-home"><a href="#"
                                                                                       id="Range1">First Range</a>
                            </button>
                            <button data-class="second" class="col-md-3 col-xs-3"><a href="#" id="Range2">Second Range</a>
                            </button>
                            <button data-class="third" class="col-md-3 col-xs-3"><a href="#" id="Range3">Third Range</a>
                            </button>
                            <button data-class="four" class="col-xs-3"><a href="#" id="Range4">Fourth Range</a></button>
                        </ul>
                    </div>
                </div>

            </div>
        </section>

        <!--    End Custom Navbar  -->

        <!--    End Custom Navbar  -->

        <div class=" container all
                        " style="display: block;">

            <div class="row">
                <div class="range first col-md-8 col-md-offset-2 col-xs-12" style="display: none;">
                    <h2> </h2>
                    <ol id="notes1">
                        <li>This is old notes you have added before Number1
                        <li class="fa fa-trash-o"></li>
                        </li>


                    </ol>
                    <button type="button" id="btn1" class="btn btn-primary add">ADD NEW</button>
                    <form class="forma" action="/saveNote.html" method="post">
                        <input id="rangeForm" type="hidden" name="rangeId" value="1">
                        <textarea name="note" class="visible" id="textarea1" placeholder="add Your notes here ....."
                                  required=""></textarea>
                        <button id="save1" class="visible btn btn-primary">SAVE</button>
                        <p id="pos1"></p>
                            <%--spring inpur csrf --%>
                        <input type="hidden" name="${_csrf.parameterName}"
                               value="${_csrf.token}"/>
                    </form>
                </div>

                <div class="range second col-md-8 col-md-offset-2 col-xs-12" style="display: none;">
                    <h2> </h2>
                    <ol id="notes2">
                        <li>This is old notes you have added before Number1<i class="fa fa-trash-o"></i>
                        </li>
                    </ol>
                    <button type="button" id="btn2" class="btn btn-primary add">ADD NEW</button>

                    <form class="forma " action="/saveNote.html" method="post">
                        <input id="rangeForm" type="hidden" name="rangeId" value="2">

                        <textarea name="note" class="visible" id="textarea2" placeholder="add Your notes here ....."
                                  required=""></textarea>
                        <button id="save2" class="visible btn btn-primary">SAVE</button>
                        <p id="pos2"></p>
                            <%--spring inpur csrf --%>
                        <input type="hidden" name="${_csrf.parameterName}"
                               value="${_csrf.token}"/>
                    </form>
                </div>


                <div class="range third col-md-8 col-md-offset-2 col-xs-12" style="display: none;">
                    <h2> </h2>
                    <ol id="notes3">
                        <li>This is old notes you have added before Number1<i class="fa fa-trash-o"></i>
                        </li>
                    </ol>
                    <button type="button" id="btn3" class="btn btn-primary add">ADD NEW</button>

                    <form class="forma " action="/saveNote.html" method="post">
                        <input id="rangeForm" type="hidden" name="rangeId" value="3">

                        <textarea name="note" class="visible" id="textarea3" placeholder="add Your notes here ....."
                                  required=""></textarea>
                        <button id="save3" class="visible btn btn-primary">SAVE</button>

                        <p id="pos3"></p>
                            <%--spring inpur csrf --%>
                        <input type="hidden" name="${_csrf.parameterName}"
                               value="${_csrf.token}"/>

                    </form>
                </div>


                <div class="range four col-md-8   col-md-offset-2 col-xs-12">
                    <h2> </h2>
                    <ol id="notes4">
                        <li>This is old notes you have added before Number1<i class="fa fa-trash-o"></i>
                        </li>
                    </ol>
                    <button type="button" id="btn4" class="btn btn-primary add">ADD NEW</button>

                    <form class="forma " action="/saveNote.html" method="post">
                        <input id="rangeForm" type="hidden" name="rangeId" value="4">

                        <textarea name="note" class="visible" id="textarea4" placeholder="add Your notes here ....."
                                  required=""></textarea>
                        <button id="save4" class="visible btn btn-primary">SAVE</button>

                        <p id="pos4"></p>
                            <%--spring inpur csrf --%>
                        <input type="hidden" name="${_csrf.parameterName}"
                               value="${_csrf.token}"/>
                    </form>
                </div>
            </div>
        </div>
    </section>
    <footer>
        <div class="container">

            <p>CopyRight &copy 2017 All Rights Reseived </p>
        </div>
    </footer>

    <script src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
    <script>
        //    ****************************************** Develop js ********************************************
        // range 1
        var notes1 = document.getElementById("notes1");
        var range1 = document.getElementById("Range1");
        range1.onclick = loadDoc1(notes1, 1);
        // body load
        var body = document.getElementById("body");
        body.onload = loadDoc1(notes1, 1);
        // range 2
        var range2 = document.getElementById("Range2");
        var notes2 = document.getElementById("notes2");
        range2.onclick = loadDoc1(notes2, 2);
        // range 3
        var range3 = document.getElementById("Range3");
        var notes3 = document.getElementById("notes3");
        range3.onclick = loadDoc1(notes3, 3);
        // range 4
        var range4 = document.getElementById("Range4");
        var notes4 = document.getElementById("notes4");
        range4.onclick = loadDoc1(notes4, 4);


        function loadDoc1(notes, rangeId) {

            document.getElementById("rangeForm").value = "1";

            var xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function () {
                if (this.readyState == 4 && this.status == 200) {
                    var Obj = JSON.parse(this.responseText);

                    //***************** reomve all elemant from <ol> ******
                    while (notes.hasChildNodes()) {
                        notes.removeChild(notes.lastChild);
                    }
                    //*************** add new notes *************************
                    for (var i = 0; i < Obj.length; i++) {
                        addElement(notes, Obj[i], rangeId);
                    }
                }
            };
            xhttp.open("GET", "http://localhost:8080/weather/notes/" + rangeId, true);
            xhttp.send();
        }
        function addElement(notes, o, rangeId) {

            var para = document.createElement("li");
            para.setAttribute("id", o.id);
            var node = document.createTextNode(o.notes);
            var span = document.createElement("span");
            var tt = document.createTextNode(o.date);
            span.className = "date";


            var i = document.createElement("i");
            i.className = "fa fa-trash-o";
            i.onclick = function () {

                ajaxDelete(notes, o.id, rangeId);
            };
            span.appendChild(tt);
            para.appendChild(i);
            para.appendChild(node);
            para.appendChild(span);

            notes.appendChild(para);

        }
        //**************** to delete specific note in the range *******************
        function ajaxDelete(notes, noteId, rangeId) {
            alert("Done     " + noteId + "     " + rangeId);
            var xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function () {
                if (this.readyState == 4 && this.status == 200) {

                    var Obj = JSON.parse(this.responseText);
// remove elements and siaplay again
                    loadDoc1(notes, rangeId);
                }
            };
            xhttp.open("GET", "http://localhost:8080/weather/notes/" + noteId + "/" + rangeId, true);
            xhttp.send();
        }

        //************************** Ashraf jq ***********************************************************
        var textarea1 = $('#textarea1');
        var btn1 = $('#btn1');
        var textarea2 = $('#textarea2');
        var btn2 = $('#btn2');
        var textarea3 = $('#textarea3');
        var btn3 = $('#btn3');
        var textarea4 = $('#textarea4');
        var btn4 = $('#btn4');
        var all = $('.all');
        var pos1 = $('#pos1');
        var pos2 = $('#pos2');
        var pos3 = $('#pos3');
        var pos4 = $('#pos4');
        var forma1 = $('.forma1');
        var save1 = $('#save1');
        var save2 = $('#save2');
        var save3 = $('#save3');
        var save4 = $('#save4');
        $('.first').fadeIn(500);
        $('.second').hide();
        $('.third').hide();
        $('.four').hide();

        $('.tabs button').click(function () {

            $(this).addClass('select-home').siblings('button').removeClass('select-home');

            // switch of Sections

            $('.first, .second , .third , .four').hide();
            $('.' + $(this).data('class')).fadeIn();

        });


        function togle(textarea, btn, save) {
            btn.click(function () {
                textarea.toggleClass('visible');
                save.toggleClass('visible');
            });
        }
        togle(textarea1, btn1, save1);
        togle(textarea2, btn2, save2);
        togle(textarea3, btn3, save3);
        togle(textarea4, btn4, save4);

        $(window).on("load", function (e) {
            $('.first').fadeIn(2000);
        });

        //validation of text area
        function valid(txtarea, display) {

            if (txtarea === "") {
                display.text("Field Is Required");
                return false;
            }
            else {
                return true;
            }
        }
        save1.on('click', function () {
            valid(textarea1.val(), pos1);
        });
        save2.on('click', function () {
            valid(textarea1.val(), pos2);
        });
        save3.on('click', function () {
            valid(textarea1.val(), pos3);
        });
        save4.on('click', function () {
            valid(textarea1.val(), pos4);
        });

    </script>


    </body>
</html>
