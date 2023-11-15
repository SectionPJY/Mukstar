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
                <button type="button" id="adopen" data-bs-toggle="modal" data-bs-target="#ad">광고 제의</button>
                <button type="button">BTB / BTC 전환</button>
                <button type="button" id="proopen" data-bs-toggle="modal" data-bs-target="">프로모션 관리</button>
              </div>
              <div class="bot_btn">
                <button type="button" id="dropopen" data-bs-toggle="modal" data-bs-target="#drop">먹스타 삭제하기</button>
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
<div class="modal fade" id="ad" role="dialog" tabindex="-1" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
  <form method="post" action="">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal_header">
          <div class="head 1">
            <div class="head_con">닉네임_응대내용</div>
            <div class="head_con">알림 설정(날짜)</div>
          </div>
          <div class="head 2">
            <div class="head_con">전화번호</div>
            <div class="head_con">날짜</div>
          </div>
          <div class="head 3">
            <div class="head_con">
              <select>
                <option value="">응대 유형</option>
                <option value="tel">전화</option>
                <option value="msg">메세지</option>
              </select>
            </div>
            <div class="head_con">in / out</div>
          </div>
        </div>
        <div class="modal-body" style="margin: 0 auto">
          <textarea cols="80" rows="15"></textarea>
        </div>
        <div class="modal-footer">
          <button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
          <input type="submit" value="작성 완료"/>
        </div>
      </div>
    </div>
  </form>
</div>

<%-- 회원 삭제 모달 --%>
<div class="modal fade" id="drop" role="dialog" tabindex="-1" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
  <form method="post" action="">
    <div class="modal-dialog" role="document" style="transform: translate(40%, 50%)">
      <div class="modal-content" style="width: 40% !important;">
        <div class="modal-body" style="margin: 0 auto;">
          <p>귀하는 본사의 커뮤니티 가이드라인을 위반하여 계정이 영구 정치 처리되어 이 계정은 사용이 불가능 합니다.</p>
        </div>
        <div class="modal-footer">
          <button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
          <input type="submit" value="삭제하기"/>
        </div>
      </div>
    </div>
  </form>
</div>

<%-- 프로모션 관리 모달 --%>
<div class="modal fade" id="promotion" role="dialog" tabindex="-1" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
  <form method="post" action="">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal_header">
          <div class="modal_title">
            <p>제목 : </p>
          </div>
        </div>
        <div class="modal-body" style="margin: 0 auto">
          <textarea cols="80" rows="15"></textarea>
        </div>
        <div class="modal-footer">
          <button class="btn btn-secondary" type="button" data-dismiss="modal">닫기</button>
        </div>
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
</html>

