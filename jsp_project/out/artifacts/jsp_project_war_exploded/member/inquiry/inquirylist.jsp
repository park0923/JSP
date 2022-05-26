<%--
  Created by IntelliJ IDEA.
  User: wndgk
  Date: 2022-05-22
  Time: 오후 6:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="mysql.BoardDao" %>
<%@ page import="beans.BoardDto" %>
<%@ page import="mysql.UserDao" %>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.sql.ResultSet" %>
<jsp:useBean id="board" class="beans.BoardDto"/>
<html>
<head>
    <title>문의하기</title>
    <link rel="stylesheet" type="text/css" href="/member/inquiry/inquiry.css">
    <style>
        .details .inquiryBox
        {
            position: relative;
            width: 70%;
            padding: 20px;
            display: flex;
            flex-direction: column;
            margin-top: 10px;
            border-radius: 20px;
            box-shadow: 0 7px 25px rgba(0,0,0,0.5);
        }
        .cardHeader
        {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
        }
        .cardHeader h2
        {
            font-weight: 600;
            color: var(--blue);
        }
        .btn
        {
            position: relative;
            padding: 5px 10px;
            background: var(--blue);
            text-decoration: none;
            color: var(--white);
            border-radius: 6px;
        }
        .btn:hover
        {
            background: var(--blue2);
            color: var(--blue);
        }
        .btn_up
        {
            position: relative;
            padding: 5px 10px;
            background: blue;
            text-decoration: none;
            color: var(--white);
            border-radius: 6px;
        }
        .btn_up:hover
        {
            background: var(--blue2);
            color: var(--white);
        }
        .btn_del
        {
            position: relative;
            padding: 5px 10px;
            background: #FE2E2E;
            text-decoration: none;
            color: var(--white);
            border-radius: 6px;
        }
        .btn_del:hover
        {
            background: #F78181;
            color: var(--white);
        }

        .details .inquiryBox table
        {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }
        .details .inquiryBox table thead td
        {
            font-weight: 600;
            text-align: center;
        }
        .details .inquiryBox table tr
        {
            color: var(--black1);
            border-bottom: 1px solid rgba(0, 0, 0, 0.1);
        }
        .details .inquiryBox table tr:last-child
        {
            border-bottom: none;
        }
        .details .inquiryBox table tbody tr:hover
        {
            background: var(--blue);
            color: var(--white);
        }
        .details .inquiryBox table tr td .view
        {
            text-decoration: none;
            color:  var(--black1);
        }
        .details .inquiryBox table tr td .view:hover
        {
            text-decoration: none;
            color:  var(--white);
        }
        .details .inquiryBox table tr td
        {
            padding: 10px;
            text-align: center;
        }
        .details .inquiryBox table tbody tr td:nth-child(6)
        {
            text-align: end;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="navigation">
        <ul>
            <li class="list">
                <a href="/member/mainForm.jsp">
                    <img src="../../images/symbol.png" class="symbol" />
                    <span class="title">컴퓨터소프트웨어공학과</span>
                </a>
            </li>
            <li class="list">
                <a href="/member/mypage.jsp">
                    <span class="icon"><ion-icon name="person"></ion-icon></span>
                    <span class="title">마이페이지</span>
                </a>
            </li>
            <li class="list">
                <a href="/reservation/reservation.jsp">
                    <span class="icon"><ion-icon name="today"></ion-icon></span>
                    <span class="title">강의실 예약</span>
                </a>
            </li>
            <li class="list">
                <a href="/reservation/reservationcheck.jsp">
                    <span class="icon"><ion-icon name="search"></ion-icon></span>
                    <span class="title">예약 조회</span>
                </a>
            </li>
            <li class="list">
                <a href="/member/classroominquiry.jsp">
                    <span class="icon"><ion-icon name="calendar-clear"></ion-icon></span>
                    <span class="title">강의실 조회</span>
                </a>
            </li>
            <li class="list actives">
                <a href="/member/inquiry/inquirylist.jsp">
                    <span class="icon"><ion-icon name="chatbox-ellipses"></ion-icon></span>
                    <span class="title">문의하기</span>
                </a>
            </li>
        </ul>
    </div>

    <div class="main">
        <div class="topbar">
            <div class="toggle">
                <ion-icon name="menu-outline"></ion-icon>
            </div>
            <div class="user">
                <ul>
                    <li> <%=session.getAttribute("name")%></li>
                    <li><a href="../../home/logout.jsp">로그아웃</a></li>
                </ul>
            </div>
        </div>

        <div class="details">
            <div class="title">
                <h1>문의하기</h1>
                <hr/>
            </div>
            <div class="inquiryBox">
                <div class="cardHeader">
                    <h2>문의내용</h2>
                    <a href="/member/inquiry/inquiry.jsp" class="btn">글쓰기</a>
                </div>
                <table>
                    <thead>
                    <tr>
                        <td> 글 번호 </td>
                        <td> 제목 </td>
                        <td> 작성자 </td>
                        <td> 작성일 </td>
                        <td> 분류</td>
                    </tr>

                    </thead>
                    <tbody>
                    <%
                        System.out.println(session.getAttribute("id"));
                        UserDao udao = UserDao.getInstance();
                        String studentid = (String) session.getAttribute("id");
                        BoardDao dao = BoardDao.getInstance();
                        ResultSet rs = dao.getBoard();
                        ArrayList<BoardDto> uarr = dao.getBoardInquiry(studentid);
                        ArrayList<BoardDto> narr = dao.getBoardNotice("notice");
                        ArrayList<BoardDto> iarr = dao.getBoardNotice("inquiry");
                        if (udao.getPosition((String)session.getAttribute("id")).equals("admin")){
                            int num = 1;
                            for (int i = 0; i < narr.size(); i++){
                    %>
                    <tr>
                        <td><%=num%> </td>
                        <td>
                            <a class="view" href="inquiryview.jsp?id=<%=narr.get(i).getBoard_index()%>"><%=narr.get(i).getBoard_title()%></a>
                        </td>
                        <td><%=narr.get(i).getB0ard_studentID()%> </td>
                        <td><%=narr.get(i).getCreate_date()%></td>
                        <td>공지</td>
                        <td>
                            <a href="/member/inquiry/inquiryupdate.jsp?id=<%=narr.get(i).getBoard_index()%>" class="btn_up">수정</a>
                        </td>
                        <td>
                            <a href="/member/inquiry/inquirydeleteprocess.jsp?id=<%=narr.get(i).getBoard_index()%>" class="btn_del">삭제</a>
                        </td>
                    </tr>
                    <%
                            num++;
                        }
                        for(int j = 0; j < iarr.size(); j++){
                    %>
                    <tr>
                        <td><%=num%> </td>
                        <td>
                            <a class="view" href="inquiryview.jsp?id=<%=iarr.get(j).getBoard_index()%>"><%=iarr.get(j).getBoard_title()%></a>
                        </td>
                        <td><%=iarr.get(j).getB0ard_studentID()%> </td>
                        <td><%=iarr.get(j).getCreate_date()%></td>
                        <td>문의</td>
                        <td></td>
                        <td></td>
                    </tr>
                    <%
                                num++;
                            }
                        }
                        else{
                            int num=1;
                            for (int i = 0; i < narr.size(); i++){
                    %>
                    <tr>
                        <td><%=num%> </td>
                        <td>
                            <a class="view" href="inquiryview.jsp?id=<%=narr.get(i).getBoard_index()%>"><%=narr.get(i).getBoard_title()%></a>
                        </td>
                        <td><%=narr.get(i).getB0ard_studentID()%> </td>
                        <td><%=narr.get(i).getCreate_date()%></td>
                        <td>공지</td>
                        <td></td>
                        <td></td>
                    </tr>
                    <%
                                num++;
                            }
                            for(int j = 0; j < uarr.size(); j++){
                    %>
                    <tr>
                        <td><%=num%> </td>
                        <td>
                            <a class="view" href="inquiryview.jsp?id=<%=uarr.get(j).getBoard_index()%>">
                                <%=uarr.get(j).getBoard_title()%>
                            </a>
                        </td>
                        <td><%=uarr.get(j).getB0ard_studentID()%> </td>
                        <td><%=uarr.get(j).getCreate_date()%></td>
                        <td>문의</td>
                        <td>
                            <a href="/member/inquiry/inquiryupdate.jsp?id=<%=uarr.get(j).getBoard_index()%>" class="btn_up">수정</a>
                        </td>
                        <td>
                            <a href="/member/inquiry/inquirydeleteprocess.jsp?id=<%=uarr.get(j).getBoard_index()%>" class="btn_del">삭제</a>
                        </td>
                    </tr>
                    <%
                                num++;
                            }
                        }
                    %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
<script>
    let toggle = document.querySelector('.toggle');
    let navigation = document.querySelector('.navigation');
    let main = document.querySelector('.main');

    toggle.onclick = function(){
        navigation.classList.toggle('active')
        main.classList.toggle('active')
    }

    let list = document.querySelectorAll('.list');
    function activeLink(){
        list.forEach((item) =>
            item.classList.remove('actives'));
        this.classList.add('actives');

    }
    list.forEach((item) =>
        item.addEventListener('click', activeLink));
</script>
</body>
</html>
