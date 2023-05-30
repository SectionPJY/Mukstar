<%--
  Created by IntelliJ IDEA.
  User: jms
  Date: 5/30/23
  Time: 9:20 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>유저찾기</title>
  <link href="resources/css/userFind.css" rel="stylesheet">
</head>
<body>
<%@ include file="header2.jsp" %>
<div id="wrap">
  <div class="container">
    <div class="user_search">
      <p>유저명</p>
      <input type="text">
      <button type="submit">검색</button>
    </div>
    <div class="user_list">
      <div class="user_info">
        <span>닉네임</span>
        <div class="social-icons">
          <img src="resources/assets/인증마크.png"/></a>
          <img src="resources/assets/뱃지.png"/></a>
          <img src="resources/assets/왕관.png"/></a>
          <img src="resources/assets/먹깨비.png"/></a>
        </div>
        <span>글 개수</span>
        <span style="margin-left: 100px">구독자수</span>
      </div>
    </div>
    <div class="user_list">
      <div class="user_info">
        <span>닉네임</span>
        <div class="social-icons">
          <img src="resources/assets/인증마크.png"/></a>
          <img src="resources/assets/뱃지.png"/></a>
          <img src="resources/assets/왕관.png"/></a>
          <img src="resources/assets/먹깨비.png"/></a>
        </div>
        <span>글 개수</span>
        <span style="margin-left: 100px">구독자수</span>
      </div>
    </div>
  </div>
</div>
</body>
<footer>
  <%@ include file="footer.jsp" %>
</footer>
</html>
