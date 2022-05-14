<%--
  Created by IntelliJ IDEA.
  User: tkfdk
  Date: 2022-04-15
  Time: 오후 11:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="mysql.BoardDao" %>
<%@ page import="beans.BoardDto" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="board" class="beans.BoardDto"/>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="container">
    <table border="1">
        <tr><td> 글 번호 </td><td> 제목 </td><td> 내용 </td> <td> 작성자 </td> <td> 생성 날짜 </td> <td> 업데이트 날짜 </td> <td> 조회수 </td></tr>
            <%
                    BoardDao dao = BoardDao.getInstance();
                    BoardDto boardDto = dao.getBoardId(request.getParameter("id"));
            %>
        <tr><td><%=boardDto.getId()%> </td>
            <td><%=boardDto.getTitle()%> </td>
            <td><%=boardDto.getContents()%></td>
            <td><%=boardDto.getWriter()%> </td>
            <td><%=boardDto.getCreateDay()%> </td>
            <td><%=boardDto.getUpdateDay()%> </td>
            <td><%=boardDto.getReedCount()%> </td>
        </tr>
        <button onclick="location.href='notice.jsp'">뒤로 가기</button>
<%
           if(session.getAttribute("name").equals(boardDto.getWriter())){
%>
        <button onclick="location.href='deleteProcess.jsp?id=<%=boardDto.getId()%>'">삭제하기</button>
        <%
            }else{
               System.out.println(session.getAttribute("name"));
               System.out.println(boardDto.getWriter());
            }
        %>
</div>
</body>
</html>
