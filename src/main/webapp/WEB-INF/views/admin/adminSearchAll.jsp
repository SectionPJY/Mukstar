<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <title>전체 검색</title>
  <!-- Custom fonts for this template-->
  <link href="resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link
    href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
    rel="stylesheet">
  <!-- Custom styles for this template-->
  <link href="resources/css/admin/sb-admin-2.min.css" rel="stylesheet">
  <link href="resources/css/admin/adminSearchAll.css" rel="stylesheet">
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
        <h2>유저 검색결과</h2>
  <c:choose>
    <c:when test="${not empty userData }">
        <form method="post" action="">
          <div class="wrap2">
            <div class="post_table">
              <div class="container">
                <table class="table table-bordered table-hover" id="dataTable5">
                  <thead>
                  <tr>
                    <th>ID</th>
                    <th>닉네임</th>
                    <th>연락처</th>
                  </tr>
                  </thead>
                  <tbody>
      <c:forEach items="${userData }" var="User">
        <c:choose>
          <c:when test="${User.u_id == u_id }"></c:when>
          <c:otherwise>
            <tr>
              <td>${User.u_id }</td>
              <td>${User.u_nickname }</td>
              <td>${User.u_phone }</td>
            </tr>
          </c:otherwise>
        </c:choose>
      </c:forEach>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </form>
    </c:when>
    <c:otherwise>
      <h2 style="text-align : center">유저 검색결과 없음</h2>
    </c:otherwise>
  </c:choose>

        <hr style="border: 2px solid black; width: 96%;">

        <h2>가게 검색결과</h2>
  <c:choose>
    <c:when test="${not empty resData }">
        <form method="post" action="">
          <div class="wrap2">
            <div class="post_table">
              <div class="container">
                <table class="table table-bordered table-hover" id="dataTable6">
                  <thead>
                  <tr>
      <td>가게명</td>
      <td>주소</td>
                  </tr>
                  </thead>
                  <tbody>
      <c:forEach items="${resData }" var="Res">
        <tr>
          <td>${Res.r_name }</td>
          <td>${Res.r_address }</td>
        </tr>
      </c:forEach>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </form>
    </c:when>
    <c:otherwise>
      <h2 style="text-align : center">가게 검색결과 없음</h2>
    </c:otherwise>
  </c:choose>

        <hr style="border: 2px solid black; width: 96%;">

        <h2>게시글 검색결과</h2>
<c:choose>
  <c:when test="${not empty boardData }">
        <form method="post" action="">
          <div class="wrap2">
            <div class="post_table">
              <div class="container">
                <table class="table table-bordered table-hover" id="dataTable7">
                  <thead>
                  <tr>
                    <th>게시글 번호</th>
                    <th>제목</th>
                    <th>작성자</th>
                  </tr>
                  </thead>
                  <tbody>
                  <c:forEach items="${boardData }" var="Board">
                    <tr>
                      <td>${Board.rb_id }</td>
                      <td>${Board.rb_sub }</td>
                      <td>${Board.rb_uid }</td>
                    </tr>
                  </c:forEach>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </form>
  </c:when>
  <c:otherwise>
    <h2 style="text-align : center" >게시글 검색결과 없음</h2>
  </c:otherwise>
</c:choose>

        <hr style="border: 2px solid black; width: 96%;">

        <h2>댓글 검색 결과</h2>
<c:choose>
  <c:when test="${not empty replyData }">
        <form method="post" action="">
          <div class="wrap2">
            <div class="post_table">
              <div class="container">
                <table class="table table-bordered table-hover" id="dataTable8">
                  <thead>
                  <tr>
                    <td>댓글내용</td>
                    <td>작성자</td>
                  </tr>
                  </thead>
                  <tbody>
                  <c:forEach items="${replyData }" var="Reply">
                    <tr>
                      <td>${Reply.r_contents }</td>
                      <td>${Reply.r_uid }</td>
                    </tr>
                  </c:forEach>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </form>
  </c:when>
  <c:otherwise>
    <h2 style="text-align : center">댓글 검색결과 없음</h2>
  </c:otherwise>
</c:choose>
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

<%-- 회원 응대 모달 --%>
<div class="modal fade" id="inoutmodal" role="dialog" tabindex="-1" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
    </div>
  </div>
</div>

<%-- 작성 일시 모달 --%>
<div class="wirte_modal" id="replie" role="dialog" tabindex="-1" aria-hidden="true">
  <div class="modal_content">
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
<script>

</script>

</html>

