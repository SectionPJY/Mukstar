<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
    <link href="resources/css/index.css" rel="stylesheet">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <%@ include file="header.jsp" %>
</head>
<body>
<div class="wrap">
    <div class="container">
        <div class="flow_banner">
            <ul class="list">
                <c:forEach items="${boardList }" var="Board">
                    <li onclick="location.href='/pSelect?r_id=${Board.r_id}'">${Board.r_sub}</li>
                </c:forEach>
            </ul>
            <script src="resources/JS/index.js"></script>
        </div>
    </div>
</div>
</body>
<footer>
    <%@ include file="footer.jsp" %>
</footer>
</html>
