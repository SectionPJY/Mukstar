<%--
  Created by IntelliJ IDEA.
  User: sectionsmacbookair
  Date: 2023/05/11
  Time: 4:10 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login Test</title>
</head>
<body>
<%
    if (null == session || null == session.getAttribute("u_id")) {
        out.print(
                "<h3>Session is Null</h3> <br>" +
                        "<a href='testLogin'>돌아가기</a>"
        );
    } else {
        out.print(
                "<h3>Session is Exists</h3> <br>" +
                        "ID : " + session.getAttribute("u_id") + "<br> <br>" +
                        "<a href='#'>정보수정 테스트</a> <br>" +
                        "<a href='#'>로그아웃</a>"
        );
    }
%>
</body>
</html>
