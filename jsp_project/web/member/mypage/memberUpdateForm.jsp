<%--
  Created by IntelliJ IDEA.
  User: 김선웅
  Date: 2022-04-11
  Time: 오후 2:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="beans.UserDto" %>
<%@ page import="mysql.UserDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  UserDao dao = UserDao.getInstance();
  String id = (String) session.getAttribute("id");
  String pw = request.getParameter("pw");
  int rt = dao.confirmLogin(id, pw);
  if (session.getAttribute("isLogin") == null) {
%>
<script>
  alert("로그인이 필요합니다.");
  location.href = "loginForm.jsp";
</script>
<%
} else if(rt == UserDao.USER_LOGIN_FAIL) {
%>
<script>
  alert("비밀번호가 틀립니다.")
  history.back();
</script>
<%
}else if(rt == UserDao.USER_LOGIN_SUCCESS){
  UserDto user = UserDao.getInstance().getUser((String) session.getAttribute("id"));

%>
<html>
<style>

  #main{
    width:60%;
    margin:auto;
  }
  table{
    border: 2px solid #d2d2d2;
    border-collapse: collapse;
    font-size: 0.9em;
  }
  th, td{
    border: 1px solid #d2d2d2;
    border-collapse: collapse;
  }
  th{
    height: 5px;
  }
  td {
    width: 90px;
    height: 60px;
  }
  * {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
  }
  ul,
  li {
    list-style: none;
  }
  a {
    text-decoration: none;
    color: inherit;
  }
  .register{
    width: 550px;
    height: 600px;
    margin: 200px auto 0;
    padding: 15px 15px;
    background: white;
    color: #2b2e4a;
    font-size: 14px;
    text-align: left;
    box-shadow: 1px 1px 5px rgba(0, 0, 0, 0.2);
  }
  .register h3{
    font-size: 20px;
    margin-bottom: 20px;
    text-align: center;
  }
  .register input{
    width: 100%;
    height: 40px;
    outline: none;
    padding: 10px;
    border: 1px solid #707070;
    transition: 0.3s;
  }
  .register input:valid, .register input:focus{
    border: 1px solid #2b2e4a;
  }
  .register .center{
    display: flex;
    align-items: center;
  }
  .register .flex{
    display: flex;
    flex-direction: column;
  }
  .register .flex .container{
    display: grid;
    grid-template-columns: 1fr 3fr 1fr;
    margin-bottom: 10px;
  }
  .register .flex .container .item:first-child{
    margin-right: 10px;
  }
  .register .flex .container .item .idcheck{
    height: 100%;
    margin-left: 10px;
    padding: 5px 15px;
    background: #2b2e4a;
    border: 1px solid #2b2e4a;
    color: white;
    font-size: 12px;
    transition: 0.3s;
  }
  .register .flex .container .item .idcheck:hover{
    background: white;
    color: #2b2e4a;
  }
  .register .flex .container .item select{
    height: 40px;
    padding: 10px;
    border: 1px solid #2b2e4a;

  }
  .register .submit{
    width: 100%;
    height: 40px;
    color: white;
    border: none;
    border: 1px solid #2b2e4a;
    background: #2b2e4a;
    transition: 0.3s;
  }
  .register .flex .container:last-child{
    margin: 0;
  }
  .register .submit:hover{
    width: 100%;
    height: 40px;
    border: none;
    border: 1px solid #2b2e4a;
    color: #2b2e4a;
    background: white;
  }


  .left {
    width: 50%;
    float: left;
    margin-top: 200px;

  }
  .right {
    width: 50%;
    float: right;
    display: inline-block;
  }

</style>
<head>
  <title>Join</title>
  <script src="../form.js"></script>
  <link rel="stylesheet" type="text/css" href="/member/mypage/mypage.css">
  <style>
    table {
      /*width: 100%;*/
      border: 1px solid #444444;
      padding: 5px;
      margin-left: auto;
      margin-right: auto;
    }

    td {
      /*width: 100%;*/
      /*border: 1px solid #444444;*/
    }

    .c {
      text-align: center;
    }


    .custom-btn2 {
      width: 200px;
      height: 20px;
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
    }
    .btn-2 {
      background: rgb(19, 109, 252);
      background: linear-gradient(0deg, rgb(45, 61, 250) 0%, rgba(12,25,180,1) 100%);
      border: none;
    }
    .btn-2:hover {
      background: rgb(0,3,255);
      background: linear-gradient(0deg, rgba(0,3,255,1) 0%, rgba(2,126,251,1) 100%);
    }
  </style>
</head>
<body>
<div class="container">
  <div class="navigation">
    <ul>
      <li class="list">
        <a href="/member/mainForm.jsp">
          <img src="../../images/symbol.png" class="symbol" />
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
          <li><a href="logout.jsp">로그아웃</a></li>
        </ul>
      </div>
    </div>
  </div>
  <div class="details">

    <div class="title">
      <div>
        <h1 style="margin-top: 100px;">회원정보 수정</h1>
        <hr/>
        <form action="memberUpdateProcess.jsp" method="post" name="modify_form">
          <div class="register" style="padding-left: 40px; margin-top: 100px;">
            <h3 style="margin-bottom: 50px; border-left-width: 0px; margin-left: 0px; padding-top: 50px;">개인정보 수정</h3>
            <div class="flex">
              <ul class="container">
                <li class="item center">
                  ID
                </li>
                <li class="item">
                  <input type="text" name="id" value="<%= user.getId()%>">
                </li>
                <li class="item">
                </li>
              </ul>
              <ul class="container">
                <li class="item center">
                  Password
                </li>
                <li class="item">
                  <input type="password" name="pw">
                </li>
                <li class="item">
                </li>
              </ul>
              <ul class="container">
                <li class="item center">
                  이름
                </li>
                <li class="item">
                  <input type="text" name="name" value="<%= user.getName()%>">
                </li>
                <li class="item">
                </li>
              </ul>

              <ul class="container">
                <li class="item center">
                  Phone
                </li>
                <li class="item">
                  <input type="text" name="phone" value="<%= user.getPhone()%>">
                </li>
                <li class="item">
                </li>
              </ul>

              <ul class="container">
                <li class="item center">
                  Email
                </li>
                <li class="item">
                  <input type="text" name="email" value="<%= user.getEmail()%>">
                </li>
                <li class="item">
                </li>
              </ul>
              <br/>
              <div class="c">
                <input class="custom-btn2 btn-2" style="width: 200px; height: 40px;" type="button" value="수정" onclick="confirmModify()">
                <input  class="custom-btn2 btn-2" style="width: 200px; height: 40px;" type="button" value="취소" onclick="location.href='../mainForm.jsp'">
                <button class="custom-btn2 btn-2" style="width: 200px; height: 40px;" onclick="confirmCheck()">아이디 삭제</button>
                <button class="custom-btn2 btn-2"style="width: 200px; height: 40px;" onclick="changePassWordPopUp()">비밀번호 변경</button>
              </div>
            </div>
          </div>
        </form>
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
<%
  }
%>
