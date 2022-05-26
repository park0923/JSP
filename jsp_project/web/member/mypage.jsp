<%--
  Created by IntelliJ IDEA.
  User: wndgk
  Date: 2022-05-18
  Time: 오전 10:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>마이페이지</title>
    <link rel="stylesheet" type="text/css" href="/member/mypage/mypage.css">
</head>
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
<%@ include file="../navigation.jsp" %>
<div class="details">
    <button onclick="location.href='./mypage/checkPwForm.jsp'">회원정보 수정</button>
</div>
<div class="main">

</div>
</body>
</html>
