var clk = $('.hid');
var list = $('.list');
clk.click(function () {
    list.fadeToggle(700)
});
var query;
function fire() {
    var failed = $('#fail');
    var result = $('#citys');
    var hidden = $('#hidden');
    query = document.getElementById('txt').value;
    var weatherUrl = 'http://dataservice.accuweather.com/locations/v1/cities/autocomplete?apikey=GIdAcS4f3eAGBJ7kqm3Ntjv9gnbADHnF&q=' + query + '';
    var wikiRequestTimeout = setTimeout(function () {
        failed.append("")
    }, 8000);
    $.ajax({
        url: weatherUrl, dataType: "jsonp", jsonp: "callback", success: function (response) {
            for (var i = 0; i < response.length; i++) {
                city = response[i];
                var name = city.LocalizedName;
                var id = city.Key;
                var country = city.Country.LocalizedName;
                console.log(name + '  ' + id);
                hidden.append('<input hidden value=' + id + '" name="cityid">' + '</input>');
                result.append('<option id =' + id + ' value=' + name + ',' + country + '>  </option>')
            }
            ;
            clearTimeout(wikiRequestTimeout)
        }
    })
}

//*********************** Method *****************************
function onInput() {
    var val = document.getElementById("txt").value;
    var opts = document.getElementById('citys').childNodes;
    for (var i = 0; i < opts.length; i++) {
        if (opts[i].value === val) {
            showCustomer(opts[i].id);
            break;
        }
    }
}


// ******************************* ajax and display data to user **************************************

// ************ today variables **************
var todayDate = document.getElementById("todayDate");
var todayT = document.getElementById("todayT");
var todayD = document.getElementById("todayD");
//**************** tonight variable ***************
var tonightDate = document.getElementById("tonightDate");
var tonightT = document.getElementById("tonightT");
var tonightN = document.getElementById("tonightN");
//**************** Tomorwow variable ***************
var tomorrowDate = document.getElementById("tomorrowDate");
var tomorrowT = document.getElementById("tomorrowT");
var tomorrowD = document.getElementById("tomorrowD");

var listNotes = document.getElementById("listNotes");
// var button = ;

document.getElementById("button").addEventListener("click", myFunction);

function myFunction() {
    onInput();
};

function showCustomer(str) {
    var xhttp;
    if (str == "") {

        return;
    }
    xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
            var Obj = JSON.parse(this.responseText);


            // *************** Today Display *************
            todayDate.innerHTML = Obj.Headline.EffectiveDate;
            todayT.innerHTML = ((parseInt(Obj.DailyForecasts[0].Temperature.Maximum.Value) - 32) * 5 / 9).toFixed(0);
            todayD.innerHTML = Obj.DailyForecasts[0].Day.IconPhrase;
            // ****************** tonight Display ********************
            tonightDate.innerHTML = Obj.Headline.EffectiveDate;
            tonightT.innerHTML = ((parseInt(Obj.DailyForecasts[0].Temperature.Minimum.Value) - 32) * 5 / 9).toFixed(0);
            tonightN.innerHTML = Obj.DailyForecasts[0].Night.IconPhrase;
            // ****************** tomorrow Display ********************
            tomorrowDate.innerHTML = Obj.DailyForecasts[1].Date;
            tomorrowT.innerHTML = ((parseInt(Obj.DailyForecasts[1].Temperature.Maximum.Value) - 32) * 5 / 9).toFixed(0);
            tomorrowD.innerHTML = Obj.DailyForecasts[1].Day.IconPhrase;
            //************************ delete all notes ********************

            while (listNotes.hasChildNodes()) {
                listNotes.removeChild(listNotes.lastChild);
            }

            // *********************** Notes Display ********************
            var notes = Obj.notes;
            for (x in notes) {
                var para = document.createElement("li");
                var node = document.createTextNode(notes[x]);
                para.appendChild(node);
                listNotes.appendChild(para);
            }
        }
    };
    xhttp.open("GET", "http://localhost:8080/weather/5/" + str, true);
    xhttp.send();
}















