<%--
  Created by IntelliJ IDEA.
  User: jms
  Date: 2023-05-24
  Time: 오전 1:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>header</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <link href="resources/css/header.css" rel="stylesheet">
    <script src="resources/JS/slideDown.js"></script>
</head>
<body>
<div class="logo">
    <img src="resources/assets/Logo.png" onclick="location.href='/'">
</div>
<div class="menu1">
    <nav>
        <ul>
            <li><a href="#">추천</a>
                <ul>
                    <li><a href="#">유저 랭킹</a></li>
                    <li><a href="#">지역별 맛집</a></li>
                </ul>
            </li>
            <li><a href="#">고객센터</a>
                <ul>
                    <li><a href="#">자주하는 질문</a></li>
                    <li><a href="#">질문하기</a></li>
                </ul>
            </li>
            <li><a href="/myPage">마이페이지</a></li>
            <c:choose>
                <c:when test="${empty u_id}">
                    <li><a href="/login">Login</a></li>
                </c:when>
                <c:otherwise>
                    <li><a href="/logout">Logout</a></li>
                </c:otherwise>
            </c:choose>
        </ul>
    </nav>
</div>
</body>
</html>
