<%--
  Created by IntelliJ IDEA.
  User: jms
  Date: 2023-06-01
  Time: 오후 4:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>고객센터</title>
    <link href="resources/css/user/cs.css" rel="stylesheet">
    <%@ include file="header.jsp" %>
</head>
<body>
<div class="wrap">
    <div class="container">
        <form action="qnaInsert" method="post">
            <div class="writepost">
                <div class="top">
                    <div class="user_id">
                        <p>${u_id }</p>
                    </div>
                    <div class="title">
                        <input type="text" name="q_sub">
                    </div>
                </div>
                <div class="writearea">
                    <textarea id='note_contents' placeholder="내용을 입력하세요."
                              rows="10" cols="10" wrap="hard" name="q_contents"></textarea>
                </div>
                <div class="post_btn">
                    <button type="submit">질문하기</button>
                </div>
            </div>
        </form>
    </div>
</div>
<%@ include file="footer.jsp" %>
</body>
</html>
