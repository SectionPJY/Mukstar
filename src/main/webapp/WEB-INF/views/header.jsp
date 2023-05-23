<%--
  Created by IntelliJ IDEA.
  User: jms
  Date: 5/16/23
  Time: 10:41 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>header</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <link href="resources/css/header.css" rel="stylesheet">
    <script src="resources/JS/slideDown.js"></script>
</head>
<body>
<div class="logo">
    <img src="resources/assets/Logo.png">
</div>
<form action="#" method="get">
    <input type="text" id="searchBox" name="searchBox" placeholder="검색어를 입력하세요" maxlength="20" size="100">
</form>
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
            <li><a href="#">마이페이지</a></li>
            <c:choose>
              <c:when test="${empty u_uid}">
                <li><a href="#">Login</a></li>s
              </c:when>
              <c:otherwise>
                <li><a href="#">Logout</a></li>
              </c:otherwise>
            </c:choose>
        </ul>
    </nav>
</div>
<div class="menu2">
    <button class="mapbtn" type="button">지도보기</button>
    <button class="findbtn" type="button">유저찾기</button>
</div>
</body>
</html>
