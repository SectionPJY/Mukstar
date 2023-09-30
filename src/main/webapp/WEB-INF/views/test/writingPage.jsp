<%--
  Created by IntelliJ IDEA.
  User: sectionsmacbookair
  Date: 9/30/23
  Time: 2:59 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>글쓰기 테스트</title>
</head>
<body>
<form action="writeTest" method="post">
    제목 : <input type="text" name="rb_sub"> <br>
    가게 이름 : <input type="text" name="r_name">
    별점 : <select name="rb_rating">
                <option value="2">한개</option>
                <option value="4">두개</option>
                <option value="6">세개</option>
                <option value="8">네개</option>
                <option value="10">다섯개</option>
            </select> <br>
    주소 : <input type="text" name="r_address"> <br>
    내용 : <textarea rows="10" cols="10" name="rb_contents"></textarea> <br>
    <input type="submit" value="작성하기">
</form>
</body>
</html>
