<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>header</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
  <link href="resources/css/user/header.css" rel="stylesheet">
  <script src="resources/JS/user/slideDown.js"></script>
</head>
<body>
<header>
  <div class="logo">
    <a href="/">
      <img src="resources/assets/user/Logo.png">
    </a>
  </div>
  <form action="/SearchAll" method="post">
    <input type="text" id="searchBox" name="searchBox" placeholder="검색어를 입력하세요" maxlength="20" size="100">
  </form>
  <div class="menu1">
    <nav>
      <ul>
        <li>유저랭킹</li>
        <li>고객센터</a>
          <ul>
            <li><a href="#">자주하는 질문</a></li>
            <li><a href="#">질문하기</a></li>
          </ul>
        </li>
        <c:choose>
          <c:when test="${empty u_id}">
            <li><a href="/login">Login</a></li>
          </c:when>
          <c:otherwise>
            <li><a href="/myPage">마이페이지</a></li>
            <li><a href="/logout">Logout</a></li>
          </c:otherwise>
        </c:choose>
      </ul>
    </nav>
  </div>
  <div class="menu2">
    <button class="mapbtn" type="button" onclick="location.href='/mapFind'">지도보기</button>
    <button class="findbtn" type="button" onclick="location.href='/userFind'">유저찾기</button>
  </div>
</header>
</body>
</html>
