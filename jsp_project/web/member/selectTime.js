function categoryChange(e) {
    var endTime_1 = ["10:00", "11:00", "12:00", "13:00" ,"14:00","15:00","16:00","17:00","18:00","19:00","20:00","21:00"];
    var endTime_2 = ["11:00", "12:00", "13:00" ,"14:00","15:00","16:00","17:00","18:00","19:00","20:00","21:00"];
    var endTime_3 = ["12:00", "13:00" ,"14:00","15:00","16:00","17:00","18:00","19:00","20:00","21:00"];
    var endTime_4 = ["13:00" ,"14:00","15:00","16:00","17:00","18:00","19:00","20:00","21:00"];
    var endTime_5 = ["14:00","15:00","16:00","17:00","18:00","19:00","20:00","21:00"];
    var endTime_6 = ["15:00","16:00","17:00","18:00","19:00","20:00","21:00"];
    var endTime_7 = ["16:00","17:00","18:00","19:00","20:00","21:00"];
    var endTime_8 = ["17:00","18:00","19:00","20:00","21:00"];
    var endTime_9 = ["18:00","19:00","20:00","21:00"];
    var endTime_10 = ["19:00","20:00","21:00"];
    var endTime_11 = ["20:00","21:00"];
    var endTime_12 = ["21:00"];
    var target = document.getElementById("endTime");

    if(e.value == "1") var d = endTime_1;
    else if(e.value == "2") var d = endTime_2;
    else if(e.value == "3") var d = endTime_3;
    else if(e.value == "4") var d = endTime_4;
    else if(e.value == "5") var d = endTime_5;
    else if(e.value == "6") var d = endTime_6;
    else if(e.value == "7") var d = endTime_7;
    else if(e.value == "8") var d = endTime_8;
    else if(e.value == "9") var d = endTime_9;
    else if(e.value == "10") var d = endTime_10;
    else if(e.value == "11") var d = endTime_11;
    else if(e.value == "12") var d = endTime_12;

    target.options.length = 0;

    for (x in d) {
        var opt = document.createElement("option");
        opt.value = d[x];
        opt.innerHTML = d[x];
        target.appendChild(opt);
    }
}