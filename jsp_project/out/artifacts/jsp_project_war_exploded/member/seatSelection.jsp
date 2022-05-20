<%@ page import="beans.UserDto" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Document</title>
    <style>
        .menu{
            display: inline-block;
            padding: 10px;
            margin: 10px;
        }
        section {
            background-color: white;
            width: 500px;
            height: 500px;
            text-align: center;
            margin: 45px;
        }
        .outer{
            background-color: gray;
            display: inline-block;
            width: 600px;
            height: 600px;
            padding: 10px;
            
        }
        .file{
            text-align: right;
            margin: 5px;
        }
        .seat{
           margin-left: 50px;
           padding: 10px;
           border-spacing: 8px;
           border: 10px;
           align-items: center;
        }
        td,tr{
            border: 1px solid aqua;
            align-items: center;
            padding: 1px;
            background-color: aqua;
        }
    </style>
</head>
<body>
    <div class="outer">
        <form name="input" method="post" action="reservationProcess.jsp">
            <select name="lectureRoom">
                <option>강의실 선택</option>
                <option value="915">915</option>
                <option value="916">916</option>
                <option value="918">918</option>
                <option value="911">911</option>
            </select>
            날짜:
            <input type="text" name="date" value="<%= request.getParameter("date")%>" readonly>
            <br>
            시간:
            <input type="text" name="startTime" value="<%= request.getParameter("startTime")%> ~ <%= request.getParameter("endTime")%>" readonly>
            <input type="text" name="person" value="<%= request.getParameter("person")%>" readonly>
            <section>
                <h1>Screen</h1>
                <br>
                <input type="checkbox" name="seat" value="1">
                <input type="checkbox" name="seat" value="2">
                <input type="checkbox" name="seat" value="3">
                <input type="checkbox" name="seat" value="4">
                <input type="checkbox" name="seat" value="5">
                <input type="checkbox" name="seat" value="6">
                <input type="checkbox" name="seat" value="7">
                <input type="checkbox" name="seat" value="8">
                <br>
                <input type="checkbox" name="seat" value="9">
                <input type="checkbox" name="seat" value="10">
                <input type="checkbox" name="seat" value="11">
                <input type="checkbox" name="seat" value="12">
                <input type="checkbox" name="seat" value="13">
                <input type="checkbox" name="seat" value="14">
                <input type="checkbox" name="seat" value="15">
                <input type="checkbox" name="seat" value="16">
                <br>
            </section>
            <input type="submit" value="예약">
        </form>
    </div>
</body>
</html>
