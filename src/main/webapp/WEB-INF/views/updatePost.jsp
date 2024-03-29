<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>UserPage</title>
  <link href="resources/css/updatePost.css" rel="stylesheet">
  <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
  <script type="text/javascript"
          src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a081dfe4a9800cc7ae0a46ef02263d69&libraries=services"></script>
  <%@ include file="user/header.jsp" %>
</head>
<body>
<div class="wrap">
  <div class="container">
      <form method="post" action="/pUpdate">
        <input type="hidden" name="rb_id" value="${boardData.rb_id}">
        <input type="hidden" name="r_address" value="">
        <div class="writepost">
          <div class="top">
            <div class="name">
              <p id="u_nickname">${u_nickname}</p>
            </div>
            <div class="title">
              <input type="text" id="rb_sub" name="rb_sub" value="${boardData.rb_sub}">
            </div>
            <div class="star_background">
                <%--<fieldset>
                  <input type="radio" name="reviewStar" value="5" id="rate1"><label
                  for="rate1">★</label>
                  <input type="radio" name="reviewStar" value="4" id="rate2"><label
                  for="rate2">★</label>
                  <input type="radio" name="reviewStar" value="3" id="rate3"><label
                  for="rate3">★</label>
                  <input type="radio" name="reviewStar" value="2" id="rate4"><label
                  for="rate4">★</label>
                  <input type="radio" name="reviewStar" value="1" id="rate5"><label
                  for="rate5">★</label>
                </fieldset>--%>
              <div class="star">
                ★★★★★
                <span>★★★★★</span>
                <input type="range" name="rb_rating" oninput="drawStar(this)" value="${boardData.rb_rating}" step="1"
                       min="0" max="10">
              </div>
            </div>
          </div>
          <div class="writearea">
                    <textarea id='rb_contents' name="rb_contents" placeholder="내용을 입력하세요.(3000자 이내)."
                              rows="10" cols="10" wrap="hard">${boardData.rb_contents}</textarea>
            <div class="map_area">
              <input type="text" id="r_name" name="r_name" value="${boardData.r_name}">
              <div id="map" style="width:450px;height:383px;border-radius: 0px 0px 15px 0px;"></div>
            </div>
          </div>
          <div class="post_btn">
            <button type="submit">수정하기</button>
          </div>
        </div>
      </form>
  </div>
</div>
<%@ include file="user/footer.jsp" %>
</body>
<script type="module" src="/resources/JS/user/map.js"></script>
<script>
  window.onload = function () {
    const val = document.getElementsByName('rb_rating')[0].value
    console.log(val);
    document.querySelector('.star span').style.width = (val * 10) + '%';
  }

  var data = "${boardData.r_address}";
  var addr = "";


  const drawStar = (target) => {
    document.querySelector(`.star span`).style.width = (+target.value * 10) + `%`;
  }
</script>
</html>
