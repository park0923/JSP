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
  </style>
</head>
<body>
<div class="container">
  <%@ include file="../../navigation.jsp" %>
  <div class="main">
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
