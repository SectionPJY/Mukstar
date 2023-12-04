<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <title>회계관리</title>
  <!-- Custom fonts for this template-->
  <link href="resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link
    href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
    rel="stylesheet">
  <!-- Custom styles for this template-->
  <link href="resources/css/admin/sb-admin-2.min.css" rel="stylesheet">
  <link href="resources/css/admin/adminIndex.css" rel="stylesheet">
  <link href="resources/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
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

        <div class="row">

          <!-- Area Chart -->
          <div class="col-xl-8 col-lg-7">
            <div class="card shadow mb-4">
              <!-- Card Header - Dropdown -->
              <%-- 주간 실적 영역 --%>
              <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">[주간실적]</h6>
              </div>
              <!-- Card Body -->
              <div class="card-body">
                <div class="chart-area">
                  <canvas id="myBarChart"></canvas>
                </div>
              </div>
            </div>
          </div>

          <div class="col-xl-4 col-lg-5">
            <div class="card shadow mb-4">
              <%-- 최근 게시글 영역 --%>
              <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">최근 게시글</h6>
              </div>
              <!-- PostList Body -->
              <div class="card-body">
                <form method="post" action="">
                  <div class="card-body">
                    <div class="container">
                      <table class="table table-bordered table-hover" id="dataTable1">
                        <thead>
                        <tr>
                          <th>작성자</th>
                          <th>제목</th>
                          <th>작성일</th>
                        </tr>
                        </thead>
                        <c:forEach items="${boardList }" var="Board">
                          <tbody>
                          <tr onclick="location.href = '/boardSelect?rb_id=${Board.rb_id }'">
                            <td>${Board.rb_uid }</td>
                            <td>${Board.rb_sub }</td>
                            <td>${Board.rb_date }</td>
                          </tr>
                          </tbody>
                        </c:forEach>
                      </table>
                    </div>
                  </div>
                </form>
              </div>
            </div>
          </div>
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

  <!-- Bootstrap core JavaScript-->
  <script src="resources/vendor/jquery/jquery.min.js"></script>
  <script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="resources/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="resources/JS/admin/sb-admin-2.min.js"></script>

</body>

</html>

