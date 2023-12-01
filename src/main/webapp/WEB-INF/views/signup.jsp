<%--
  Created by IntelliJ IDEA.
  User: sectionsmacbookair
  Date: 2023/05/12
  Time: 10:33 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>SignUp Test</title>
  <link rel="stylesheet" href="resources/css/signup.css">
</head>
<body>
<img src="resources/assets/user/Logo.png" onclick="location.href='/'">
<div id="signup-wrap">
  <div class="signup-wrapper">
    <h2>Sign in</h2>
    <form action="signupCheck" method="post" id="signup-form">
      <p id="p1">아이디</p><input type="text" id="u_id" name="u_id">
      <p id="p2">비밀번호</p><input type="password" id="u_pw" name="u_pw">
      <p id="p3">닉네임</p><input type="text" id="u_nickname" name="u_nickname">
      <p id="p4">전화번호</p><input type="text" id="u_phone" name="u_phone">
      <input type="submit" value="회원가입">
    </form>
  </div>
</div>
</body>
</html>
