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
      <div class="detail_top">
        <div class="user_profile">
          <div class="img_area">
            <img src="resources/assets/user/fox.jpg"/>
          </div>
        </div>
        <div class="list">
          <c:forEach items="${boardData }" var="Board">
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
      <div class="replies_area">
        <form method="post" action="">
          <div class="replie">
            <label>댓글 달기</label>
            <textarea placeholder="댓글 쓰기"></textarea>
            <input type="submit" value="작성하기">
          </div>
        </form>
        <form method="post" action="">
          <div class="comment">
            <label>닉네임</label>
            <textarea readonly>댓글 내용 들어갈곳</textarea>
            <a href="">수정</a>
            <a href="">삭제</a>
          </div>
        </form>
        </c:forEach>
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
  var data = "${Board.r_address}";
  var rName = "${Board.r_name}";
  </c:forEach>

  const drawStar = (target) => {
    document.querySelector(`.star span`).style.width = (+target.value * 10) + `%`;
  }
</script>
</html>
