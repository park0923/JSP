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
    location.href = "login.jsp";
</script>
<%
} else {
%>
    <html>
    <head>
        <title>Title</title>
    </head>
    <body>
        <form action="modify.jsp" method="post" name="modify_form">
            <table>
                <td>비밀번호 입력하세요</td>
                <td><input type="password" name="pw"></td>
            </table>
            <div class="c">
                <input type="submit" value="확인" >
                <input type="button" value="취소" onclick="location.href='main.jsp'">
            </div>
        </form>
    </body>
    </html>
<%
    }
%>