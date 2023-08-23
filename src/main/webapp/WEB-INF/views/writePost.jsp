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
  <title>writePost</title>
  <link href="resources/css/writePost.css" rel="stylesheet">
  <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
  <script type="text/javascript"
          src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a081dfe4a9800cc7ae0a46ef02263d69&libraries=services"></script>
  <%@ include file="header.jsp" %>
</head>
<body>
<div class="wrap">
  <div class="container">
    <form method="post" action="/pWrite">
      <input type="hidden" name="r_address" value="">
      <div class="writepost">
        <div class="top">
          <div class="name">
            <p id="u_nickname">${u_nickname}</p>
          </div>
          <div class="title">
            <input type="text" id="r_sub" name="r_sub">
          </div>
          <div class="star">
            <fieldset>
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
            </fieldset>
          </div>
        </div>
        <div class="writearea">
                    <textarea id='r_contents' name="r_contents" placeholder="내용을 입력하세요.(3000자 이내)."
                              rows="10" cols="10" wrap="hard"></textarea>
          <div class="map_area">
            <input type="text" id="r_name" name="r_name">
            <div id="map" style="width:450px;height:360px;border-radius: 0px 0px 15px 0px;"></div>
          </div>
        </div>
        <div class="post_btn">
          <button type="submit">작성하기</button>
        </div>
      </div>
    </form>
  </div>
</div>
<%@ include file="footer.jsp" %>
</body>
<script type="module" src="resources/JS/map.js"></script>
<script>
  var data = "";
  var addr = "";
</script>
</html>
