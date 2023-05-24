<%--
  Created by IntelliJ IDEA.
  User: sectionsmacbookair
  Date: 2023/05/24
  Time: 2:39 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Board Detail</title>
</head>
<body>
<c:forEach items="boardData" var="Board">
    제목 : ${Board.r_sub } <br>
    작성자 : ${Board.r_uid }   작성시간 : ${Board.r_date } <br> <br>
    내용 <br>
    ${Board.r_contents }
</c:forEach>
</body>
</html>
