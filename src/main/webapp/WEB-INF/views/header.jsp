<%--
  Created by IntelliJ IDEA.
  User: jms
  Date: 5/16/23
  Time: 10:41 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>header</title>
  <link href="resources/css/header.css" rel="stylesheet">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
<div class="logo">
  <img src="resources/assets/Logo.png">
</div>
<form action="#" method="get">
  <input type="text" id="searchBox" name="searchBox" placeholder="검색어를 입력하세요" maxlength="20" size="100">
</form>
<div class="menu">
  <div class="first"><a href="#"><p>추천</p></a></div>
  <div class="second"><a href="#"><p>고객센터</p></a></div>
  <div class="third"><a href="#"><p>Login</p></a></div>
</div>
<div class="menu2">
  <button class="mapbtn" type="button">지도보기</button>
  <button class="findbtn" type="button">유저찾기</button>
</div>
</body>
</html>
