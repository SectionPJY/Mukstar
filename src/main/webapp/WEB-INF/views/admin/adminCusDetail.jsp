<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <title>고객상세</title>
  <!-- Custom fonts for this template-->
  <link href="resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link
    href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
    rel="stylesheet">
  <!-- Custom styles for this template-->
  <link href="resources/css/admin/sb-admin-2.min.css" rel="stylesheet">
  <link href="resources/css/admin/adminCusDetail.css" rel="stylesheet">
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

        <form>
          <div class="wrap">

            <div class="wrap_top">
              <div id="con_1">
                <div class="pic_area">
                  <img src="resources/assets/user/fox.jpg"/>
                </div>
                <div class="badge_area">
                  <div class="badge_list">
                    <img src="resources/assets/user/먹깨비.png"/>
                    <img src="resources/assets/user/뱃지.png"/>
                    <img src="resources/assets/user/왕관.png"/>
                    <img src="resources/assets/user/인증마크.png"/>
                  </div>
                </div>
              </div>

              <div id="con_2">
                <div>
                  <%--<label for="u_id">아이디 : </label>--%>
                  <input type="text" id="u_id" placeholder="아이디"/>
                </div>
                <div>
                  <%--<label for="u_pw">비밀번호 : </label>--%>
                  <input type="password" id="u_pw" placeholder="비밀번호"/>
                </div>
                <div>
                  <%--<label for="u_phone">핸드폰 : </label>--%>
                  <input type="text" id="u_phone" placeholder="전화번호"/>
                </div>
                <div>
                  <%--<label for="u_name">닉네임 : </label>--%>
                  <input type="text" id="u_name" placeholder="닉네임" style="width: 39%; margin-right: 10px;"/>
                  <button type="button">중복확인</button>
                </div>
              </div>
            </div>

            <div class="wrap_bot">
              <div class="bot_btn">
                <button type="button" onclick="ModalAd()">광고 제의</button>
                <button type="button">BTB / BTC 전환</button>
                <button type="button" onclick="ModalPro()">프로모션 관리</button>
              </div>
              <div class="bot_btn">
                <button type="button" onclick="ModalDelete()">먹스타 삭제하기</button>
                <button type="button">가게 제휴</button>
                <button type="button">유저 기호</button>
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
<%-- amdinModalAd.jsp --%>
<div class="modal fade" id="ad" role="dialog" tabindex="-1" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
  <form method="post" action="">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
      </div>
    </div>
  </form>
</div>

<%-- 회원 삭제 모달 --%>
<%-- amdinModalDelete.jsp --%>
<div class="modal fade" id="drop" role="dialog" tabindex="-1" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
  <div class="modal_content">
  </div>
</div>

<%-- 프로모션 관리 모달 --%>
<%-- adminModalPro.jsp --%>
<div class="modal fade" id="promotion" role="dialog" tabindex="-1" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
  <form method="post" action="">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
      </div>
    </div>
  </form>
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
  /*회원 응대 모달*/
  function ModalAd(){
    $('#ad .modal-content').load("adminModalAd");
    $('#ad').modal();
  }

  /*회원 삭제 모달*/
  function ModalDelete(){
    $('#drop .modal_content').load("adminModalDelete");
    $('#drop').modal();
  }

  /*프로모션 관리 모달*/
  function ModalPro(){
    $('#promotion .modal-content').load("adminModalPro");
    $('#promotion').modal();
  }
</script>
</html>

