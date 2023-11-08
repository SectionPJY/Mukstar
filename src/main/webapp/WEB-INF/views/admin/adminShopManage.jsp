<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <title>가게 관리</title>
  <!-- Custom fonts for this template-->
  <link href="resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link
    href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
    rel="stylesheet">
  <!-- Custom styles for this template-->
  <link href="resources/css/admin/sb-admin-2.min.css" rel="stylesheet">
  <link href="resources/css/admin/adminShopManage.css" rel="stylesheet">
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
          <div class="row">
            <%--검색 창--%>
            <div id="search_area">
              <select name="type">
                <option selected value="">검색 내용 선택</option>
                <option value="name">가게명</option>
                <option value="area">지역별</option>
              </select>
              <input type="text" id="search_bar" value=""/>
              <input type="submit" id="sub" value="검색"/>
            </div>
            <%--테이블--%>
            <div class="card-body">
              <div class="card-body">
                <div class="container">
                  <table class="table table-bordered table-hover" id="dataTable4">
                    <thead>
                    <tr>
                      <th>가게ID</th>
                      <th>가게명</th>
                      <th>주소</th>
                      <th>인증여부</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%--추후 onclick 추가해서 페이지 이동--%>
                    <tr>
                      <td>김이름</td>
                      <td>시구레 우이</td>
                      <td>010-1111-1111</td>
                      <td>생존</td>
                    </tr>
                    <tr>
                      <td>박이름</td>
                      <td>쭐어</td>
                      <td>010-2222-2222</td>
                      <td>생존</td>
                    </tr>
                    <tr>
                      <td>이이름</td>
                      <td>길달</td>
                      <td>010-3333-3333</td>
                      <td>실종</td>
                    </tr>
                    <tr>
                      <td>유이름</td>
                      <td>고모리</td>
                      <td>010-4444-4444</td>
                      <td>사망</td>
                    </tr>
                    </tbody>
                  </table>
                </div>
              </div>
              <div class="but">
                <input type="submit" value="가게 추가"/>
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

<!-- Logout Modal-->
<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">×</span>
        </button>
      </div>
      <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
      <div class="modal-footer">
        <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
        <a class="btn btn-primary" href="login.html">Logout</a>
      </div>
    </div>
  </div>
</div>

<!-- Bootstrap core JavaScript-->
<script src="resources/vendor/jquery/jquery.min.js"></script>
<script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="resources/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="resources/JS/admin/sb-admin-2.min.js"></script>

<!-- Page level plugins -->

<!-- Page level custom scripts -->

</body>

</html>

