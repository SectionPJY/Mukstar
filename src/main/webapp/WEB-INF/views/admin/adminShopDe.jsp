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
  <script type="module" src="resources/JS/user/map.js"></script>
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
        <form method="post" action="">
          <div class="wrap">
            <div class="wrap_head">
              <c:forEach items="${boardData }" var="Board">
              <div class="head_left">
                <div class="head-con">
                  <label>가게명 : ${Board.r_name}</label>
                </div>
                <div class="head-con">
                  <label>가게 주소 : ${Board.r_address}</label>
                </div>
                <div class="head-con">
                  <label>평 점 : </label>
                  <div class="star_background">
                <span class="star">
              ★★★★★
              <span>★★★★★</span>
              <input type="range" name="rb_rating" oninput="drawStar(this)" value="${Board.r_rating}" step="1" min="0" max="10">
            </span>
                  </div>
                </div>
              </div>
              <div class="head_right">
                <div id="map" style="width:80%;height:80%;"></div>
              </div>
              </c:forEach>
            </div>
            <div class="wrap_body">
              <div class="body-table">
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
              </div>
            </div>
            <div class="wrap_footer">
              <div class="badge">
                <button type="button" value="뱃지1">
                  <img src="resources/assets/user/먹깨비.png">
                </button>
                <button type="button" value="뱃지2">
                  <img src="resources/assets/user/뱃지.png">
                </button>
                <button type="button" value="뱃지3">
                  <img src="resources/assets/user/왕관.png">
                </button>
                <button type="button" value="뱃지4">
                  <img src="resources/assets/user/인증마크.png">
                </button>
              </div>
              <div class="btn">
                <input type="button" value="가게 수정"/>
                <input type="submit" value="가게 삭제"/>
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
  window.onload = function (){
    const val = document.getElementsByName('rb_rating')[0].value;
    console.log(val);
    document.querySelector('.star span').style.width = (val * 10) + '%';
  }

  <c:forEach items="${resData }" var="Board">
  let data = "${Board.r_address}";
  let rName = "${Board.r_name}";
  </c:forEach>
  let addr = "";

  const drawStar = (target) => {
    document.querySelector(`.star span`).style.width = (+target.value * 10) + `%`;
  }

  function postSelect(rb_id) {
    location.href = "http://localhost:8080/postSelect?rb_id=" + rb_id;
  };
</script>

</body>
</html>
