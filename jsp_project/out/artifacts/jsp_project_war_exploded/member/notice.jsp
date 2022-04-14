<%--
  Created by IntelliJ IDEA.
  User: wndgk
  Date: 2022-04-13
  Time: 오후 2:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>공지사항</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            scroll-behavior: smooth;
        }

        body {
            height: 100%;
            overflow-x: hidden;
            display: flex;
            justify-content: center;
            align-items: center;
            background: linear-gradient(#4682B4, #FFFFFF);
            flex-direction: row;
        }

        .container {
            position: relative;
            display: flex;
            flex-direction: row;
            width: 100%;
            height: 100%;
            padding-top: 120px;
            justify-content: flex-start;
            align-items: center;

        }

        .container #menu {
            width: 20%;
            height: 100%;
        }

        .container #table {
            width: 60%;
            height: 80%;
        }

        .container #table table {
            width: 100%;
            height: 100%;
            text-align: center;
            border: 1px solid #dddddd;
            background-color: white;
            padding: 0;
            margin: 0;
        }

        .container #table table thead {
            height: 5%;
            background: white;
        }
        .container #table table thead tr th{
            height: 5%;
            background-color: #eeeeee;
            text-align: center;
        }
        .container #table table tbody
        {
            background-color: #eeeeee;
            text-align: center;
        }
    </style>
</head>
<body>
<div>
    <%@include file="header.jsp" %>
</div>
<div class="container">
    <div id="menu">
        <%@include file="menu.jsp" %>
    </div>
    <div id="table">
        <table>
            <thead>
            <tr>
                <th>번호</th>
                <th>제목</th>
                <th>작성자</th>
                <th>작성일</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>1</td>
                <td>안녕하세요</td>
                <td>홍길동</td>
                <td>2020-07-13</td>
            </tr>
            <tr>
                <td>1</td>
                <td>안녕하세요</td>
                <td>홍길동</td>
                <td>2020-07-13</td>
            </tr>
            <tr>
                <td>1</td>
                <td>안녕하세요</td>
                <td>홍길동</td>
                <td>2020-07-13</td>
            </tr>
            <tr>
                <td>1</td>
                <td>안녕하세요</td>
                <td>홍길동</td>
                <td>2020-07-13</td>
            </tr>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
