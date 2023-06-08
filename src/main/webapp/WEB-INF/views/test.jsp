<%--
  Created by IntelliJ IDEA.
  User: jms
  Date: 2023-05-31
  Time: 오전 12:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <link href="resources/css/test.css" rel="stylesheet">
    <%@ include file="header.jsp" %>
</head>
<body>
<div class="slide_wrapper">
    <ul class="slides">
        <li>slide 01</li>
        <li>slide 02</li>
        <li>slide 03</li>
        <li>slide 04</li>
        <li>slide 05</li>
    </ul>
</div>
<p class="controls">
    <span class="prev">prev</span>
    <span class="next">next</span>
</p>
<script src="resources/JS/test.js"></script>
</body>
<footer>
    <%@ include file="footer.jsp" %>
</footer>
</html>

