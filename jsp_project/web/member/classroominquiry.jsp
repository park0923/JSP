<%@ page import="java.sql.ResultSet" %>
<%@ page import="mysql.testDAO" %>
<%@ page import="beans.testDTO" %>
<%@ page import="mysql.ScheduleDAO" %>
<%@ page import="beans.ScheduleDTO" %><%--
  Created by IntelliJ IDEA.
  User: wndgk
  Date: 2022-05-18
  Time: 오전 10:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>강의실 조회</title>
    <link rel="stylesheet" type="text/css" href="/member/classroominquiry.css">
    <style>
        table{
            border: 2px solid #d2d2d2;
            border-collapse: collapse;
            font-size: 0.9em;
        }
        th, td{
            border: 1px solid #d2d2d2;
            border-collapse: collapse;
        }
        th{
            height: 5px;
        }
        td {
            width: 90px;
            height: 60px;
        }
        .left{
            display: inline-block;
            float: left;
        }
    </style>
</head>
<SCRIPT LANGUAGE="JavaScript">
    function change(style) {

        if( style == "selectBox01" )
        {
            test.style.display= "inline"
            view1.style.display = "inline"
            view2.style.display = "none"
            view3.style.display = "none"
            view4.style.display = "none"
        }
        if( style == "selectBox02" )
        {
            test.style.display= "inline"
            view1.style.display = "none"
            view2.style.display = "inline"
            view3.style.display = "none"
            view4.style.display = "none"
        }
        if( style == "selectBox03" )
        {
            test.style.display= "inline"
            view1.style.display = "none"
            view2.style.display = "none"
            view3.style.display = "inline"
            view4.style.display = "none"
        }
        if( style == "selectBox04")
        {
            test.style.display= "inline"
            view1.style.display = "none"
            view2.style.display = "none"
            view3.style.display = "none"
            view4.style.display = "inline"
        }

    }
</SCRIPT>
<body>
<%
    if (session.getAttribute("isLogin") == null) {
%>
<script>
    alert("로그인이 필요합니다.");
    location.href = "login.jsp";
</script>
<%
    }
%>
<div class="container">
    <div class="navigation">
        <ul>
            <li class="list">
                <a href="/member/mainview.jsp">
                    <img src="../images/symbol.png" class="symbol" />
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
                <a href="/member/reservation.jsp">
                    <span class="icon"><ion-icon name="today"></ion-icon></span>
                    <span class="title">강의실 예약</span>
                </a>
            </li>
            <li class="list">
                <a href="/member/reservationcheck.jsp">
                    <span class="icon"><ion-icon name="search"></ion-icon></span>
                    <span class="title">예약 조회</span>
                </a>
            </li>
            <li class="list actives">
                <a href="/member/classroominquiry.jsp">
                    <span class="icon"><ion-icon name="calendar-clear"></ion-icon></span>
                    <span class="title">강의실 조회</span>
                </a>
            </li>
            <li class="list">
                <a href="/member/inquiry.jsp">
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
                    <li><a href="logout.jsp">로그아웃</a></li>
                </ul>
            </div>
        </div>



        <div class="details">
            <div class="left">
                <select onChange="change(this.options[this.selectedIndex].value)" style="width: 100px" style="height: 20px">
                    <option selected>강의실 선택</option>
                    <option value="selectBox01">915</option>
                    <option value="selectBox02">916</option>
                    <option value="selectBox03">918</option>
                    <option value="selectBox04">911</option>
                </select>
            </div>

            <section id="test" style="display: none">

                <table id="view1" height="600" style="color: #121212" style="display: none"> <!--915 강의 시간표-->
                    <caption>▶  강의 시간표  ◀</caption>
                    <Tr>
                        <td>월</td>
                        <td>화</td>
                        <td>수</td>
                        <td>목</td>
                        <td>금</td>
                    </Tr>
                    <%
                        testDAO dao = testDAO.getInstance();
                        ResultSet rs = dao.getSchedule();
                        System.out.println(rs);
                        while(rs.next()){
                            testDTO dto = new testDTO();
                            dto.setSchedule_name(rs.getString("schedule_name"));
                            dto.setSchedule_lectureroom_num(rs.getString("schedule_lectureroom_num"));
                            dto.setSchedule_class_Stime(rs.getString("schedule_class_Stime"));
                            dto.setSchedule_class_Etime(rs.getString("schedule_class_Etime"));
                            dto.setSchedule_week(rs.getString("schedule_week"));
                    %>
                    <form action="testAction.jsp" method="post">


                        <tr>
                            <th><%=rs.getString("schedule_lectureroom_num") %></th>
                            <td><%=rs.getString("schedule_lectureroom_num") %></td>
                            <td><%=rs.getString("schedule_class_Stime") %></td>
                            <td><%=rs.getString("schedule_class_Etime") %></td>
                            <td><%=rs.getString("schedule_week") %></td>
                        </tr>
                    </form>
                    <%
                        }
                    %>
                </table>

            </section>


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
