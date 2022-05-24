<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="mysql.ReservationDao" %>
<%@ page import="beans.ReservationDto" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: wndgk
  Date: 2022-05-18
  Time: 오전 10:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>강의실 예약</title>
    <link rel="stylesheet" type="text/css" href="/member/reservation/reservation.css">
    <link rel="stylesheet" type="text/css" href="/member/reservation/seat.css">
</head>
<script type="text/javascript" src="reservation/selectTime.js"></script>
<body>
<%
    if (session.getAttribute("isLogin") == null) {
%>
<script>
    alert("로그인이 필요합니다.");
    location.href = "loginForm.jsp";
</script>
<%
    }
    String seatArr = "";
    String roomNum = "자동 배정";
    if(request.getParameter("lectureRoom") != null){
        ReservationDao dao = ReservationDao.getInstance();
        String[] startArr = request.getParameter("startTime").split(":");
        String[] endArr = request.getParameter("endTime").split(":");
        List<ReservationDto> selectedSeat = dao.selectTime(request.getParameter("lectureRoom"),request.getParameter("date"), Integer.parseInt(startArr[0]), Integer.parseInt(endArr[0]));
        for(int i=0; i<selectedSeat.size(); i++) {
            seatArr += selectedSeat.get(i).getSeat() + " ";
        }
        roomNum = request.getParameter("lectureRoom");
    }
%>

<div class="container">
    <div class="navigation">
        <ul>
            <li class="list">
                <a href="/member/mainForm.jsp">
                    <img src="../../images/symbol.png" class="symbol" />
                    <span class="title">컴퓨터소프트웨어공학과</span>
                </a>
            </li>
            <li class="list">
                <a href="/member/mypage.jsp">
                    <span class="icon"><ion-icon name="person"></ion-icon></span>
                    <span class="title">마이페이지</span>
                </a>
            </li>
            <li class="list actives">
                <a href="/member/reservation.jsp">
                    <span class="icon"><ion-icon name="today"></ion-icon></span>
                    <span class="title">강의실 예약</span>
                </a>
            </li>
            <li class="list">
                <a href="/member/reservationcheck.jsp">
                    <span class="icon"><ion-icon name="search"></ion-icon></span>
                    <span class="title">예약 조회</span>
                </a>
            </li>
            <li class="list">
                <a href="/member/classroominquiry.jsp">
                    <span class="icon"><ion-icon name="calendar-clear"></ion-icon></span>
                    <span class="title">강의실 조회</span>
                </a>
            </li>
            <li class="list">
                <a href="/member/inquiry.jsp">
                    <span class="icon"><ion-icon name="chatbox-ellipses"></ion-icon></span>
                    <span class="title">문의하기</span>
                </a>
            </li>
        </ul>
    </div>

    <div class="main">
        <div class="topbar">
            <div class="toggle">
                <ion-icon name="menu-outline"></ion-icon>
            </div>
            <div class="user">
                <ul>
                    <li> <%=session.getAttribute("name")%></li>
                    <li><a href="../../home/logout.jsp">로그아웃</a></li>
                </ul>
            </div>
        </div>



        <div class="details">
            <section>
                <h1>칠판</h1>
                <br>
                <ul class="case">
                    <li>
                        <button></button>
                        예약 가능
                    </li>
                    <li>
                        <button style="background-color: #287bff" ></button>
                        예약 선택
                    </li>
                    <li>
                        <button style="background-color: red"></button>
                        예약 불가
                    </li>
                </ul>
                <br>
                <div class="btn_seat">
                    <button class="seat" id="1" value="0"></button>
                    <button class="seat" id="2" value="0"></button>
                    <button class="seat" id="3" value="0"></button>
                    <button class="seat" id="4" value="0"></button>
                    <button class="seat" id="5" value="0"></button>
                    <button class="seat" id="6" value="0"></button>
                    <button class="seat" id="7" value="0"></button>
                    <button class="seat" id="8" value="0"></button>
                    <br>
                    <button class="seat" id="9" value="0"></button>
                    <button class="seat" id="10" value="0"></button>
                    <button class="seat" id="11" value="0"></button>
                    <button class="seat" id="12" value="0"></button>
                    <button class="seat" id="13" value="0"></button>
                    <button class="seat" id="14" value="0"></button>
                    <button class="seat" id="15" value="0"></button>
                    <button class="seat" id="16" value="0"></button>
                    <br>
                    <button class="seat" id="17" value="0" ></button>
                    <button class="seat" id="18" value="0" ></button>
                    <button class="seat" id="19" value="0" ></button>
                    <button class="seat" id="20" value="0" ></button>
                    <button class="seat" id="21" value="0" ></button>
                    <button class="seat" id="22" value="0" ></button>
                    <button class="seat" id="23" value="0" ></button>
                    <button class="seat" id="24" value="0" ></button>
                    <br>
                    <button class="seat" id="25" value="0" ></button>
                    <button class="seat" id="26" value="0" ></button>
                    <button class="seat" id="27" value="0" ></button>
                    <button class="seat" id="28" value="0" ></button>
                    <button class="seat" id="29" value="0" ></button>
                    <button class="seat" id="30" value="0" ></button>
                    <button class="seat" id="31" value="0" ></button>
                    <button class="seat" id="32" value="0" ></button>
                    <br>
                    <button class="seat" id="33" value="0" ></button>
                    <button class="seat" id="34" value="0" ></button>
                    <button class="seat" id="35" value="0" ></button>
                    <button class="seat" id="36" value="0" ></button>
                    <button class="seat" id="37" value="0" ></button>
                    <button class="seat" id="38" value="0" ></button>
                    <button class="seat" id="39" value="0" ></button>
                    <button class="seat" id="40" value="0"></button>
                    <br>
                </div>

                <form id="frm" name="seatForm" method="post" action="reservationProcess.jsp">
                    강의실:
                    <input type="text" name="lectureRoom" value="<%= roomNum%>" readonly>
                    날짜:
                    <input type="text" name="date" value="<%= request.getParameter("date")%>" readonly>
                    <br>
                    시간:
                    <input type="text" id="time" name="startTime" value="<%= request.getParameter("startTime")%> ~ <%= request.getParameter("endTime")%>" readonly>
                    <input type="text" id="person" value="<%= request.getParameter("person")%>" readonly>
                    <input type="hidden" name="seatList" readonly>

                    <input type="button" value="예약" onclick="confirmCheck()">
                    <input type="button" onclick="location.href='../reservation.jsp'" value="뒤로가기">
                    <input type="button" onclick="location.href='../mainForm.jsp'" value="취소">
                </form>
            </section>
        </div>
    </div>
</div>
<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
    let toggle = document.querySelector('.toggle');
    let navigation = document.querySelector('.navigation');
    let main = document.querySelector('.main');

    toggle.onclick = function(){
        navigation.classList.toggle('active')
        main.classList.toggle('active')
    }

    const list = document.querySelectorAll('.list');
    function activeLink(){
        list.forEach((item) =>
            item.classList.remove('actives'));
        this.classList.add('actives');
    }
    list.forEach((item) =>
        item.addEventListener('click', activeLink));

    <%--var count = 0;--%>
    <%--var maxCount = "<%=request.getParameter("person")%>";--%>
    <%--function countCheck(field){--%>
    <%--    if(field.checked)--%>
    <%--        count += 1;--%>
    <%--    else--%>
    <%--        count -= 1;--%>

    <%--    if(count > maxCount){--%>
    <%--        alert ("인원 수 초과");--%>
    <%--        field.checked = false;--%>
    <%--        count -= 1;--%>
    <%--    }--%>
    <%--}--%>


    // var seatValue;
    // function activeLink2(){
    //     button[$('.seat').val()].classList.add('actives');
    //     console.log($('.seat').val());
    // }
    // button.forEach((item) =>
    //     item.addEventListener('click', activeLink2));

    let button = document.querySelectorAll('.seat');
    var count = 0;
    var maxCount = $('#person').attr('value');
    var seatList = [];

    $('.seat').click(function(){
        var id_check = $(this).attr('id')-1;
        var value_check = $(this).attr('value');

        if(value_check === '0'){
            button[id_check].classList.toggle('seatSelect');
            $(this).prop('value',"1");
            seatList.push(id_check+1);
            count += 1;
        }else if(value_check === '1'){
            button[id_check].classList.toggle('seatSelect');
            $(this).prop('value',"0");
            for(var i = seatList.length - 1; i >= 0; i--) {
                if(seatList[i] === id_check+1) {
                    seatList.splice(i, 1);
                }
            }
            count -= 1;
        }

        if(count > maxCount){
            alert ("인원 수 초과");
            button[id_check].classList.toggle('seatSelect');
            $(this).prop('value',"0");
            seatList.pop();
            count -= 1;
        }

        console.log(id_check, value_check, count, seatList);
    });

    function confirmCheck(){
        if(count < maxCount){
            alert("자리를 인원수에 맞게 선택하세요");
            return;
        }
        $('input[name=seatList]').attr('value', seatList);
        document.seatForm.submit();
    }

    var selectSeat = '<%= seatArr%>';
    var num = selectSeat.split(" ");
    console.log(selectSeat);
    for(var k=0; k<num.length-1; k++) {
        button[Number(num[k].valueOf()-1)].classList.add('actives');
        $('.seat[class="seat actives"]').prop('value', "2");
        $('.seat[class="seat actives"]').prop('disabled', "true");
    }


</script>
</body>
</html>
