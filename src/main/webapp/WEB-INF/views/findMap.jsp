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
          <div id="map" style="width:1000px;height:600px;border-radius: 50px;"></div>
      </div>
    </form>
  </div>
</div>
<%@ include file="footer.jsp" %>
</body>
</html>
