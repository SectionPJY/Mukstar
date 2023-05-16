<%--
  Created by IntelliJ IDEA.
  User: sectionsmacbookair
  Date: 2023/05/15
  Time: 12:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Update Test</title>
</head>
<body>
<c:forEach items="${userInfo }" var="UserDTO">
    <form action="userUpdate" method="post">
        ID : <input type="text" placeholder="${UserDTO.u_id }" readonly> <br>
        PW : <input type="password" value="${UserDTO.u_pw }" id="u_pw" name="u_pw"> <br>
        닉네임 : <input type="text" value="${UserDTO.u_nickname }" id="u_nickname" name="u_nickname">
        핸드폰 : <input type="text" value="${UserDTO.u_phone }" id="u_phone" name="u_phone"> <br><br>
        <input type="submit" value="수정하기">
    </form>
</c:forEach>
</body>
</html>
