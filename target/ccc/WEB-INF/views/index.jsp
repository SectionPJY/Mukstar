<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="resources/css/index.css" rel="stylesheet">
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
    <div class="third"><a href="/login"><p>Login</p></a></div>
</div>
<div class="menu2">
    <button class="mapbtn" onclick="location.href='/map'" type="button">지도보기</button>
    <button class="findbtn" onclick="location.href='/userSearch'" type="button">유저찾기</button>
</div>

<div class="slideshow">
    <ul class="slides">
        <li><img src="resources/assets/flower.jpg" alt=""></li>
        <li><img src="resources/assets/fox.jpg" alt=""></li>
        <li><img src="resources/assets/nature.jpg" alt=""></li>
        <li><img src="resources/assets/space.jpg" alt=""></li>
    </ul>
    <p class="controller">
        <!-- &lang: 왼쪽 방향 화살표
        &rang: 오른쪽 방향 화살표 -->
        <span class="prev">&lang;</span>
        <span class="next">&rang;</span>
    </p>
</div>
<script src="resources/JS/slideShow.js"></script>
</body>
</html>
