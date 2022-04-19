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

        .container .menu {
            width: 20%;
            height: 100%;
        }

        .container .table {
            position: relative;
            display: flex;
            flex-direction: column;
            background: white;
            padding: 20px;
            box-shadow: 0 7px 25px rgba(0,0,0,0.08);
            border-radius: 20px;
            width: 65%;
            height: 80%;

        }
        .container .table .cardHeader
        {
            display: flex;
            justify-content: start;
            align-items: flex-start;
            height: 60px;
        }
        .container .table .cardHeader h2
        {
            font-weight: 600;
            color: #4187f6;
        }
        .container .table table {
            width: 100%;
            height: 80%;
            border-collapse: collapse;
            margin-top: 10px;
        }
        .container .table table thead td{
            font-weight: 600;
            text-align: center;
        }
        .container .table table tr
        {
            color: black;
            border-bottom: 1px solid rgba(0,0,0,0.1);
        }
        .container .table table tr:last-child
        {
            border-bottom: none;
        }
        .container .table table tbody tr:hover
        {
            background: #4187f6;
            color: white;
        }
        .container .table table tr td
        {
            padding: 10px;
            text-align: center;
        }
        .container .table table tbody tr td:nth-child(2)
        {
            text-align: start;
        }

    </style>
</head>
<body>
<div>
    <%@include file="header.jsp" %>
</div>
<div class="container">
    <div class="menu">
        <%@include file="menu.jsp" %>
    </div>
    <div class="table">
        <div class="cardHeader">
            <h2>공지사항</h2>
        </div>
        <table>
            <thead>
            <tr>
                <td>번호</td>
                <td>제목</td>
                <td>작성자</td>
                <td>작성일</td>
                <td>조회수</td>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>1</td>
                <td onclick="location.href='/member/login.jsp'">안녕하세요</td>
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
