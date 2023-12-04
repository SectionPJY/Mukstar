<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>유저찾기</title>
  <link href="resources/css/user/userFind.css" rel="stylesheet">
</head>
<body>
<%@ include file="header2.jsp" %>
<div id="wrap">
  <div class="container">
    <form class="user_search" method="post" action="/userSearch">
      <p>유저명</p>
      <input type="text" id="searchWord" name="searchBox">
      <button type="submit">검색</button>
    </form>
    <div class="user_list">
      <div class="user_info">
        <span>닉네임</span>
        <span>글 개수</span>
        <span>구독자수</span>
      </div>
    </div>
    <c:if test="${not empty userData}">
      <c:forEach items="${userData}" var="User">
        <div class="user_list">
          <div class="user_info" onclick="location.href='/userPage?uid=${User.u_id}'"
               style="background-color: #FFC336 !important">
            <span>${User.u_nickname}</span>
            <span>${User.rb_count}</span>
            <span>구독자수</span>
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
