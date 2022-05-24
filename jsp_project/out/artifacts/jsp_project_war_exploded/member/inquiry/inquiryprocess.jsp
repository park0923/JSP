<%--
  Created by IntelliJ IDEA.
  User: wndgk
  Date: 2022-05-23
  Time: 오후 6:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="mysql.BoardDao" %>
<%@ page import="mysql.UserDao" %>
<%@ page import="beans.UserDto" %>
<%
    UserDao udao = UserDao.getInstance();
    UserDto udto = udao.getUser((String) session.getAttribute("id"));
    BoardDao bdao = BoardDao.getInstance();
    String title = request.getParameter("title");
    String inquiry = request.getParameter("inquiry");
    String id = (String) session.getAttribute("id");
    String classification = "";
    if(udto.getPosition().equals("user")){
        classification = "inquiry";
    }
    else{
        classification = "notice";
    }
    if(bdao.insertBoard(title,inquiry,id,classification) == BoardDao.NOTICE_WRITE_SUCCESS){
%>
<script>
    alert("글쓰기를 성공 했습니다.");
    location.href = '/member/inquiry/inquirylist.jsp';
</script>
<%
}else {
%>
<script>
    alert("글쓰기를 실패 했습니다.");
    location.href = '/member/inquiry/inquirylist.jsp';
</script>
<%
    }
%>
