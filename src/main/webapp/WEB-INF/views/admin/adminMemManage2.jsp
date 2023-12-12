<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <title>회원관리 상세</title>
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
          <form method="post" action="adminUserUpdate">
            <div class="wrap">
              <div class="user_con">
                <div id="con_1">
                  <div class="pic_area">
                    <img src="resources/assets/userImage.jpg"/>
                  </div>
                </div>

                <div id="con_2">
                  <div>
                    <input type="text" id="u_id" name="u_id" placeholder="${User.u_id }" value="${User.u_id }"/>
                  </div>
                  <div>
                    <input type="password" id="u_pw" name="u_pw" value="${User.u_pw }"/>
                  </div>
                  <div>
                    <input type="text" id="u_phone" name="u_phone" placeholder="${User.u_phone }"
                           value="${User.u_phone }"/>
                  </div>
                  <div>
                    <input type="text" id="u_name" name="u_nickname" placeholder="${User.u_nickname }"
                           value="${User.u_nickname }"/>
                  </div>
                </div>
              </div>

              <div class="introduce">
                <hr>
                <div class="intro_text">
                  <textarea cols="80" rows="15" name="u_info">${User.u_info }</textarea>
                  <input type="submit" value="수정하기"/>
                </div>
              </div>
            </div>
          </form>
        </c:forEach>

        <hr style="border: 2px solid black; width: 96%;">
        <h2>게시글</h2>
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
            <h2 style="text-align: center">작성한 글 없음</h2>
          </c:otherwise>
        </c:choose>


        <hr style="border: 2px solid black; width: 96%;">
        <h2>댓글</h2>
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
                        <td>
                          <button type="button" onclick="fnModuleInfo1(${Reply.r_id})">${Reply.r_date }</button>
                        </td>
                      </tr>
                    </c:forEach>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </c:when>
          <c:otherwise>
            <h2 style="text-align: center">작성한 댓글 없음</h2>
          </c:otherwise>
        </c:choose>

        <hr style="border: 2px solid black; width: 96%;">
        <h2>문의 내용</h2>
        <c:choose>
          <c:when test="${not empty qnaData }">
            <form method="post" action="">
              <div class="wrap2">
                <div class="post_table">
                  <div class="container">
                    <table class="table table-bordered table-hover" id="dataTable7">
                      <thead>
                      <tr>
                        <th>문의 제목</th>
                        <th>문의 내용</th>
                        <th>시간(날짜)</th>
                        <th>답변 여부</th>
                      </tr>
                      </thead>
                      <tbody>
                      <c:forEach items="${qnaData}" var="qna">
                        <tr>
                          <td>${qna.q_sub}</td>
                          <td>${qna.q_contents}</td>
                          <td>${qna.q_date}</td>
                          <td>
                            <button type="button" onclick="fnModuleInfo(${qna.q_id})">+</button>
                          </td>
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
            <h2 style="text-align: center">문의내용 없음</h2>
          </c:otherwise>
        </c:choose>

        <hr style="border: 2px solid black; width: 96%;">
        <h2>구독한 유저</h2>
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
                          <td></td>
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
            <h2 style="text-align: center">구독한 유저 없음</h2>
          </c:otherwise>
        </c:choose>

        <hr style="border: 2px solid black; width: 96%;">
        <h2>구독자</h2>
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
                          <td></td>
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
            <h2 style="text-align: center">구독자 없음</h2>
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

<%-- 문의 내용 모달 --%>
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

  /*문의 내용 모달*/
  function fnModuleInfo(id) {
    $('#inoutmodal .modal-content').load("adminModalRespon?q_id=" + id);
    $('#inoutmodal').modal();
  }

  <%-- 댓글 수정 모달 --%>

  function fnModuleInfo1(id) {
    $('#replie .modal_content').load("adminModalReplie?r_id=" + id);
    $('#replie').modal();
  }

  function boardSelect(rb_id) {
    location.href = "/boardSelect?rb_id=" + rb_id;
  };

  function userSelect(u_id) {
    location.href = "/userSelect?u_id=" + u_id;
  };
</script>

</html>

