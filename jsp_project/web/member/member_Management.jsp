<%--
  Created by IntelliJ IDEA.
  User: tkfdk
  Date: 2022-05-16
  Time: 오전 9:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="beans.UserDto" %>
<%@ page import="mysql.UserDao" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <table>
        <tr>
            <td>아이디</td><td>이름</td><td>이메일</td><td>전화번호</td><td>유형</td><td>예약 가능 상태</td><td>경고</td>
        </tr>
        <%
            UserDao dao = UserDao.getInstance();
            ResultSet rs = dao.getMember();
            System.out.println(rs);
            while(rs.next()){
        %>
        <tr>
            <td><%=rs.getString("member_id")%></td>
            <td><%=rs.getString("member_email")%></td>
            <td><%=rs.getString("member_phone")%></td>
            <td><%=rs.getString("member_position")%></td>
            <td><%=rs.getString("member_state")%></td>
            <td><%=rs.getString("member_warning")%></td>
            <td><button >수정</button></td>
        </tr>
        <%
            }
        %>
    </table>
</body>
</html>
