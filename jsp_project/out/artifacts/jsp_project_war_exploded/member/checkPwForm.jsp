<%--
  Created by IntelliJ IDEA.
  User: tkfdk
  Date: 2022-05-14
  Time: 오후 11:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="beans.UserDto" %>
<%@ page import="mysql.UserDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <html>
    <head>
        <style>
            .details .inquiryBox
            {
                position: relative;
                width: 70%;
                padding: 20px;
                display: flex;
                flex-direction: column;
                margin-top: 10px;
                border-radius: 20px;
                box-shadow: 0 7px 25px rgba(0,0,0,0.5);
            }

            .details .inquiryBox from
            {
                position: relative;
                background: var(--black1);
            }
            .details .inquiryBox .inputbox
            {
                position: relative;
                width: 100%;
                margin-bottom: 20px;
                display: flex;
                justify-content: center;
            }
            .details .inquiryBox .inputbox input
            {
                position: relative;
                width: 80%;
                border: none;
                outline: black;
                padding: 10px 10px;
                border-radius: 30px;
                box-shadow: 0 7px 25px rgba(0,0,0,0.2);
                font-size: 15px;
            }
            .details .inquiryBox .inputbox button
            {
                position: relative;
                width: 80%;
                border: none;
                outline: black;
                padding: 10px 10px;
                border-radius: 30px;
                box-shadow: 0 7px 25px rgba(0,0,0,0.2);
                font-size: 15px;
            }
            .details .inquiryBox .inputbox textarea
            {
                position: relative;
                width: 80%;
                min-height: 600px;
                border: none;
                outline: black;
                padding: 10px 10px;
                border-radius: 20px;
                box-shadow: 0 7px 25px rgba(0,0,0,0.2);
                font-size: 20px;
            }
            .details .inquiryBox .inputbox input[type="submit"]
            {
                background: var(--blue);
                color: var(--white);
                text-transform: uppercase;
                letter-spacing: 2px;
                font-weight: 600;
                width: 40%;
            }
            .details .inquiryBox .inputbox input[type="submit"]:hover
            {
                background: var(--blue2);
            }
            .details .inquiryBox .inputbox button
            {
                background: var(--blue);
                color: var(--white);
                text-transform: uppercase;
                letter-spacing: 2px;
                font-weight: 600;
                width: 40%;
            }
            .details .inquiryBox .inputbox button:hover
            {
                background: var(--blue2);
            }
            .custom-btn1 {
                width: 100px;
                height: 50px;
                color: #fff;
                border-radius: 5px;
                padding: 10px 5px;
                font-family: 'Lato', sans-serif;
                font-weight: bold;
                font-size: large;
                background: transparent;
                cursor: pointer;
                transition: all 0.3s ease;
                position: center;
                display: inline-block;
                box-shadow:inset 2px 2px 2px 0px rgba(255,255,255,.5),
                7px 7px 20px 0px rgba(0,0,0,.1),
                4px 4px 5px 0px rgba(0,0,0,.1);
                outline: none;
                margin-left: 0px;
                margin-top: 0px;
            }
            .btn-11 {
                background: rgb(19, 109, 252);
                background: linear-gradient(0deg, rgb(45, 61, 250) 0%, rgba(12,25,180,1) 100%);
                border: none;
            }
            .btn-11:hover {
                background: rgb(0,3,255);
                background: linear-gradient(0deg, rgba(0,3,255,1) 0%, rgba(2,126,251,1) 100%);
            }
        </style>
        <title>Title</title>
        <script src="form.js"></script>
        <link rel="stylesheet" type="text/css" href="/member/mypage/mypage.css">
    </head>
    <body>
    <div class="container">
        <div class="navigation">
            <ul>
                <li class="list">
                    <a href="/member/mainForm.jsp">
                        <img src="../images/symbol.png" class="symbol" />
                        <span class="title">컴퓨터소프트웨어공학과</span>
                    </a>
                </li>
                <li class="list actives">
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
                    <a href="/member/inquiry/inquiry.jsp">
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
                <form action="mypage/memberUpdateForm.jsp" method="post" name="modify_form">

                    <div class="title">
                        <h1>회원정보 수정</h1>
                        <hr/>
                    </div>
                    <div class="inquiryBox">

                        <div class="inputbox">

                     <input type="password" name="pw"  placeholder="비밀번호 입력">

                        </div>
                  <div class="c" style="margin-left: 400px">

                      <input class="custom-btn1 btn-11" type="button" value="확인" onclick="confirmModify()">
                      <input class="custom-btn1 btn-11" type="button" value="취소" onclick="location.href='mainForm.jsp'">
                      </div>

                    </div>
                </form>

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
