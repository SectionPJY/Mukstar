<%--
  Created by IntelliJ IDEA.
  User: jms
  Date: 2023-05-25
  Time: 오전 1:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>myPage</title>
  <link href="resources/css/user/userInfo_pw.css" rel="stylesheet">
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
<div class="wrapper2">
  <form class="pw_box" action="/pwCheck" method="post">
    <div class="profile">
      <p>프로필</p>
    </div>
    <div class="pw_input">
      <p>비밀번호</p>
      <input type="password" name="u_pw">
    </div>
    <div class="btn">
      <input type="submit" value="확인">
    </div>
  </form>
</div>
</body>
<footer>
  <%@ include file="footer.jsp" %>
</footer>
</html>
