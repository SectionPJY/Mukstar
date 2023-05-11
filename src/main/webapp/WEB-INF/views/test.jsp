<%--
  Created by IntelliJ IDEA.
  User: sectionsmacbookair
  Date: 2023/05/11
  Time: 11:27 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>DB Test</title>
</head>
<body>
<table>
    <thead>
    <tr>
        <th>ID</th>
        <th>PW</th>
        <th>닉네임</th>
        <th>핸드폰</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${userList }" var="User">
        <tr>
            <td>${User.u_id }</td>
            <td>${User.u_pw }</td>
            <td>${User.u_nickname }</td>
            <td>${User.u_phone }</td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
