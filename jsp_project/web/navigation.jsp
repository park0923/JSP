<%@ page import="mysql.UserDao" %><%--
  Created by IntelliJ IDEA.
  User: wndgk
  Date: 2022-05-25
  Time: 오후 6:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="navigation.css">
</head>
<body>
<div class="container">
    <div class="navigation">
        <%
            UserDao dao = UserDao.getInstance();
            if (dao.getPosition((String)session.getAttribute("id")).equals("admin")){
        %>
            <ul>
                <li class="list">
                    <a href="mainForm.jsp">
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
                <li class="list">
                    <a href="">
                        <span class="icon"><ion-icon name="person-add"></ion-icon></span>
                        <span class="title">아이디 생성</span>
                    </a>
                </li>
                <li class="list">
                    <a href="">
                        <span class="icon"><ion-icon name="search"></ion-icon></span>
                        <span class="title">예약 조회</span>
                    </a>
                </li>
                <li class="list">
                    <a href="">
                        <span class="icon"><ion-icon name="calendar"></ion-icon></span>
                        <span class="title">강의 정보 입력</span>
                    </a>
                </li>
                <li class="list">
                    <a href="">
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
        <%
            }
            else {
        %>
            <ul>
                <li class="list">
                    <a href="mainForm.jsp">
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
                <li class="list">
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
                    <a href="/member/inquiry/inquirylist.jsp">
                        <span class="icon"><ion-icon name="chatbox-ellipses"></ion-icon></span>
                        <span class="title">문의하기</span>
                    </a>
                </li>
            </ul>
        <%
            }
        %>
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
