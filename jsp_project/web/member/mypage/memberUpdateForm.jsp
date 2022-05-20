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
<head>
  <title>Join</title>
  <script src="../form.js"></script>
  <link rel="stylesheet" type="text/css" href="/member/mypage.css">
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
          <li><a href="logout.jsp">로그아웃</a></li>
        </ul>
      </div>
    </div>

    <div class="details">
      <form action="memberUpdateProcess.jsp" method="post" name="modify_form">
        <table>
          <tr>
            <td>ID</td>
            <td><input type="text" name="id" value="<%= user.getId()%>"></td>
          </tr>

          <tr>
            <td>Password</td>
            <td><input type="password" name="pw"></td>
          </tr>

          <tr>
            <td>이름</td>
            <td><input type="text" name="name" value="<%= user.getName()%>"></td>
          </tr>

          <tr>
            <td>Phone</td>
            <td><input type="text" name="phone" value="<%= user.getPhone()%>"></td>
          </tr>

          <tr>
            <td>Email</td>
            <td><input type="text" name="email" value="<%= user.getEmail()%>"></td>
          </tr>

        </table>
        <br/>
        <div class="c">
          <input type="button" value="수정" onclick="confirmModify()">
          <input type="button" value="취소" onclick="location.href='../mainForm.jsp'">
        </div>
      </form>
      <div>
        <button onclick="confirmCheck()">아이디 삭제</button>
        <button onclick="changePassWordPopUp()">비밀번호 변경</button>
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
