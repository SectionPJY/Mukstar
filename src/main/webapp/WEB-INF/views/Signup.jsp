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
</head>
<body>
<form action="signupCheck" method="post">
    ID : <input type="text" id="u_id" name="u_id"> <br>
    PW : <input type="password" id="u_pw" name="u_pw"> <br>
    별명 : <input type="text" id="u_nickname" name="u_nickname"> <br>
    핸드폰 : <input type="text" id="u_phone" name="u_phone"> <br> <br>
    <input type="submit" value="회원가입">
</form>
</body>
</html>
