<%--
  Created by IntelliJ IDEA.
  User: sectionsmacbookair
  Date: 9/22/23
  Time: 10:45 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <title>구독 목록</title>
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
    <c:forEach items="${channelList }" var="Channel">
        <tr>
            <td>${Channel.s_channel }</td>
            <td>${Channel.u_nickname }</td>
            <td>${Channel.s_date }</td>
            <td><a onclick="delSub('${Channel.s_channel }', '${Channel.s_subscriber }')">구독취소</a></td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<script>
    function delSub(s_channel, s_subscriber) {
        $.ajax({
            type: "post",
            url: "http://localhost:8080/delSub",
            data: {
                s_channel: s_channel,
                s_subscriber: s_subscriber
            },
            success: function (data, status) {
                alert("구독이 취소되었습니다.");

                window.location.href = "";
            },
            error: function (status) {
                alert("오류가 발생하였습니다.");

                return false;
            }
        });
    };
</script>
</body>
</html>
