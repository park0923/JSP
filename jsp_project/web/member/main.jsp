<%--
  Created by IntelliJ IDEA.
  User: 김선웅
  Date: 2022-04-11
  Time: 오후 2:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Home</title>
</head>
<body>
<h2><%= session.getAttribute("name")%>님 안녕하세요</h2><br/><br/>
<hr>
<button onclick="location.href='logout.jsp'">로그아웃</button>
<button onclick="location.href='modify.jsp'">회원정보 수정</button>
</body>
</html>
