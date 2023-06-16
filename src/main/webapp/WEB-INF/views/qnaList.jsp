<%--
  Created by IntelliJ IDEA.
  User: sectionsmacbookair
  Date: 2023/06/12
  Time: 8:47 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Title</title>
</head>
<body>
<table>
    <thead>
    <tr>
        <th>작성자</th>
        <th>제목</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${qnaList }" var="QnA">
        <tr>
            <td>${QnA.q_uid }</td>
            <td>${QnA.q_sub }</td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
