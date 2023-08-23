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
  <title>postDetail</title>
  <link href="resources/css/postDetail.css" rel="stylesheet">
  <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
  <script type="module" src="resources/JS/map.js"></script>
  <script type="text/javascript"
          src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a081dfe4a9800cc7ae0a46ef02263d69&libraries=services"></script>
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
          <div class="post_date">
            <p>${Board.r_date }</p>
            <p>${Board.r_view }</p>
          </div>
        </div>
      </div>
      <div class="post_area">
        <p class="content">${Board.r_contents}</p>
        <div class="post">
          <div id="map" style="width:450px;height:400px;"></div>
        </div>
      </div>
      <div class="replies_area">
        </c:forEach>
      </div>
    </div>
  </div>
</div>
<%@ include file="footer.jsp" %>
</body>
<script>
  <c:forEach items="${boardData }" var="Board">
  var data = "${Board.r_address}";
  var rName = "${Board.r_name}";
  </c:forEach>
</script>
</html>
