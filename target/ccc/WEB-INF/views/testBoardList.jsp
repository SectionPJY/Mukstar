<%--
  Created by IntelliJ IDEA.
  User: sectionsmacbookair
  Date: 2023/05/23
  Time: 10:43 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Board</title>

    <script>
        function selectBoard(r_id) {
            console.log(r_id);
            const url = "http://localhost:8080/boardSelect?r_id=" + r_id;

            window.location.href = url;
        };
    </script>
</head>
<body>
<table>
    <thead>
    <tr>
        <th>번호</th>
        <th>제목</th>
        <th>작성자</th>
        <th>날짜</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${boardList }" var="Board">
        <tr onclick="selectBoard('${Board.r_id }')">
            <td>${Board.r_id }</td>
            <td>${Board.r_sub }</td>
            <td>${Board.r_uid }</td>
            <td>${Board.r_date }</td>
        </tr>
    </c:forEach>
    <script>
        function selectBoard(r_id) {
            console.log(r_id);
            const url = "http://localhost:8080/boardSelect?r_id=" + r_id;

            window.location.href = url;
        };
    </script>
    </tbody>
</table>
</body>
</html>
