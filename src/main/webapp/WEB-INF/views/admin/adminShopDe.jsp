<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <title>가게 상세</title>
  <!-- Custom fonts for this template-->
  <link href="resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link
    href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
    rel="stylesheet">
  <!-- Custom styles for this template-->
  <link href="resources/css/admin/sb-admin-2.min.css" rel="stylesheet">
  <link href="resources/css/admin/adminShopDe.css" rel="stylesheet">

  <!-- kakao map api -->
  <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
  <script type="text/javascript"
          src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a081dfe4a9800cc7ae0a46ef02263d69&libraries=services"></script>
</head>
<body id="page-top">
<!-- Page Wrapper -->
<div id="wrapper">
  <!-- Sidebar -->
  <%@ include file="adminNav.jsp" %>
  <!-- End of Sidebar -->

  <!-- Content Wrapper -->
  <div id="content-wrapper" class="d-flex flex-column">

    <!-- Main Content -->
    <div id="content">

      <!-- Topbar -->
      <%@ include file="adminHeader.jsp" %>
      <!-- End of Topbar -->

      <!-- Begin Page Content -->
      <div class="container-fluid">

        <!-- Content Row -->
        <form method="post" action="shopUpdate.do">
          <div class="wrap">
            <div class="wrap_head">
              <div class="head_left">
                <div class="head-con">
                  <input type="hidden" name="r_id" value="${boardData[0].r_id}" />
                  <p>가게명 : </p>
                  <input type="text" name="r_name" value="${boardData[0].r_name}" />
                </div>
                <div class="head-con">
                  <p>주소 : </p>
                  <input type="text" name="r_address" value="${boardData[0].r_address}" />
                </div>
                <div class="head-con">
                  <p>평 점 : </p>
                  <div class="star_background">
                <span class="star">
              ★★★★★
              <span>★★★★★</span>
              <input type="range" name="rb_rating" oninput="drawStar(this)" value="${boardData[0].r_rating}" step="1"
                     min="0"
                     max="10">
            </span>
                  </div>
                </div>
              </div>
              <div class="head_right">
                <div id="map" style="width:80%;height:80%;"></div>
              </div>
            </div>
            <div class="wrap_footer">
              <div class="btn">
                <input type="submit" value="가게 수정"/>
                <input type="button" onclick="href='/shopDelete.do?r_id=${boardData[0].r_id}'" value="가게 삭제">
              </div>
            </div>
            <div class="wrap_body">
              <div class="body-table">
                <c:choose>
                  <c:when test="${not empty resData }">
                    <div class="card-body">
                      <div class="container">
                        <table class="table table-bordered table-hover">
                          <thead>
                          <tr>
                            <th style="border: none; background-color: white">리뷰</th>
                          </tr>
                          <tr>
                            <th>번호</th>
                            <th>제목</th>
                            <th>작성자</th>
                            <th>작성일</th>
                            <th>조회수</th>
                          </tr>
                          </thead>
                          <tbody>
                            <%--추후 onclick 추가해서 페이지 이동--%>
                          <c:forEach items="${resData }" var="Res">
                            <tr onclick="postSelect('${Res.rb_id }')">
                              <td>${Res.rb_id}</td>
                              <td>${Res.rb_sub }</td>
                              <td>${Res.rb_uid }</td>
                              <td>${Res.rb_date }</td>
                              <td>${Res.rb_view}</td>
                            </tr>
                          </c:forEach>
                          </tbody>
                        </table>
                      </div>
                    </div>
                  </c:when>
                  <c:otherwise>
                    <h2 style="text-align: center">게시글 없음</h2>
                  </c:otherwise>
                </c:choose>
              </div>
            </div>
          </div>
        </form>
        <!-- Content Row -->

      </div>
      <!-- /.container-fluid -->

    </div>
    <!-- End of Main Content -->

    <!-- Footer -->
    <%@ include file="adminFooter.jsp" %>
    <!-- End of Footer -->

  </div>
  <!-- End of Content Wrapper -->

</div>
<!-- End of Page Wrapper -->

<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top">
  <i class="fas fa-angle-up"></i>
</a>

<!-- Bootstrap core JavaScript-->
<script src="resources/vendor/jquery/jquery.min.js"></script>
<script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="resources/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="resources/JS/admin/sb-admin-2.min.js"></script>


<script>
  window.onload = function () {
    const val = document.getElementsByName('rb_rating')[0].value;
    console.log(val);
    document.querySelector('.star span').style.width = (val * 10) + '%';
  }

  let data = "${resData[0].r_address}";
  let rName = "${resData[0].r_name}";
  let addr = "";

  function postSelect(rb_id) {
    location.href = "/postSelect?rb_id=" + rb_id;
  };

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

  if (data){
    addr = data;
    $('input[name=r_address]').val(addr);
    geocoder.addressSearch(data, function (result, status) {
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
          content: '<div style="width:150px;text-align:center;padding:6px 0;">' + data + '</div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
      }
    });
  }

  // 지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록합니다
  kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
    searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
      if (status === kakao.maps.services.Status.OK) {
        var detailAddr = !!result[0].road_address ? '<div>도로명주소 : ' + result[0].road_address.address_name + '</div>' : '';
        detailAddr += '<div>지번 주소 : ' + result[0].address.address_name + '</div>';
        addr = !!result[0].road_address ? result[0].road_address.address_name : result[0].address.address_name;
        $('input[name=r_address]').val(addr);
        console.log(addr);

        var content = '<div class="bAddr">' +
                '<span class="title">법정동 주소정보</span>' +
                detailAddr +
                '</div>';

        // 마커를 클릭한 위치에 표시합니다
        marker.setPosition(mouseEvent.latLng);
        marker.setMap(map);

        // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
        infowindow.setContent(content);
        infowindow.open(map, marker);
      }
    });
  });

  function searchDetailAddrFromCoords(coords, callback) {
    // 좌표로 법정동 상세 주소 정보를 요청합니다
    geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
  }
</script>

</body>
</html>
