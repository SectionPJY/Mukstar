<%--
  Created by IntelliJ IDEA.
  User: jms
  Date: 2023-06-12
  Time: 오후 7:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta name="viewport"
        content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
  <title>findMap</title>
  <link href="resources/css/findMap.css" rel="stylesheet">
  <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
  <script type="module" src="resources/JS/map.js"></script>
  <script type="text/javascript"
          src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a081dfe4a9800cc7ae0a46ef02263d69&libraries=drawing"></script>
  <%@ include file="header.jsp" %>
</head>
<body>
<div class="wrap">
  <div class="container">
    <form action="#" method="post">
      <div class="map_area">
        <div class="search_area">
          <section class="search">
            <input type="search" name="search_area" class="search_box" placeholder="검색">
          </section>
          <section class="search_result">
            <div class="search_result_box">
              <ul class="result_list">
                <li>검색 결과 1</li>
                <li>검색 결과 2</li>
                <li>검색 결과 3</li>
                <li>검색 결과 4</li>
                <li>검색 결과 5</li>
                <li>검색 결과 6</li>
                <li>검색 결과 7</li>
              </ul>
            </div>
          </section>
        </div>
        <div id="map" style="width:500px;height:600px; float: right;"></div>
      </div>
    </form>
  </div>
</div>
<%@ include file="footer.jsp" %>
</body>
</html>
