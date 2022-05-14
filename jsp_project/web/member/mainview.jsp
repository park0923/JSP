<%--
  Created by IntelliJ IDEA.
  User: wndgk
  Date: 2022-05-14
  Time: 오후 7:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>강의실 예약 시스템</title>
    <link rel="stylesheet" type="text/css" href="/mainview.css">
</head>
<body>
<div class="container">
    <div class="navigation">
        <ul>
            <li>
                <a href="#">
                    <span class="icon"><ion-icon name="logo-apple"></ion-icon></span>
                    <span class="title">Brand Name</span>
                </a>
            </li>
            <li>
                <a href="#">
                    <span class="icon"><ion-icon name="logo-apple"></ion-icon></span>
                    <span class="title">Dashboard</span>
                </a>
            </li>
            <li>
                <a href="#">
                    <span class="icon"><ion-icon name="person"></ion-icon></span>
                    <span class="title">Customers</span>
                </a>
            </li>
            <li>
                <a href="#">
                    <span class="icon"><ion-icon name="mail"></ion-icon></span>
                    <span class="title">Message</span>
                </a>
            </li>
            <li>
                <a href="#">
                    <span class="icon"><ion-icon name="help"></ion-icon></span>
                    <span class="title">Help</span>
                </a>
            </li>
            <li>
                <a href="#">
                    <span class="icon"><ion-icon name="settings"></ion-icon></span>
                    <span class="title">Setting</span>
                </a>
            </li>
            <li>
                <a href="#">
                    <span class="icon"><ion-icon name="lock-closed"></ion-icon></span>
                    <span class="title">Password</span>
                </a>
            </li>
            <li>
                <a href="#">
                    <span class="icon"><ion-icon name="log-out"></ion-icon></span>
                    <span class="title">Sign out</span>
                </a>
            </li>
        </ul>
    </div>

    <div class="main">
        <div class="topbar">
            <div class="toggle">
                <ion-icon name="menu-outline"></ion-icon>
            </div>
            <div class="search">
                <label>
                    <input type="text" placeholder="Search Here">
                    <ion-icon name="search-outline"></ion-icon>
                </label>
            </div>
            <div class="user">
                <h3>UserID</h3>
            </div>
        </div>

        <div class="cardBox">
            <div class="card">
                <div>
                    <div class="number">1,504</div>
                    <div class="cardName">Daily Views</div>
                </div>
                <div class="iconBx">
                    <ion-icon name="eye-outline"></ion-icon>
                </div>
            </div>
            <div class="card">
                <div>
                    <div class="number">80</div>
                    <div class="cardName">Sales</div>
                </div>
                <div class="iconBx">
                    <ion-icon name="eye-outline"></ion-icon>
                </div>
            </div>
            <div class="card">
                <div>
                    <div class="number">284</div>
                    <div class="cardName">Comments</div>
                </div>
                <div class="iconBx">
                    <ion-icon name="eye-outline"></ion-icon>
                </div>
            </div>
            <div class="card">
                <div>
                    <div class="number">1,504</div>
                    <div class="cardName">Earning</div>
                </div>
                <div class="iconBx">
                    <ion-icon name="eye-outline"></ion-icon>
                </div>
            </div>
        </div>

        <div class="details">
            <div class="noticelist">
                <div class="cardHeader">
                    <h2>공지사항</h2>
                </div>
                <table>
                    <thead>
                    <tr>
                        <td>name</td>
                        <td>name</td>
                        <td>name</td>
                        <td>name</td>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>asdasdad</td>
                        <td>asdasdad</td>
                        <td>asdasdad</td>
                        <td>asdasdad</td>
                    </tr>
                    <tr>
                        <td>asdasdad</td>
                        <td>asdasdad</td>
                        <td>asdasdad</td>
                        <td>asdasdad</td>
                    </tr>
                    <tr>
                        <td>asdasdad</td>
                        <td>asdasdad</td>
                        <td>asdasdad</td>
                        <td>asdasdad</td>
                    </tr>
                    <tr>
                        <td>asdasdad</td>
                        <td>asdasdad</td>
                        <td>asdasdad</td>
                        <td>asdasdad</td>
                    </tr>
                    <tr>
                        <td>asdasdad</td>
                        <td>asdasdad</td>
                        <td>asdasdad</td>
                        <td>asdasdad</td>
                    </tr>
                    <tr>
                        <td>asdasdad</td>
                        <td>asdasdad</td>
                        <td>asdasdad</td>
                        <td>asdasdad</td>
                    </tr>
                    <tr>
                        <td>asdasdad</td>
                        <td>asdasdad</td>
                        <td>asdasdad</td>
                        <td>asdasdad</td>
                    </tr>
                    <tr>
                        <td>asdasdad</td>
                        <td>asdasdad</td>
                        <td>asdasdad</td>
                        <td>asdasdad</td>
                    </tr>
                    <tr>
                        <td>asdasdad</td>
                        <td>asdasdad</td>
                        <td>asdasdad</td>
                        <td>asdasdad</td>
                    </tr>
                    <tr>
                        <td>asdasdad</td>
                        <td>asdasdad</td>
                        <td>asdasdad</td>
                        <td>asdasdad</td>
                    </tr>
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

    let list = document.querySelectorAll('.navigation li');
    function activeLink(){
        list.forEach((item) =>
            item.classList.remove('hovered'));
        this.classList.add('hovered');
    }
    list.forEach((item) =>
        item.addEventListener('click', activeLink));
</script>
</body>
</html>
