<%--
  Created by IntelliJ IDEA.
  User: 김선웅
  Date: 2022-04-11
  Time: 오후 2:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="mysql.UserDao" %>
<%@ page import="beans.UserDto" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    UserDao dao = UserDao.getInstance();
    UserDto user = new UserDto.Builder()
            .id(request.getParameter("id"))
            .name(request.getParameter("name"))
            .phone(request.getParameter("phone"))
            .email(request.getParameter("email"))
            .build();
    String id = (String) session.getAttribute("id");
    String pw = request.getParameter("pw");
    if(dao.confirmLogin(id,pw) == UserDao.USER_LOGIN_SUCCESS){
        if (dao.updateUser(id, user) == UserDao.USER_EXISTENT) {
            session.setAttribute("name", user.getName());
            session.setAttribute("id", user.getId());
            session.setAttribute("isLogin", true);
            response.sendRedirect("main.jsp");
    }
%>
<script>
    alert("회원정보 수정 완료");
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
