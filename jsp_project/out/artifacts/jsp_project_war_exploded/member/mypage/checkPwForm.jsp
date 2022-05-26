<%--
  Created by IntelliJ IDEA.
  User: tkfdk
  Date: 2022-05-14
  Time: 오후 11:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="beans.UserDto" %>
<%@ page import="mysql.UserDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    if (session.getAttribute("isLogin") == null) {
%>
<script>
    alert("로그인이 필요합니다.");
    location.href = "loginForm.jsp";
</script>
<%
}
%>
    <html>
    <head>
        <title>Title</title>
        <script src="../form.js"></script>
        <link rel="stylesheet" type="text/css" href="/member/mypage/mypage.css">
    </head>
    <body>

    <%@ include file="../../navigation.jsp" %>
        <div class="main">
            <div class="details">
                <form action="memberUpdateForm.jsp" method="post" name="modify_form">
                    <table>
                        <td>비밀번호 입력하세요</td>
                        <td><input type="password" name="pw"></td>
                    </table>
                    <div class="c">
                        <input type="button" value="확인" onclick="confirmModify()">
                        <input type="button" value="취소" onclick="location.href='../mainForm.jsp'">
                    </div>
                </form>
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
