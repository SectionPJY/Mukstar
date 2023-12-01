<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>myPage</title>
    <link href="resources/css/user/myPage.css" rel="stylesheet">
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
        <button style="background-color: #03B3FF; color: white" onclick="location.href='/pManage'">글관리</button>
        <button style="background-color: #FFA800; color: white; margin-top: 15px;" onclick="location.href='/infoPW'">회원정보</button>
        <button style="background-color: #FF5757; color: white; margin-top: 15px;" onclick="location.href='/sInfo'" >구독정보</button>
    </div>
</div>
<div class="post-area">
    <c:if test="${not empty boardData}">
        <c:forEach items="${boardData}" var="Board">
            <div class="post" onclick="location.href='/pUpdatePage?rb_id=${Board.rb_id}'">
                <div class="post-imgarea">
                    <div class="inner-area2">
                        <img src="resources/assets/user/fox.jpg" alt="이미지 없음"/>
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
    </c:if>
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
