<%--
  Created by IntelliJ IDEA.
  User: jms
  Date: 2023-05-25
  Time: 오후 5:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <div class="social-icons">
        <a href="#" class="badge1"><img src="resources/assets/user/인증마크.png"/></a>
        <a href="#" class="badge2"><img src="resources/assets/user/뱃지.png"/></a>
        <a href="#" class="badge3"><img src="resources/assets/user/왕관.png"/></a>
        <a href="#" class="badge4"><img src="resources/assets/user/먹깨비.png"/></a>
    </div>
    <div class="buttons">
        <button style="background-color: #03B3FF; color: white">글관리</button>
        <button style="background-color: #FFA800; color: white; margin-top: 15px;">회원정보</button>
        <button style="background-color: #FF5757; color: white; margin-top: 15px    ">탈퇴하기</button>
    </div>
</div>
<div class="wrapper2">
    <div class="profile_box">
        <div class="profile">
            <p>프로필</p>
        </div>
        <div class="pw_input">
            <p>비밀번호</p>
            <input type="password" name="pw">
        </div>
        <div class="name_input">
            <p>닉네임</p>
            <input type="text" name="nickname">
        </div>
        <div class="tel_input">
            <p>전화번호</p>
            <input type="text" name="tel">
        </div>
        <div class="pay_input">
            <p>결제정보</p>
            <input type="text" name="pay">
        </div>
        <div class="btn">
            <input type="button" value="전화번호 인증">
            <input type="button" value="비밀번호 인증">
        </div>
    </div>
</div>
</body>
<footer>
    <%@ include file="footer.jsp" %>
</footer>
</html>
