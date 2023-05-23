<%--
  Created by IntelliJ IDEA.
  User: sectionsmacbookair
  Date: 2023/05/22
  Time: 3:10 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Find My ID</title>
</head>
<body>
<form action="findID" method="post">
    닉네임 : <input type="text" id="u_nickname" name="u_nickname"> <br>
    핸드폰 : <input type="text" id="u_phone" name="u_phone"> <br>
    <input type="submit" value="찾기"> <a href="/">돌아가기</a>
</form>
</body>
</html>
