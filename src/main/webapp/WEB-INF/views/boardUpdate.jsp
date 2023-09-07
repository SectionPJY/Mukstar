<%--
  Created by IntelliJ IDEA.
  User: sectionsmacbookair
  Date: 2023/05/30
  Time: 10:00 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Board Update Page</title>
</head>
<body>
<c:forEach items="${boardData }" var="Board">
    <form action="boardUpdate" method="post">
        게시글 번호 : <input type="text" style="border: 0" id="r_id" name="r_id" value="${Board.r_id }"> <br>
        작성자 : <input type="text" style="border: 0" id="r_uid" name="r_uid" value="${u_id }"> <br>
        제목 : <input type="text" id="r_sub" name="r_sub" maxlength="50" value="${Board.r_sub }"> <br>
        가게명 : <input type="text" id="r_name" name="r_name" value="${Board.r_name}">
        주소 : <input type="text" id="r_address" name="r_address" value="${Board.r_address }">
        별점 : <select id="r_rating" name="r_rating">
        <option>----- 선택하세요 -----</option>
        <option value="1">별점 반개</option>
        <option value="2">별점 한개</option>
        <option value="3">별점 하나반개</option>
        <option value="4">별점 두개</option>
        <option value="5">별점 둘반개</option>
        <option value="6">별점 세개</option>
        <option value="7">별점 셋반개</option>
        <option value="8">별점 네개</option>
        <option value="9">별점 냇반개</option>
        <option value="10">별점 다섯개</option>
    </select>
        <br>
        내용 <br>
        <textarea id="r_contents" name="r_contents" placeholder="후기를 작성해주세요."
                  maxlength="1000" rows="20" cols="50">${Board.r_contents }</textarea> <br>
        <input type="submit" value="수정하기"> <input type="button" onclick="returnPage('${Board.r_id }')" value="돌아가기">
    </form>
</c:forEach>
<script>
    function returnPage(r_id) {
        window.location.href = "http://localhost:8080/boardSelect?r_id=" + r_id;
    };
</script>
</body>
</html>
