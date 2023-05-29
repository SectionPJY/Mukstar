<%--
  Created by IntelliJ IDEA.
  User: jms
  Date: 2023-05-14
  Time: 오전 2:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>UserPage</title>
    <link href="resources/css/userPage.css" rel="stylesheet">
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
        <button style="background-color: #03B3FF; color: white">팔로우</button>
        <button style="background-color: #FFA800; color: white; margin-top: 15px;">구독하기</button>
        <button style="background-color: #FF5757; color: white; margin-top: 15px    ">차단하기</button>
    </div>
</div>
<div class="post-area">
    <div class="post">
        <div class="post-imgarea">
            <div class="inner-area2">
                <img src="resources/assets/fox.jpg"/>
            </div>
            <div class="title-area">
                <p>Title - Title</p>
            </div>
            <div class="text-area">
                <p>테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트
                    테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트</p>
            </div>
        </div>
    </div>
    <div class="post">
        <div class="post-imgarea">
            <div class="inner-area2">
                <img src="resources/assets/fox.jpg"/>
            </div>
            <div class="title-area">
                <p>Title - Title</p>
            </div>
            <div class="text-area">
                <p>테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트
                    테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트</p>
            </div>
        </div>
    </div>
    <div class="post">
        <div class="post-imgarea">
            <div class="inner-area2">
                <img src="resources/assets/fox.jpg"/>
            </div>
            <div class="title-area">
                <p>Title - Title</p>
            </div>
            <div class="text-area">
                <p>테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트
                    테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트</p>
            </div>
        </div>
    </div>
</div>
</body>
<footer>
    <%@ include file="footer.jsp" %>
</footer>
</html>
