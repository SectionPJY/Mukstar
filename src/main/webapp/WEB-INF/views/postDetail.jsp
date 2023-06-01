<%--
  Created by IntelliJ IDEA.
  User: jms
  Date: 2023-05-31
  Time: 오후 8:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link href="resources/css/postDetail.css" rel="stylesheet">
    <%@ include file="header.jsp" %>
</head>
<body>
<div class="wrap">
    <div class="container">
        <div class="post_detail">
            <div class="detail_top">
                <div class="user_profile">
                    <div class="img_area">
                        <img src="resources/assets/fox.jpg"/>
                    </div>
                </div>
                <div class="list">
                    <c:forEach items="${boardData }" var="Board">
                    <div class="post_title">
                        <p>${Board.r_sub }</p>
                    </div>
                    <div class="post_date">
                        <p>${Board.r_date }</p>
                        <p>${Board.r_view }</p>
                    </div>
                </div>
            </div>
            <div class="post_area">
                <p>${Board.r_contents }</p>
            </div>
            <div class="replies_area">
                </c:forEach>
            </div>
        </div>
    </div>
</div>
</body>
</html>
