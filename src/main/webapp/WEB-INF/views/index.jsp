<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Title</title>
  <link href="resources/css/index.css" rel="stylesheet">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <%@ include file="header.jsp" %>
</head>
<body>
<div class="slideshow">
  <ul class="slides">
    <c:forEach items="${boardList }" var="Board">
    <li><img src="" alt="${Board.r_sub }" onclick="location.href='/boardSelect?r_id=${Board.r_id}'"></li>
    </c:forEach>
  </ul>
  <p class="controller">
    <!-- &lang: 왼쪽 방향 화살표 &rang: 오른쪽 방향 화살표 -->
    <span class="prev">&lang;</span>
    <span class="next">&rang;</span>
  </p>
  <script src="resources/JS/slideShow.js"></script>
</div>
</body>
<footer>
  <%@ include file="footer.jsp" %>
</footer>
</html>
