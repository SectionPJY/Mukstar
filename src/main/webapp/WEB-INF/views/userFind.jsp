<%--
  Created by IntelliJ IDEA.
  User: jms
  Date: 5/30/23
  Time: 9:20 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>유저찾기</title>
  <link href="resources/css/userFind.css" rel="stylesheet">
</head>
<body>
<%@ include file="header2.jsp" %>
<div id="wrap">
  <div class="container">
    <form class="user_search" method="post" action="/userSearch">
      <p>유저명</p>
      <input type="text" id="searchWord" name="searchWord">
      <button type="submit">검색</button>
    </form>
    <div class="user_list">
      <c:if test="${not empty userData}">
        <c:forEach items="${userData}" var="User">
          <div class="user_info">
            <span>${User.u_nickname}</span>
            <div class="social-icons">
              <img src="resources/assets/인증마크.png"/></a>
              <img src="resources/assets/뱃지.png"/></a>
              <img src="resources/assets/왕관.png"/></a>
              <img src="resources/assets/먹깨비.png"/></a>
            </div>
            <span>${User.r_count}</span>
            <span style="margin-left: 100px">구독자수</span>
          </div>
        </c:forEach>
      </c:if>
<%--      <div class="user_info">--%>
<%--        <span>닉네임</span>--%>
<%--        <div class="social-icons">--%>
<%--          <img src="resources/assets/인증마크.png"/></a>--%>
<%--          <img src="resources/assets/뱃지.png"/></a>--%>
<%--          <img src="resources/assets/왕관.png"/></a>--%>
<%--          <img src="resources/assets/먹깨비.png"/></a>--%>
<%--        </div>--%>
<%--        <span>글 개수</span>--%>
<%--        <span style="margin-left: 100px">구독자수</span>--%>
<%--      </div>--%>
    </div>
  </div>
</div>
</body>
<footer>
  <%@ include file="footer.jsp" %>
</footer>
</html>
