<%--
  Created by IntelliJ IDEA.
  User: jms
  Date: 2023-06-04
  Time: 오후 3:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>UserPage</title>
    <link href="resources/css/updatePost.css" rel="stylesheet">
    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    <script type="text/javascript"
            src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a081dfe4a9800cc7ae0a46ef02263d69&libraries=services"></script>
    <%@ include file="header.jsp" %>
</head>
<body>
<div class="wrap">
    <div class="container">
        <c:forEach items="${boardData }" var="Board">
            <form method="post" action="/pUpdate">
                <input type="hidden" name="r_id" value="${Board.r_id}">
                <input type="hidden" name="r_address" value="">
                <div class="writepost">
                    <div class="top">
                        <div class="name">
                            <p id="u_nickname">${u_nickname}</p>
                        </div>
                        <div class="title">
                            <input type="text" id="r_sub" name="r_sub" value="${Board.r_sub}">
                        </div>
                    </div>
                    <div class="writearea">
                    <textarea id='r_contents' name="r_contents" placeholder="내용을 입력하세요.(3000자 이내)."
                              rows="10" cols="10" wrap="hard">${Board.r_contents}</textarea>
                        <div class="map_area">
                            <input type="text" id="r_name" name="r_name" value="${Board.r_name}">
                            <div id="map" style="width:450px;height:360px;border-radius: 0px 15px 15px 0px;"></div>
                        </div>
                    </div>
                    <div class="post_btn">
                        <button type="submit">수정하기</button>
                    </div>
                </div>
            </form>
        </c:forEach>
    </div>
</div>
<%@ include file="footer.jsp" %>
</body>
<script type="module" src="resources/JS/map.js"></script>
<script>
    <c:forEach items="${boardData }" var="Board">
    var data = "${Board.r_address}";
    </c:forEach>
    var addr = "";
</script>
</html>
