<%--
  Created by IntelliJ IDEA.
  User: jms
  Date: 2023-05-31
  Time: 오전 12:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>UserPage</title>
    <link href="resources/css/writePost.css" rel="stylesheet">
    <%@ include file="header.jsp" %>
</head>
<body>
<div class="wrap">
    <div class="container">
        <form method="post" action="/pWrite">
            <div class="writepost">
                <div class="top">
                    <div class="name">
                        <p id="r_uid">${u_id}</p>
                    </div>
                    <div class="title">
                        <input type="text" id="r_sub" name="r_sub">
                    </div>
                </div>
                <div class="writearea">
                    <textarea id='r_contents' placeholder="내용을 입력하세요.(3000자 이내)."
                              rows="10" cols="10" wrap="hard"></textarea>
                </div>
                <div class="post_btn">
                    <button type="submit">작성하기</button>
                </div>
            </div>
        </form>
    </div>
</div>
<%@ include file="footer.jsp" %>
</body>
</html>
