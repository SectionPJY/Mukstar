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
  <script type="text/javascript"
          src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a081dfe4a9800cc7ae0a46ef02263d69&libraries=services"></script>
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
<script>
  let position = [
  <c:forEach items="${boardData }" var="Board" varStatus="i">
    <c:choose>
      <c:when test="${i.last}">{ data : "${Board.r_address}", rame : "${Board.r_name}" }</c:when>
      <c:otherwise>{ data : "${Board.r_address}", rame : "${Board.r_name}" },</c:otherwise>
    </c:choose>
  </c:forEach>
  ];

  var mapContainer = document.getElementById('map'), // 지도를 표시할 div
          mapOption = {
            center: new kakao.maps.LatLng(37.6318009, 127.0756323), // 지도의 중심좌표
            level: 3 // 지도의 확대 레벨
          };

  // 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
  var map = new kakao.maps.Map(mapContainer, mapOption);

  // 주소-좌표 변환 객체를 생성합니다
  var geocoder = new kakao.maps.services.Geocoder();

  var marker = new kakao.maps.Marker(), // 클릭한 위치를 표시할 마커입니다
          infowindow = new kakao.maps.InfoWindow({zindex:1}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다

    for (let i = 0; i < position.length; i ++) {
      geocoder.addressSearch(position[i].data, function (result, status) {
        // 정상적으로 검색이 완료됐으면
        if (status === kakao.maps.services.Status.OK) {
          var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

          // 결과값으로 받은 위치를 마커로 표시합니다
          marker = new kakao.maps.Marker({
            map: map,
            position: coords
          });

          // 인포윈도우로 장소에 대한 설명을 표시합니다
          infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">' + position[i].rame + '</div>'
          });
          infowindow.open(map, marker);

          // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
          map.setCenter(coords);
        }
      });
    }

  // 지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록합니다
  kakao.maps.event.addListener(map, 'click', function(mouseEvent) {

  });
</script>
</body>
</html>
