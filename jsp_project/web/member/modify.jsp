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
  if (session.getAttribute("isLogin") == null) {
%>
<script>
  alert("로그인이 필요합니다.");
  location.href = "login.jsp";
</script>
<%
} else {
  UserDto user = UserDao.getInstance().getUser((String) session.getAttribute("id"));

%>
<html>
<head>
  <script src="form.js"></script>
  <title>Join</title>
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

<p class="c">회원 정보 수정</p>

<form action="modify_process.jsp" method="post" name="modify_form">
  <table>
    <tr>
      <td>ID</td>
      <td><%= user.getId()%>
      </td>
    </tr>

    <tr>
      <td>Password</td>
      <td><input type="password" name="pw"></td>
    </tr>

    <tr>
      <td>이름</td>
      <td><%= user.getName()%>
      </td>
    </tr>

    <tr>
      <td>Phone</td>
      <td><%= user.getPhone()%></td>
    </tr>

    <tr>
      <td>Email</td>
      <td><%= user.getEmail()%></td>
    </tr>

  </table>
  <br/>
  <div class="c">
    <input type="button" value="수정" onclick="confirmModify()">
    <input type="button" value="취소" onclick="location.href='main.jsp'">
  </div>
</form>

</body>
</html>
<%
  }
%>
