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
  <script type="text/javascript"
          src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a081dfe4a9800cc7ae0a46ef02263d69&libraries=services"></script>
  <%@ include file="header.jsp" %>
</head>
<body>
<div class="wrap">
  <div class="container">
    <form action="/boardSearch" method="post" id="mapSearch">
      <input type="hidden" name="r_name" value="">
      <div class="map_area">
        <div class="search_area">
          <section class="search">
            <input type="search" name="detailAddress" id="address" onkeyup="enterKey()" class="search_box" placeholder="검색">
          </section>
          <section class="search_result">
            <div class="search_result_box">
              <ul id="result_list">
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

<script>
  let position = [
    <c:forEach items="${boardData }" var="Board" varStatus="i">
    <c:choose>
      <c:when test="${i.last}">{ data : "${Board.r_address}", rName : "${Board.r_name}", r_id : "${Board.r_id}" }</c:when>
      <c:otherwise>{ data : "${Board.r_address}", rName : "${Board.r_name}", r_id : "${Board.r_id}" },</c:otherwise>
    </c:choose>
    </c:forEach>
  ];

  var mapContainer = document.getElementById('map'), // 지도를 표시할 div
          mapOption = {
            center: new kakao.maps.LatLng(37.745704, 127.025001), // 지도의 중심좌표
            level: 3 // 지도의 확대 레벨
          };

  // 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
  var map = new kakao.maps.Map(mapContainer, mapOption);

  // 주소-좌표 변환 객체를 생성합니다
  var geocoder = new kakao.maps.services.Geocoder();

  var marker = new kakao.maps.Marker(), // 클릭한 위치를 표시할 마커입니다
          infowindow = new kakao.maps.InfoWindow({zindex:1}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다

  var bounds = map.getBounds();

  let count = 0;
  let maxCount = 0;
  kakao.maps.event.addListener(map, 'bounds_changed', function() {
    if(maxCount > count){
      return;
    }
    count = 0;
    maxCount = position.length;
    $("#result_list *").remove();

    // 지도 영역정보를 얻어옵니다
    bounds = map.getBounds();
    for (let i = 0; i < position.length; i ++) {
      geocoder.addressSearch(position[i].data, function (result, status) {
        // 정상적으로 검색이 완료됐으면
        if (status === kakao.maps.services.Status.OK) {
          var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
          if (bounds.contain(coords)) {
            ++count;
            $("#result_list").append('<li onclick="$(\'input[name=r_name]\').val(this.innerHTML); getElementById(\'mapSearch\').submit();" >' + position[i].rName + '</li>')
          }else{
            --maxCount;
          }
        }
      });
    }
  });


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

          let rame = position[i].rName;
          // 인포윈도우로 장소에 대한 설명을 표시합니다
          infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">'
                    + rame + '</div>'
          });
          infowindow.open(map, marker);

          kakao.maps.event.addListener(marker, 'click', function() {
            $('input[name=r_name]').val(rame);
            document.getElementById('mapSearch').submit();
          });
      }
    });
  }

  document.addEventListener('keydown', function(event) {
    if (event.keyCode === 13) {
      event.preventDefault();
    };
  }, true);

  function enterKey() {
    if (event.keyCode === 13) {
      // 주소로 좌표를 검색합니다
      geocoder.addressSearch($('#address').val(), function(result, status) {

        // 정상적으로 검색이 완료됐으면
        if (status === kakao.maps.services.Status.OK) {
          var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

          // 추출한 좌표를 통해 도로명 주소 추출
          let lat = result[0].y;
          let lng = result[0].x;
          getAddr(lat,lng);
          function getAddr(lat,lng){
            let geocoder = new kakao.maps.services.Geocoder();

            let coord = new kakao.maps.LatLng(lat, lng);
            let callback = function(result, status) {
              if (status === kakao.maps.services.Status.OK) {
                // 추출한 도로명 주소를 해당 input의 value값으로 적용
                $('#address').val(result[0].road_address.address_name);
              }
            }
            geocoder.coord2Address(coord.getLng(), coord.getLat(), callback);
          }

          // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
          map.setCenter(coords);
        }
      });
    };
  }
</script>
</body>
</html>
