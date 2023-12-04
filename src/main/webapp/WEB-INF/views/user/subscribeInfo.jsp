<%--
  Created by IntelliJ IDEA.
  User: jms
  Date: 2023-05-23
  Time: 오후 11:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>subscribeInfo</title>
  <link href="resources/css/user/subscribeInfo.css" rel="stylesheet">
  <%@ include file="header2.jsp" %>
</head>
<body>
<div class="wrapper">
  <div class="img-area">
    <div class="inner-area">
      <img src="resources/assets/userImage.jpg"/>
    </div>
  </div>
  <div class="buttons">
    <button style="background-color: #03B3FF; color: white" onclick="location.href='/pManage'">글관리</button>
    <button style="background-color: #FFA800; color: white; margin-top: 15px;" onclick="location.href='/infoPW'">회원정보
    </button>
    <button style="background-color: #FF5757; color: white; margin-top: 15px;" onclick="location.href='/sInfo'">구독정보
    </button>
  </div>
</div>
<div class="post-area">
  <c:forEach items="${channelList }" var="Channel">
    <div class="post">
      <div class="post-imgarea">
        <div class="inner-area2">
          <img src="resources/assets/userImage.jpg"/>
        </div>
      </div>
      <div class="username">
        <p>${Channel.u_nickname}</p>
      </div>
      <div class="text-area">
        <p></p>
      </div>
      <div class="post-btn">
        <button style="background-color: #03B3FF; color: white"
                onclick="location.href='/userPage?uid=${Channel.s_channel}'">글보기
        </button>
        <button style="background-color: #FF5757; color: white; margin-top: 15px;">구독취소</button>
      </div>
    </div>
  </c:forEach>
</div>
<footer>
  <%@ include file="footer.jsp" %>
</footer>
</body>
</html>
