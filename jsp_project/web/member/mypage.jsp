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
    <link rel="stylesheet" type="text/css" href="mypage/mypage.css">
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
<div class="container">
    <div class="nav">
        <%@ include file="../navigation.jsp" %>
    </div>
    <div class="header">
        <%@ include file="../header.jsp" %>
    </div>

    <div class="mains">
        <div class="details">
            <div class="title">
                <h1>회원정보 수정</h1>
                <hr/>
            </div>
        </div>
        <button class="custom-btn btn-1"  style="margin-left: 500px" Onclick="location.href='checkPwForm.jsp'">회원정보 수정</button>

    </div>
</div>
<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
</body>
</html>
