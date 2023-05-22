<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: sectionsmacbookair
  Date: 2023/05/22
  Time: 11:28 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Search Result</title>
</head>
<body>
<h3>유저 정보</h3>
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
    <c:forEach items="${searchResult }" var="Result">
        <tr>
            <td>${Result.u_id }</td>
            <td>${Result.u_pw }</td>
            <td>${Result.u_nickname }</td>
            <td>${Result.u_phone }</td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<a href="testSearch">돌아가기</a>
</body>
</html>
