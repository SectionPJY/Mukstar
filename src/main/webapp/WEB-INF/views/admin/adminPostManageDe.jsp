<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <title>게시글관리 상세</title>
  <!-- Custom fonts for this template-->
  <link href="resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link
    href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
    rel="stylesheet">
  <!-- Custom styles for this template-->
  <link href="resources/css/admin/sb-admin-2.min.css" rel="stylesheet">
  <link href="resources/css/admin/adminPostManageDe.css" rel="stylesheet">

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

        <c:forEach items="${boardData }" var="Board">
          <!-- Content Row -->
          <form method="post" action="boardUpdate">
            <div class="wrap">
              <div class="wrap_1">
                <div class="wrap1">
                  <div class="wrap1_top">
                    <div class="title">
                      <input type="text" name="rb_sub" value="${Board.rb_sub}">
                    </div>
                    <div class="rating">
                      <p>별점 : </p>
                      <div class="star_background">
                <span class="star">
              ★★★★★
              <span>★★★★★</span>
              <input type="range" name="rb_rating" oninput="drawStar(this)" value="${Board.rb_rating}" step="1" min="0"
                     max="10">
            </span>
                      </div>
                    </div>
                  </div>
                  <div class="wrap1_bot">
                    <textarea>${Board.rb_contents}</textarea>
                  </div>
                </div>
                <div class="wrap2">
                  <div id="map" style="width:80%;height:80%;"></div>
                </div>
              </div>
              <div class="wrap_2">
                <div class="wrap_btn">
                  <button type="submit">게시물 수정</button>
                  <input onclick="href='/postDelete.do?rb_id=${Board.rb_id}'" value="게시물 삭제">
                </div>
              </div>
            </div>
          </form>
        </c:forEach>
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

  <c:forEach items="${boardData }" var="Board">
  let data = "${Board.r_address}";
  let rName = "${Board.r_name}";
  </c:forEach>
  let addr = "";

  const drawStar = (target) => {
    document.querySelector(`.star span`).style.width = (+target.value * 10) + `%`;
  }
</script>

</body>
</html>

