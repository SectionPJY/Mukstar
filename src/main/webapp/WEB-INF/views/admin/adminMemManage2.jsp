<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <title>회원관리상세</title>
  <!-- Custom fonts for this template-->
  <link href="resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link
    href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
    rel="stylesheet">
  <!-- Custom styles for this template-->
  <link href="resources/css/admin/sb-admin-2.min.css" rel="stylesheet">
  <link href="resources/css/admin/adminMemManage2.css" rel="stylesheet">
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
        <c:forEach items="${userData }" var="User">
        <form method="post" action="">
          <div class="wrap">
            <div class="user_con">
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
                  <input type="text" id="u_id" placeholder="${User.u_id }"/>
                </div>
                <div>
                  <input type="password" id="u_pw" value="${User.u_pw }"/>
                </div>
                <div>
                  <input type="text" id="u_phone" placeholder="${User.u_phone }"/>
                </div>
                <div>
                  <input type="text" id="u_name" placeholder="${User.u_nickname }" style="width: 39%; margin-right: 10px;"/>
                  <button type="button">고객관리</button>
                </div>
              </div>
            </div>

            <hr style="border: 2px solid black; width: 96%;">

            <div class="introduce">
              <hr>
              <div class="intro_text">
                <textarea cols="80" rows="15">${User.u_info }</textarea>
                <input type="submit" value="수정하기"/>
              </div>
            </div>

          </div>
        </form>
        </c:forEach>

        <hr style="border: 2px solid black; width: 96%;">
        <c:choose>
          <c:when test="${not empty boardData }">
                <div class="wrap2">
                  <div class="post_table">
                    <div class="container">
                      <table class="table table-bordered table-hover" id="dataTable5">
                        <thead>
                        <tr>
                          <th>게시글번호</th>
                          <th>제목</th>
                          <th>작성자</th>
                          <th>날짜</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${boardData }" var="Board">
                        <tr onclick="boardSelect(${Board.rb_id })">
                          <td>${Board.rb_id }</td>
                          <td>${Board.rb_sub }</td>
                          <td>${Board.rb_uid }</td>
                          <td>${Board.rb_date }</td>
                        </tr>
                        </c:forEach>
                        </tbody>
                      </table>
                    </div>
                  </div>
                </div>
          </c:when>
          <c:otherwise>
            <h2>작성한 글 없음</h2>
          </c:otherwise>
        </c:choose>


        <hr style="border: 2px solid black; width: 96%;">

        <c:choose>
          <c:when test="${not empty replyData }">
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
                      <c:forEach items="${replyData }" var="Reply">
                      <tr>
                        <td>${Reply.r_bid }</td>
                        <td>${Reply.r_contents }</td>
                        <td>${Reply.r_date }</td>
                      </tr>
                      </c:forEach>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
          </c:when>
          <c:otherwise>
            <h2>작성한 댓글 없음</h2>
          </c:otherwise>
        </c:choose>

        <hr style="border: 2px solid black; width: 96%;">

        <form method="post" action="">
          <div class="wrap2">
            <div class="post_table">
              <div class="container">
                <table class="table table-bordered table-hover" id="dataTable7">
                  <thead>
                  <tr>
                    <th>닉네임_응대 내용</th>
                    <th>응대유형</th>
                    <th>시간(날짜)</th>
                    <th>In / Out</th>
                  </tr>
                  </thead>
                  <tbody>
                  <tr>
                    <td>강아지_홍보</td>
                    <td>전화</td>
                    <td>2023/01/12</td>
                    <td>
                      <button type="button" onclick="fnModuleInfo()">+</button>
                    </td>
                  </tr>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </form>

        <hr style="border: 2px solid black; width: 96%;">

        <c:choose>
          <c:when test="${not empty channelData }">
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
                        <c:forEach items="${channelData }" var="Channel">
                        <tr onclick="userSelect('${Channel.s_channel }')">
                          <td>${Channel.s_channel }</td>
                          <td></td>
                          <td>${Channel.s_date }</td>
                          <td><%--차후에 버튼 추가 예정--%></td>
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
            <h2>구독한 유저 없음</h2>
          </c:otherwise>
        </c:choose>

        <hr style="border: 2px solid black; width: 96%;">

        <c:choose>
          <c:when test="${not empty subData }">
              <form method="post" action="">
                <div class="wrap2">
                  <div class="post_table">
                    <div class="container">
                      <table class="table table-bordered table-hover" id="dataTable9">
                        <thead>
                        <tr>
                          <th>구독자 명</th>
                          <th></th>
                          <th>구독 시작일</th>
                          <th></th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${subData }" var="Sub">
                        <tr onclick="userSelect('${Sub.s_subscriber }')">
                          <td>${Sub.s_subscriber }</td>
                          <td></td>
                          <td>${Sub.s_date }</td>
                          <td><%--차후에 버튼 추가 예정--%></td>
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
            <h2>구독자 없음</h2>
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
  <form>
    <div class="modal_top">
      <button class="btn btn-secondary" type="button" data-dismiss="modal">X</button>
    </div>
    <div class="modal_body">
      <textarea cols="50" rows="10"></textarea>
    </div>
    <div class="modal_bottom">
      <button type="button">수정하기</button>
      <input type="submit" value="삭제하기">
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
  /*회원 응대 모달창 js*/
  $('#btn_open').click(function (e) {
    e.preventDefault();
    $('#inoutmodal').modal("show");
  });

  /*/!*replie modal js*!/
  $('#replie_modal').click(function (e) {
    e.preventDefault();
    $('#replie').modal("show");
  });

  function boardSelect(rb_id) {
    location.href = "http://localhost:8080/boardSelect?rb_id=" + rb_id;
  };

  function userSelect(u_id) {
    location.href = "http://localhost:8080/userSelect?u_id=" + u_id;
  };
</script>

</html>

