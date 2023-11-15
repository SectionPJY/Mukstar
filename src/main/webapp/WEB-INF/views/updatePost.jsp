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
                <input type="hidden" name="rb_id" value="${Board.rb_id}">
                <input type="hidden" name="rb_address" value="">
                <div class="writepost">
                    <div class="top">
                        <div class="name">
                            <p id="u_nickname">${u_nickname}</p>
                        </div>
                        <div class="title">
                            <input type="text" id="rb_sub" name="rb_sub" value="${Board.rb_sub}">
                        </div>
                        <div class="star_background">
                                <%--<fieldset>
                                  <input type="radio" name="reviewStar" value="5" id="rate1"><label
                                  for="rate1">★</label>
                                  <input type="radio" name="reviewStar" value="4" id="rate2"><label
                                  for="rate2">★</label>
                                  <input type="radio" name="reviewStar" value="3" id="rate3"><label
                                  for="rate3">★</label>
                                  <input type="radio" name="reviewStar" value="2" id="rate4"><label
                                  for="rate4">★</label>
                                  <input type="radio" name="reviewStar" value="1" id="rate5"><label
                                  for="rate5">★</label>
                                </fieldset>--%>
                            <div class="star">
                                ★★★★★
                                <span>★★★★★</span>
                                <input type="range" name="rb_rating" oninput="drawStar(this)" value="${Board.rb_rating}" step="1" min="0" max="10">
                            </div>
                        </div>
                    </div>
                    <div class="writearea">
                    <textarea id='rb_contents' name="rb_contents" placeholder="내용을 입력하세요.(3000자 이내)."
                              rows="10" cols="10" wrap="hard">${Board.rb_contents}</textarea>
                        <div class="map_area">
                            <input type="text" id="rb_name" name="rb_name" value="${Board.rb_name}">
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
    window.onload = function (){
        const val = document.getElementsByName('rb_rating')[0].value
        console.log(val);
        document.querySelector('.star span').style.width = (val * 10) + '%';
    }

    <c:forEach items="${boardData }" var="Board">
    var data = "${Board.rb_address}";
    </c:forEach>
    var addr = "";


    const drawStar = (target) => {
        document.querySelector(`.star span`).style.width = (+target.value * 10) + `%`;
    }
</script>
</html>