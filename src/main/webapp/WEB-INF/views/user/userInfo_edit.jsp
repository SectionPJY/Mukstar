<%--
  Created by IntelliJ IDEA.
  User: jms
  Date: 2023-05-25
  Time: 오후 5:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>myPage</title>
  <link href="resources/css/user/userInfo_edit.css" rel="stylesheet">
  <%@ include file="header2.jsp" %>
</head>
<body>
<div class="wrapper">
  <div class="img-area">
    <div class="inner-area">
      <img src="resources/assets/user/fox.jpg"/>
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
  <form class="profile_box" action="/userUpdate" method="post">
    <div class="profile">
      <p>프로필</p>
    </div>
    <div class="pw_input">
      <p>비밀번호</p>
      <input type="password" value="${u_pw }" id="u_pw" name="u_pw">
    </div>
    <div class="name_input">
      <p>닉네임</p>
      <input type="text" value="${u_nickname }" id="u_nickname" name="u_nickname">
    </div>
    <div class="tel_input">
      <p>전화번호</p>
      <input type="text" value="${u_phone }" id="u_phone" name="u_phone">
    </div>
      <div class="introduce">
        <p>자기 소개</p>
        <textarea></textarea>
      </div>
    <div class="btn">
      <input type="button" onclick="" value="프로필 이미지 변경">
      <input type="submit" value="비밀번호 인증">
    </div>
  </form>
</div>
</body>
<footer>
  <%@ include file="footer.jsp" %>
</footer>
</html>
