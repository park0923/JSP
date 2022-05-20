<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %><%--
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
                <a href="/member/reservation/reservationcheck.jsp">
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
                <form name="input" method="post" action="reservationProcess.jsp">
                    <select name="lectureRoom">
                        <option>강의실 선택</option>
                        <option value="915">915</option>
                        <option value="916">916</option>
                        <option value="918">918</option>
                        <option value="911">911</option>
                    </select>
                    날짜:
                    <input type="text" name="date" value="<%= request.getParameter("date")%>" readonly>
                    <br>
                    시간:
                    <input type="text" name="startTime" value="<%= request.getParameter("startTime")%> ~ <%= request.getParameter("endTime")%>" readonly>
                    <input type="text" name="person" value="<%= request.getParameter("person")%>" readonly>
                    <section>
                        <h1>Screen</h1>
                        <br>
                        <input type="checkbox" name="seat" value="1">
                        <input type="checkbox" name="seat" value="2">
                        <input type="checkbox" name="seat" value="3">
                        <input type="checkbox" name="seat" value="4">
                        <input type="checkbox" name="seat" value="5">
                        <input type="checkbox" name="seat" value="6">
                        <input type="checkbox" name="seat" value="7">
                        <input type="checkbox" name="seat" value="8">
                        <br>
                        <input type="checkbox" name="seat" value="9">
                        <input type="checkbox" name="seat" value="10">
                        <input type="checkbox" name="seat" value="11">
                        <input type="checkbox" name="seat" value="12">
                        <input type="checkbox" name="seat" value="13">
                        <input type="checkbox" name="seat" value="14">
                        <input type="checkbox" name="seat" value="15">
                        <input type="checkbox" name="seat" value="16">
                        <br>
                    </section>
                    <input type="submit" value="예약">
                </form>
            </section>
        </div>
    </div>
</div>
<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
<script>
    let toggle = document.querySelector('.toggle');
    let navigation = document.querySelector('.navigation');
    let main = document.querySelector('.main');

    toggle.onclick = function(){
        navigation.classList.toggle('active')
        main.classList.toggle('active')
    }

    let list = document.querySelectorAll('.list');
    function activeLink(){
        list.forEach((item) =>
            item.classList.remove('actives'));
        this.classList.add('actives');
    }
    list.forEach((item) =>
        item.addEventListener('click', activeLink));
</script>
</body>
</html>
