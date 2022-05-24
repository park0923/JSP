<%--
  Created by IntelliJ IDEA.
  User: wndgk
  Date: 2022-05-14
  Time: 오후 7:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>강의실 예약 시스템</title>
    <link rel="stylesheet" type="text/css" href="/mainview.css">
</head>
<body>
<%
    if (session.getAttribute("isLogin") == null) {
%>
<script>
    alert("로그인이 필요합니다.");
    location.href = "../home/loginForm.jsp";
</script>
<%
    }
%>
<div class="container">
    <div class="navigation">
        <ul>
            <li class="list actives">
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
                <a href="/reservation/reservationcheck.jsp">
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

        <div class="cardBox">
            <div class="card">
                <div>
                    <div onclick=location.href="#" class="cardName">강의실 예약</div>
                </div>
                <div class="iconBx">
                    <ion-icon name="today"></ion-icon>
                </div>
            </div>
            <div class="card">
                <div>
                    <div onclick=location.href="#" class="cardName">예약 조회</div>
                </div>
                <div class="iconBx">
                    <ion-icon name="search"></ion-icon>
                </div>
            </div>
            <div class="card">
                <div>
                    <div onclick=location.href="#" class="cardName">강의실 조회</div>
                </div>
                <div class="iconBx">
                    <ion-icon name="calendar-clear"></ion-icon>
                </div>
            </div>
            <div class="card">
                <div>
                    <div onclick=location.href="#" class="cardName">문의하기</div>
                </div>
                <div class="iconBx">
                    <ion-icon name="chatbox-ellipses"></ion-icon>
                </div>
            </div>
        </div>

        <div class="details">
            <div class="noticelist">
                <div class="cardHeader">
                    <h2>Today</h2>
                    <a href="/member/classroominquiry.jsp" class="btn">View All</a>
                </div>

                    <table>
                        <thead>
                        <tr>
                            <td>구분</td>
                            <td>915</td>
                            <td>916</td>
                            <td>918</td>
                            <td>911</td>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>1교시</td>
                            <td>asdasdad</td>
                            <td>asdasdad</td>
                            <td>asdasdad</td>
                            <td>asdasdad</td>
                        </tr>
                        <tr>
                            <td>2교시</td>
                            <td>asdasdad</td>
                            <td>asdasdad</td>
                            <td>asdasdad</td>
                            <td>asdasdad</td>
                        </tr>
                        <tr>
                            <td>3교시</td>
                            <td>asdasdad</td>
                            <td>asdasdad</td>
                            <td>asdasdad</td>
                            <td>asdasdad</td>
                        </tr>
                        <tr>
                            <td>4교시</td>
                            <td>asdasdad</td>
                            <td>asdasdad</td>
                            <td>asdasdad</td>
                            <td>asdasdad</td>
                        </tr>
                        <tr>
                            <td>5교시</td>
                            <td>asdasdad</td>
                            <td>asdasdad</td>
                            <td>asdasdad</td>
                            <td>asdasdad</td>
                        </tr>
                        <tr>
                            <td>6교시</td>
                            <td>asdasdad</td>
                            <td>asdasdad</td>
                            <td>asdasdad</td>
                            <td>asdasdad</td>
                        </tr>
                        <tr>
                            <td>7교시</td>
                            <td>asdasdad</td>
                            <td>asdasdad</td>
                            <td>asdasdad</td>
                            <td>asdasdad</td>
                        </tr>
                        <tr>
                            <td>8교시</td>
                            <td>asdasdad</td>
                            <td>asdasdad</td>
                            <td>asdasdad</td>
                            <td>asdasdad</td>
                        </tr>
                        <tr>
                            <td>9교시</td>
                            <td>asdasdad</td>
                            <td>asdasdad</td>
                            <td>asdasdad</td>
                            <td>asdasdad</td>
                        </tr>
                        </tbody>
                    </table>

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
