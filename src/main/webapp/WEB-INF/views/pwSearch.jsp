<%--
  Created by IntelliJ IDEA.
  User: kjskj
  Date: 2023-05-23
  Time: 오전 10:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>SignUp Test</title>
  <link rel="stylesheet" href="resources/css/pwSearch.css">
</head>
<body>
<img src="resources/assets/Logo.png" onclick="location.href='/login'">
<div id="pwS-wrap"></div>
<div class="pwS-wrapper">
  <h2>Regist</h2>
  <form action="/" method="post" id="pwS-form">
    <p id="p1">아이디</p><input type="text" id="u_id" name="u_id"> <br>
    <p id="p3">닉네임</p><input type="text" id="u_nickname" name="u_nickname"> <br>
    <p id="p4">전화번호</p><input type="text" id="u_phone" name="u_phone"> <br> <br>
    <input type="button" value="전화번호"><input type="submit" value="비밀번호 찾기">
  </form>
</div>
</body>
</html>
