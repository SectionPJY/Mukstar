<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>전체 찾기</title>
  <link href="resources/css/user/findPost.css" rel="stylesheet">
</head>
<body>
<%@ include file="header2.jsp" %>
<div id="wrap">
  <div class="container">
    <form class="user_search" method="post" action="/SearchAll">
      <p>검색</p>
      <input type="text" id="searchWord" name="searchBox">
      <button type="submit">검색</button>
    </form>
    <h1>유저</h1>
    <div class="user_list">
      <div class="user_info">
        <span>닉네임</span>
        <div class="social-icons">
          <img src="resources/assets/user/인증마크.png"/>
          <img src="resources/assets/user/뱃지.png"/>
          <img src="resources/assets/user/왕관.png"/>
          <img src="resources/assets/user/먹깨비.png"/>
        </div>
        <span>글 개수</span>
        <span style="margin-left: 100px">구독자수</span>
      </div>
    </div>
    <c:if test="${not empty userData}">
      <c:forEach items="${userData}" var="User">
        <div class="user_list">
          <div class="user_info" onclick="location.href='/userPage?uid=${User.u_id}'">
            <span>${User.u_nickname}</span>
            <div class="social-icons">
              <img src="resources/assets/user/인증마크.png"/></a>
              <img src="resources/assets/user/뱃지.png"/></a>
              <img src="resources/assets/user/왕관.png"/></a>
              <img src="resources/assets/user/먹깨비.png"/></a>
            </div>
            <span>${User.rb_count}</span>
            <span style="margin-left: 100px">구독자수</span>
          </div>
        </div>
      </c:forEach>
    </c:if>
    <h1>게시물</h1>
    <div class="user_list">
      <div class="user_info">
        <span class="tit">제목</span>
        <span class="grade">평점</span>
        <span class="view">조회수</span>
      </div>
    </div>
    <c:if test="${not empty postData}">
      <c:forEach items="${postData}" var="Post">
        <div class="user_list">
          <div class="user_info" onclick="location.href='/pSelect?rb_id=${Post.rb_id}'">
            <span class="tit">${Post.rb_sub}</span>
            <span class="grade">${Post.rb_rating}</span>
            <span class="view">${Post.rb_view}</span>
          </div>
        </div>
      </c:forEach>
    </c:if>
  </div>
</div>
</body>
<footer>
  <%@ include file="footer.jsp" %>
</footer>
</html>
