<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
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
        .lectureRoom{
           margin-left: 50px;
           padding: 10px;
           border-spacing: 8px;
        }
        
    </style>
</head>
<script type="text/javascript" src="selectTime.js"></script>
<body>
    <div class="outer">
        <section>
            <label for="start">Start date:</label>
            <%
                Date date = new Date();
                SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy-MM-dd");
                String strDate = simpleDate.format(date);
            %>

            <form name="input" method="post" action="seatSelection.jsp">
                <input type="date" id="start" name="date"
                       value=<%= strDate%>
                               min="2022-05-13" max="2030-12-31">
                <select name="startTime" onchange="categoryChange(this)">
                    <option value="0">시작 시간 선택</option>
                    <option value="09:00">09:00</option>
                    <option value="10:00">10:00</option>
                    <option value="11:00">11:00</option>
                    <option value="12:00">12:00</option>
                    <option value="13:00">13:00</option>
                    <option value="14:00">14:00</option>
                    <option value="15:00">15:00</option>
                    <option value="16:00">16:00</option>
                    <option value="17:00">17:00</option>
                    <option value="18:00">18:00</option>
                    <option value="19:00">19:00</option>
                </select>

                <select name="endTime" id="changeTime">
                    <option value="">종료 시간 선택</option>
                    <option>시작 시간을 선택하세요</option>
                </select>

                <br>
                인원:
                <input type="number" name="person" min="1" max="10" step="1" value="1">
                <input type="submit" value="선택">
            </form>
        </section>
    </div>
</body>
</html>