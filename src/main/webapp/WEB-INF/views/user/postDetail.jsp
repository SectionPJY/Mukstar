<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>postDetail</title>
  <link href="resources/css/user/postDetail.css" rel="stylesheet">
  <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
  <script type="module" src="resources/JS/user/map.js"></script>
  <script type="text/javascript"
          src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a081dfe4a9800cc7ae0a46ef02263d69&libraries=services"></script>
  <%@ include file="header.jsp" %>
</head>
<body>
<div class="wrap">
  <div class="container">
    <div class="post_detail">
      <c:forEach items="${boardData }" var="Board">
      <div class="detail_top">
        <div class="user_profile">
          <div class="img_area">
            <img src="resources/assets/user/fox.jpg" onclick="location.href='/userPage?uid=${Board.rb_uid}'"/>
          </div>
        </div>
        <div class="list">
          <div class="post_title">
            <p>${Board.rb_sub }</p>
            <div class="star_background">
                <span class="star">
              ★★★★★
              <span>★★★★★</span>
              <input type="range" name="rb_rating" oninput="drawStar(this)" value="${Board.rb_rating}" step="1" min="0" max="10">
            </span>
            </div>
          </div>
          <div class="post_date">
            <p>${Board.rb_date }</p>
            <p>${Board.rb_view }</p>
          </div>
        </div>
      </div>
      <div class="post_area">
        <p class="content">${Board.rb_contents}</p>
        <div class="post">
          <div id="map" style="width:450px;height:400px;"></div>
        </div>
      </div>
      </c:forEach>

      <div class="replies_area">
        <form method="post" action="">
          <div class="replie">
            <label>댓글 달기</label>
            <textarea placeholder="댓글 쓰기"></textarea>
            <input type="submit" value="작성하기">
          </div>
        </form>

        <c:choose>
          <c:when test="${u_id != null }">
<%--            <form method="post" action="">--%>
              <form action="replyInsert">
              <div class="replie">
                <label>댓글 달기</label>
                <textarea placeholder="댓글 쓰기" name="r_contents"></textarea>
                <input type="submit" value="작성하기">
              </div>
            </form>
          </c:when>
          <c:otherwise>
            <form method="post" action="">
              <div class="replie">
                <label>댓글 달기</label>
                <textarea placeholder="로그인 후에 이용해주세요."></textarea>
                <input type="submit" value="작성하기" disabled>
              </div>
            </form>
          </c:otherwise>
        </c:choose>

        <c:choose>
          <c:when test="${not empty replyData }">
            <c:forEach items="${replyData }" var="Reply">
              <form method="post" action="">
                <div class="comment">
                  <label>${Reply.r_uid }</label>
                  <textarea readonly>${Reply.r_contents }</textarea>
                  <c:choose>
                    <c:when test="${Reply.r_uid == u_id}">
                      <a onclick="deleteReply('${Reply.r_id }')">삭제</a>
                    </c:when>
                  </c:choose>
                </div>
              </form>
            </c:forEach>
          </c:when>
          <c:otherwise>
            <h2>댓글 없음</h2>
          </c:otherwise>
        </c:choose>

      </div>

    </div>
  </div>
</div>
<%@ include file="footer.jsp" %>
</body>
<script>
  window.onload = function (){
    const val = document.getElementsByName('rb_rating')[0].value
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

  function deleteReply(r_id) {
    console.log(r_id);
    const url = "/replyDelete?r_id=" + r_id;

    location.href = url;
  }
</script>
</html>
