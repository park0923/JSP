<%@ page import="beans.BoardDto" %>
<%@ page import="mysql.BoardDao" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: wndgk
  Date: 2022-04-13
  Time: 오후 2:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="board" class="beans.BoardDto"/>
<html>
<head>
    <title>공지사항</title>
</head>
<body>
    <div class="container">
        <table border="1">
            <tr><td> 글 번호 </td><td> 제목 </td><td> 작성자 </td><td> 날짜 </td> <td> 조회수 </td></tr>
                <%
                    BoardDao dao = BoardDao.getInstance();
                    ResultSet rs = dao.getBoard();
                    int num=1;
                    while(rs.next()){
                %>

            <tr><td><%=num%> </td>
                <td><a href="noticeContent.jsp?id=<%=rs.getInt("id")%>"><%=rs.getString("title")%></a></td>
                <td><%=rs.getString("writer")%> </td>
                <td><%=rs.getString("createDay")%> </td>
                <td><%=rs.getInt("readcount")%> </td></tr>
                <%
                    num++;
                }
                %>
    </div>
    <button onclick="location.href='main.jsp'">뒤로 가기</button>
</body>
</html>
