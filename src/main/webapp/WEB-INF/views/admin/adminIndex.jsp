<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <title>먹스타 - 메인페이지</title>
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
                        <tr>
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

        <!-- Content Row -->
        <div class="row">

          <!-- Content Column -->
          <div class="col-lg-6 mb-4">

            <!-- 수익 많은 사람 영역 -->
            <div class="card shadow mb-4">
              <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">수익왕</h6>
              </div>
              <div class="card-body">
                <h4 class="small font-weight-bold">테스트1 <span
                  class="float-right">20원</span></h4>
                <div class="progress mb-4">
                  <div class="progress-bar bg-danger" role="progressbar" style="width: 20%"
                       aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"></div>
                </div>
                <h4 class="small font-weight-bold">테스트2 <span
                  class="float-right">40원</span></h4>
                <div class="progress mb-4">
                  <div class="progress-bar bg-warning" role="progressbar" style="width: 40%"
                       aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"></div>
                </div>
                <h4 class="small font-weight-bold">테스트3 <span
                  class="float-right">60원</span></h4>
                <div class="progress mb-4">
                  <div class="progress-bar" role="progressbar" style="width: 60%"
                       aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"></div>
                </div>
                <h4 class="small font-weight-bold">테스트4 <span
                  class="float-right">80원</span></h4>
                <div class="progress mb-4">
                  <div class="progress-bar bg-info" role="progressbar" style="width: 80%"
                       aria-valuenow="80" aria-valuemin="0" aria-valuemax="100"></div>
                </div>
                <h4 class="small font-weight-bold">테스트5 <span
                  class="float-right">100원</span></h4>
                <div class="progress">
                  <div class="progress-bar bg-success" role="progressbar" style="width: 100%"
                       aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
                </div>

              </div>
            </div>

          </div>

          <div class="col-lg-6 mb-4">

            <!-- 최근 문의 영역 -->
            <div class="card shadow mb-4">
              <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">최근 문의</h6>
              </div>
              <div class="card-body">
                <form method="post" action="">
                  <div class="card-body">
                    <div class="container">
                      <table class="table table-bordered table-hover" id="dataTable2">
                        <thead>
                        <tr>
                          <th>작성자</th>
                          <th>제목</th>
                          <th>답변여부</th>
                        </tr>
                        </thead>
                        <c:forEach items="${qnaList }" var="QnA">
                        <tbody>
                        <tr>
                          <td>${QnA.q_uid }</td>
                          <td>${QnA.q_sub }</td>
                          <td>
                            <c:choose>
                              <c:when test="${QnA.q_answer == true}">
                                답변완료
                              </c:when>
                              <c:otherwise>
                                <a href="#">답변하기</a>
                              </c:otherwise>
                            </c:choose>
                          </td>
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
<script src="resources/vendor/chart.js/Chart.min.js"></script>

<!-- Page level custom scripts -->
<script src="resources/JS/admin/demo/chart-bar-demo.js"></script>

</body>

</html>

