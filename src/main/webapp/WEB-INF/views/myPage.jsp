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
    <title>myPage</title>
    <link href="resources/css/myPage.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <%@ include file="header2.jsp" %>
</head>
<body>
<div class="wrapper">
    <div class="img-area">
        <div class="inner-area">
            <img src="resources/assets/fox.jpg"/>
        </div>
    </div>
    <div class="social-icons">
        <a href="#" class="facebook"><img src="facebook.png"/></a>
        <a href="#" class="instagram"><img src="insta.jpg"/></a>
        <a href="#" class="github"><img src="github.png"/></a>
        <a href="#" class="blog"><img src="naver.png"/></a>
    </div>
    <div class="buttons">
        <button style="background-color: #03B3FF; color: white">글관리</button>
        <button style="background-color: #FFA800; color: white; margin-top: 15px;">회원정보</button>
        <button style="background-color: #FF5757; color: white; margin-top: 15px    ">구독정보</button>
    </div>
</div>
<div class="post-area">
        <div class="post">
            <div class="post-imgarea">
                <div class="inner-area2">
                    <img src="resources/assets/fox.jpg"/>
                </div>
                <div class="title-area">
                    <p>Title - Title</p>
                </div>
                <div class="text-area">
                    <p>테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트
                        테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트</p>
                </div>
            </div>
            <div class="opacity"></div>
        </div>
    <div class="post">
        <div class="post-imgarea">
            <div class="inner-area2">
                <img src="resources/assets/fox.jpg"/>
            </div>
            <div class="title-area">
                <p>Title - Title</p>
            </div>
            <div class="text-area">
                <p>테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트
                    테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트</p>
            </div>
        </div>
        <div class="opacity"></div>
    </div>
</div>
<script type="text/javascript">
    const post = document.querySelectorAll(".post");

    function handleClick(event) {
        if (event.target.classList.contains("click")){
            event.target.classList.remove("click");
        }else{
            // 클릭한 div만 "click"클래스 추가
            event.target.classList.add("click");
        }
    }

    post.forEach((e) => e.addEventListener("click", handleClick));
</script>
</body>
<footer>
    <%@ include file="footer.jsp" %>
</footer>
</html>
