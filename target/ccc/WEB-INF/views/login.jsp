<%--
  Created by IntelliJ IDEA.
  User: kjskj
  Date: 2023-05-09
  Time: 오전 9:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="resources/css/login.css">
</head>
<body>
    <img src="resources/assets/Mukstar.png">
    <div class="login-wrapper">
        <h2>Login</h2>
        <form method="post" action="" id="login-form">
            <p id="p1">아이디</p><input id="i1" type="text" name="userName">
            <p id="p2">비밀번호</p><input id="i2" type="password" name="userPassword">
            <input id="s1" type="submit" value="로그인"><input id="s2" type="submit" value="비밀번호 찾기">
        </form>
    </div>
</body>
</html>
