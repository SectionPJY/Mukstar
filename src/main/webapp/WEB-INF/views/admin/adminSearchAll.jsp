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
                  <tr>
                    <td>1</td>
                    <td>버튜버 입니다</td>
                    <td>시구레 우이</td>
                  </tr>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </form>

        <hr style="border: 2px solid black; width: 96%;">

        <h2>가게 검색결과</h2>
        <form method="post" action="">
          <div class="wrap2">
            <div class="post_table">
              <div class="container">
                <table class="table table-bordered table-hover" id="dataTable6">
                  <thead>
                  <tr>
                    <th>(원본)게시글번호</th>
                    <th>댓글내용</th>
                    <th>작성일시</th>
                  </tr>
                  </thead>
                  <tbody>
                  <tr>
                    <td>1</td>
                    <td>버튜버 입니다</td>
                    <td>2023/09/12</td>
                  </tr>
                  <tr>
                    <td>2</td>
                    <td>배고픕니다</td>
                    <td>2023/09/22</td>
                  </tr>
                  <tr>
                    <td>3</td>
                    <td>큐브 대결하실레요?</td>
                    <td>2023/10/01</td>
                  </tr>
                  <tr>
                    <td>4</td>
                    <td>비둘기 999</td>
                    <td>2023/09/09</td>
                  </tr>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </form>

        <hr style="border: 2px solid black; width: 96%;">

        <h2>게시글 검색결과</h2>
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
                  <tr>
                    <td>강아지_홍보</td>
                    <td>전화</td>
                    <td>2023/01/12</td>
                  </tr>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </form>

        <hr style="border: 2px solid black; width: 96%;">

        <h2>댓글 검색 결과</h2>
        <form method="post" action="">
          <div class="wrap2">
            <div class="post_table">
              <div class="container">
                <table class="table table-bordered table-hover" id="dataTable8">
                  <thead>
                  <tr>
                    <th>구독채널 명</th>
                    <th></th>
                    <th>구독 시작일</th>
                    <th></th>
                  </tr>
                  </thead>
                  <tbody>
                  <tr>
                    <td>장사의 신</td>
                    <td></td>
                    <td>2023/09/15</td>
                    <td><%--차후에 버튼 추가 예정--%></td>
                  </tr>
                  </tbody>
                </table>
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
  /*replie modal js*/
  /*$('#replie_modal').click(function (e) {
    e.preventDefault();
    console.log("active");
    $('#replie').modal("show");
  });*/

  /*회원 응대 모달*/
  function fnModuleInfo() {
    $('#inoutmodal .modal-content').load("adminModalRespon");
    $('#inoutmodal').modal();
  }

  <%-- 작성 일시 모달 --%>

  function fnModuleInfo1() {
    $('#replie .modal_content').load("adminModalReplie");
    $('#replie').modal();
  }
</script>

</html>

