<%--
  Created by IntelliJ IDEA.
  User: sectionsmacbookair
  Date: 2023/05/24
  Time: 2:39 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <title>Board Detail</title>
</head>
<body>
<c:forEach items="${boardData }" var="Board">
    제목 : ${Board.r_sub } <br>
    작성자 : ${Board.r_uid } <br>
    작성시간 : ${Board.r_date } 조회수 : ${Board.r_view } <br>
    가게명 : ${Board.r_name } <br>
    가게주소 : ${Board.r_address } <br><br>
    내용 <br>
    ${Board.r_contents }
    <br><br>
    <c:if test="${u_id == Board.r_uid }">
        <a onclick="updateBoard('${Board.r_id }')">수정</a> <a onclick="deleteBoard('${Board.r_id }')">삭제</a>
    </c:if>
</c:forEach>
<script>
    function updateBoard(r_id) {
        console.log(r_id);

        window.location.href = "http://localhost:8080/boardUpdatePage?r_id=" + r_id;
    };

    function deleteBoard(r_id) {
        console.log(r_id);

        $.ajax({
            type: "post",
            url: "http://localhost:8080/boardDelete",
            data: {
                r_id: r_id
            },
            success: function (data, status) {
                alert("삭제되었습니다.");

                window.location.href = "http://localhost:8080/testBoardList";
            },
            error: function (status) {
                alert("삭제에 실패하였습니다.");

                return false;
            }
        });
    };
</script>
</body>
</html>
