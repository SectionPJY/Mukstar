<%--
  Created by IntelliJ IDEA.
  User: jms
  Date: 2023-05-23
  Time: 오후 11:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>myPage</title>
    <link href="resources/css/myPage.css" rel="stylesheet">
    <%@ include file="header2.jsp" %>
</head>
<body>
<div class="wrapper">
    <div class="img-area">
        <div class="inner-area">
            <img src="resources/assets/fox.jpg"/>
        </div>
    </div>
    <div class="social-icons">
        <a href="#" class="badge1"><img src="resources/assets/인증마크.png"/></a>
        <a href="#" class="badge2"><img src="resources/assets/뱃지.png"/></a>
        <a href="#" class="badge3"><img src="resources/assets/왕관.png"/></a>
        <a href="#" class="badge4"><img src="resources/assets/먹깨비.png"/></a>
    </div>
    <div class="buttons">
        <button style="background-color: #03B3FF; color: white" onclick="location.href='/pManage'">글관리</button>
        <button style="background-color: #FFA800; color: white; margin-top: 15px;" onclick="location.href='/infoPW'">회원정보</button>
        <button style="background-color: #FF5757; color: white; margin-top: 15px;" onclick="location.href='/sInfo'" >구독정보</button>
    </div>
</div>
<div class="post-area">
    <c:forEach items="${boardData}" var="Board">
        <div class="post" onclick="location.href='/boardSelect?r_id=${Board.r_id}'">
            <div class="post-imgarea">
                <div class="inner-area2">
                    <img src="resources/assets/fox.jpg" alt="이미지 없음"/>
                </div>
                <div class="title-area">
                    <p><c:out value="${Board.r_sub}"/></p>
                </div>
                <div class="text-area">
                    <p><c:out value="${Board.r_contents}"/></p>
                </div>
            </div>
            <div class="opacity"></div>
        </div>
    </c:forEach>
</div>
</body>
<footer>
    <%@ include file="footer.jsp" %>
</footer>
</html>
