<%--
  Created by IntelliJ IDEA.
  User: sectionsmacbookair
  Date: 9/22/23
  Time: 9:04 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>유저목록</title>
</head>
<body>
<table border="1">
    <thead>
    <tr>
        <th>ID</th>
        <th>닉네임</th>
        <th>비고</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${userList }" var="User">
        <c:choose>
            <c:when test="${User.u_id == u_id }">
            </c:when>
            <c:otherwise>
                <tr>
                    <td>${User.u_id }</td>
                    <td>${User.u_nickname }</td>
                    <td><a href="#">구독하기</a></td>
                </tr>
            </c:otherwise>
        </c:choose>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
