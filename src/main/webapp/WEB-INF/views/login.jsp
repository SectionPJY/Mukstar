<%--
  Created by IntelliJ IDEA.
  User: sectionsmacbookair
  Date: 2023/05/11
  Time: 3:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="resources/css/login.css">
</head>
<body>
<img src="resources/assets/Logo.png" onclick="location.href='/'">
<div id="login-wrap"></div>
<div class="login-wrapper">
    <h2>Login</h2>
    <form method="post" action="loginCheck" id="login-form">
        <p id="p1">아이디</p><input id="u_id" type="text" name="u_id">
        <p id="p2">비밀번호</p><input id="u_pw" type="password" name="u_pw">
        <input id="s1" type="submit" value="로그인">
        <input id="s2" type="button" onclick="location.href='/pwSearch'" value="비밀번호 찾기">
    </form>
</div>
<div>
    <p id="reg" onclick="location.href='/signup'">회원가입</p>
    <p id="naver"></p>
    <p id="kakao"></p>
    <p id="google"></p>
</div>
</body>
</html>