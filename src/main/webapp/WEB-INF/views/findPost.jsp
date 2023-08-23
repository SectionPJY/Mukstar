  <%--
  Created by IntelliJ IDEA.
  User: jms
  Date: 2023-06-01
  Time: 오후 4:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>게시물 찾기</title>
    <link href="resources/css/findPost.css" rel="stylesheet">
</head>
<body>
<%@ include file="header2.jsp" %>
<div id="wrap">
    <div class="container">
        <div class="user_search">
            <p>게시물</p>
            <input type="text">
            <button type="submit">검색</button>
        </div>
        <div class="user_list">
            <div class="user_info">
                <span class="loc">지역</span>
                <span class="tit">제목</span>
                <span class="grade">평점</span>
                <span class="fav">좋아요수</span>
                <span class="view">조회수</span>
            </div>
        </div>
        <div class="user_list">
            <div class="user_info">
                <span class="loc">지역</span>
                <span class="tit">제목</span>
                <span class="grade">평점</span>
                <span class="fav">좋아요수</span>
                <span class="view">조회수</span>
            </div>
        </div>
    </div>
</div>
</body>
<footer>
    <%@ include file="footer.jsp" %>
</footer>
</html>
