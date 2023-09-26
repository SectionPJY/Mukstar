<%--
  Created by IntelliJ IDEA.
  User: sectionsmacbookair
  Date: 9/26/23
  Time: 2:31 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <title>구독자 목록</title>
</head>
<body>
<table border="1">
    <thead>
    <tr>
        <th>ID</th>
        <th>닉네임</th>
        <th>구독시작일</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${subList }" var="Subscriber">
        <tr>
            <td>${Subscriber.s_subscriber }</td>
            <td>${Subscriber.u_nickname }</td>
            <td>${Subscriber.s_date }</td>
            <td><a href="#">구독취소</a></td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
