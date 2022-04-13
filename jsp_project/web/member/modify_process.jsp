<%--
  Created by IntelliJ IDEA.
  User: 김선웅
  Date: 2022-04-11
  Time: 오후 2:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="mysql.UserDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="user" class="beans.UserDto"/>
<jsp:setProperty name="user" property="*"/>
<%
    UserDao dao = UserDao.getInstance();
    user.setId(((String) session.getAttribute("id")));
    if (dao.updateUser(user) == 1) {
%>
<script>
    alert("회원정보 수정 완료");
    location.href = "login.jsp";
</script>
<%
} else {
%>
<script>
    alert("회원정보 수정 실패");
    history.back();
</script>
<%
    }
%>
