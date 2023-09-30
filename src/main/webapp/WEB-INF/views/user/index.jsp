<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Title</title>
  <link href="../../../resources/css/user/index.css" rel="stylesheet">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <%@ include file="header.jsp" %>
</head>
<body>
<div class="slideshow">
  <ul class="slides">
    <li><img src="../../../resources/assets/user/flower.jpg" alt=""></li>
    <li><img src="../../../resources/assets/user/fox.jpg" alt=""></li>
    <li><img src="../../../resources/assets/user/nature.jpg" alt=""></li>
    <li><img src="../../../resources/assets/user/space.jpg" alt=""></li>
    <li><img src="../../../resources/assets/user/moon.jpg" alt=""></li>
  </ul>
  <p class="controller">
    <!-- &lang: 왼쪽 방향 화살표 &rang: 오른쪽 방향 화살표 -->
    <span class="prev">&lang;</span>
    <span class="next">&rang;</span>
  </p>
  <script src="../../../resources/JS/user/slideShow.js"></script>
</div>
</body>
<footer>
  <%@ include file="footer.jsp" %>
</footer>
</html>
