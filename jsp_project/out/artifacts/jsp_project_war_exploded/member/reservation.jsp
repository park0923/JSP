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
          <img src="../images/symbol.png" class="symbol" />
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
        <a href="/member/inquiry/inquirylist.jsp">
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
          <li><a href="../home/logout.jsp">로그아웃</a></li>
        </ul>
      </div>
    </div>



    <div class="details">
      <section>
        <label for="start">Start date:</label>
        <%
          Date date = new Date();
          SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy-MM-dd");
          String strDate = simpleDate.format(date);
        %>

        <form name="input" method="post" action="reservation/seatSelection.jsp">
          <input type="date" id="start" name="date"
                 value=<%= strDate%>
                         min="2022-05-13" max="2030-12-31">
          <select name="startTime" onchange="categoryChange(this)">
            <option value="0">시작 시간 선택</option>
            <option value="09:00">09:00</option>
            <option value="10:00">10:00</option>
            <option value="11:00">11:00</option>
            <option value="12:00">12:00</option>
            <option value="13:00">13:00</option>
            <option value="14:00">14:00</option>
            <option value="15:00">15:00</option>
            <option value="16:00">16:00</option>
            <option value="17:00">17:00</option>
            <option value="18:00">18:00</option>
            <option value="19:00">19:00</option>
          </select>

          <select name="endTime" id="changeTime">
            <option value="">종료 시간 선택</option>
            <option>시작 시간을 선택하세요</option>
          </select>

          <br>
          인원:
          <input type="number" name="person" min="1" max="10" step="1" value="1">
          <input type="submit" value="선택">
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
