<%--
  Created by IntelliJ IDEA.
  User: sectionsmacbookair
  Date: 2023/05/25
  Time: 3:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Writing Page</title>
</head>
<body>
<form action="#" method="post">
    작성자 : <input type="text" style="border: 0" id="r_uid" name="r_uid" value="${u_id }"> <br>
    제목 : <input type="text" id="r_sub" name="r_sub" maxlength="50"> <br>
    가게명 : <input type="text" id="r_name" name="r_name"> 주소 : <input type="text" id="r_address" name="r_address"> <br>
    내용 <br>
    <textarea id="r_contents" name="r_contents" placeholder="후기를 작성해주세요." maxlength="1000" rows="20" cols="50"></textarea>
</form>
</body>
</html>
