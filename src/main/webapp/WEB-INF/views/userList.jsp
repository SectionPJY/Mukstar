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
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
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
                <a href="#">구독중</a>
            </c:when>
            <c:otherwise>
                <tr>
                    <td>${User.u_id }</td>
                    <td>${User.u_nickname }</td>
                    <td><a onclick="addSub('${User.u_id }', '${u_id }')">구독하기</a></td>
                </tr>
            </c:otherwise>
        </c:choose>
    </c:forEach>
    </tbody>
</table>
<script>
    function addSub(s_channel, s_subscriber) {
        console.log("구독자 : " + s_subscriber + ", 채널 : " + s_channel);

        $.ajax({
            type: "post",
            url: "http://localhost:8080/addSub",
            data: {
                s_channel: s_channel,
                s_subscriber: s_subscriber
            },
            success: function (data, status) {
                alert("구독되었습니다.");

                window.location.href = "";
            },
            error: function (status) {
                alert("오류가 발생했습니다.");

                return false;
            }
        });
    };
</script>
</body>
</html>
