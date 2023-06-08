<%--
  Created by IntelliJ IDEA.
  User: jms
  Date: 2023-06-08
  Time: 오후 6:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
    <link href="resources/css/test2.css" rel="stylesheet">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <%@ include file="header.jsp" %>
</head>
<body>
<div class="wrap">
    <div class="container">
        <div class="gallery">
            <ul class="clearfix">
                <li><div class="img">box4</div></li>
                <li><div class="img">box5</div></li>
                <li><div class="img">box1</div></li>
                <li><div class="img">box2</div></li>
                <li><div class="img">box3</div></li>
                <li><div class="img">box4</div></li>
                <li><div class="img">box5</div></li>
                <li><div class="img">box1</div></li>
                <li><div class="img">box1</div></li>
                <li><div class="img">box1</div></li>
                <li><div class="img">box1</div></li>
                <li><div class="img">box1</div></li>
            </ul>
        </div>

        <div class="banner_wraper">
            <img src="resources/assets/flower.jpg">
            <img src="resources/assets/fox.jpg">
            <img src="resources/assets/moon.jpg">
            <img src="resources/assets/nature.jpg">
            <img src="resources/assets/space.jpg">
            <img src="resources/assets/fox.jpg">
            <img src="resources/assets/flower.jpg">
            <img src="resources/assets/moon.jpg">
            <img src="resources/assets/moon.jpg">
            <img src="resources/assets/moon.jpg">
        </div>

        <div class="flow_banner">
            <ul class="list">
                <li>TEXT1</li>
                <li>TEXT2</li>
                <li>TEXT3</li>
                <li>TEXT4</li>
                <li>TEXT5</li>
            </ul>
        </div>

    </div>
</div>
<script src="resources/JS/test2.js"></script>
</body>
<footer>
    <%@ include file="footer.jsp" %>
</footer>
</html>
