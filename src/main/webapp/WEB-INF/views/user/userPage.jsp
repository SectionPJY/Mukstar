<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>유저 정보</title>
  <link href="resources/css/user/userPage.css" rel="stylesheet">
  <%@ include file="header2.jsp" %>
</head>
<body>
<div class="wrapper">
  <div class="img-area">
    <div class="inner-area">
      <img src="resources/assets/userImage.jpg"/>
    </div>
  </div>
  <span style="text-align: center; color: white; font-size: 40px; padding-bottom: 20px ">${name}</span>
  <div class="buttons">
    <c:choose>
      <c:when test="${channelData == null }">
        <%--<button style="background-color: #03B3FF; color: white" onclick="location.href=''">팔로우</button>--%>
        <button style="background-color: #FFA800; color: white; margin-top: 15px;"
                onclick="location.href='/addSub?s_channel=${boardData[0].rb_uid}'">구독하기
        </button>
      </c:when>
      <c:otherwise>
        <button style="background-color: #FFA800; color: white; margin-top: 15px;"
                onclick="location.href='/delSub?s_channel=${boardData[0].rb_uid}'">구독취소
        </button>
      </c:otherwise>
    </c:choose>
  </div>
</div>
<div class="post-area">
  <c:forEach items="${boardData}" var="Board">
    <div class="post" onclick="location.href='/pSelect?rb_id=${Board.rb_id}'">
      <div class="post-imgarea">
        <div class="inner-area2">
          <img src="resources/assets/userImage.jpg" alt="이미지 없음"/>
        </div>
        <div class="title-area">
          <p><c:out value="${Board.rb_sub}"/></p>
        </div>
        <div class="text-area">
          <p><c:out value="${Board.rb_contents}"/></p>
        </div>
      </div>
      <div class="opacity"></div>
    </div>
  </c:forEach>
</div>
</body>
<footer>
  <%@ include file="footer.jsp" %>
</footer>
</html>
