<%--
  Created by IntelliJ IDEA.
  User: sectionsmacbookair
  Date: 2023/05/11
  Time: 4:10 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Login Test</title>
</head>
<body>
<c:choose>
    <c:when test="${empty u_id }">
        <h3>Session is Null</h3> <br>
        <a href="/testLogin">돌아가기</a>
    </c:when>
    <c:otherwise>
        <h3>Session is Exists 2</h3> <a href="/logout">로그아웃</a><br>
        ID : ${u_id } <br>
        닉네임 : ${u_nickname } <br><br>
        <a href="/testUpdate">정보수정 테스트</a> <br>
        <a href="/testBoardList">게시판</a> <br>
        <a href="/userList">유저목록</a> <a href="/channelList">구독 목록</a> <a href="subList">구독자 목록</a>
    </c:otherwise>
</c:choose>
</body>
</html>
