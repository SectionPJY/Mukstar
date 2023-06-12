<%--
  Created by IntelliJ IDEA.
  User: jms
  Date: 2023-05-31
  Time: 오후 8:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="resources/css/postDetail.css" rel="stylesheet">
    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    <script type="module" src="resources/JS/map.js"></script>
    <script type="text/javascript"
            src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a081dfe4a9800cc7ae0a46ef02263d69&libraries=drawing"></script>
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
                    <div class="post_title">
                        <p>제목</p>
                    </div>
                    <div class="post_date">
                        <p>게시일</p>
                        <p>좋아요 수</p>
                    </div>
                </div>
            </div>
            <div class="post_area">
                <div class="post"><p></p></div>
                <div id="map" style="width:450px;height:400px;"></div>
            </div>
        </div>
    </div>
</div>
<%@ include file="footer.jsp" %>
</body>
</html>
