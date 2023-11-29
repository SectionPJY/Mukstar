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
    제목 : ${Board.rb_sub } <br>
    작성자 : ${Board.rb_uid } <br>
    작성시간 : ${Board.rb_date } 조회수 : ${Board.rb_view } 별점 : ${Board.rb_rating } <br>
    가게명 : ${Board.rb_name } <br>
    가게주소 : ${Board.rb_address } <br><br>
    내용 <br>
    ${Board.rb_contents }
    <br><br>
    <a href="testBoardList">돌아가기</a>
    <c:if test="${u_id == Board.rb_uid }">
        <a onclick="updateBoard('${Board.rb_id }')">수정</a> <a onclick="deleteBoard('${Board.rb_id }')">삭제</a>
    </c:if>
</c:forEach>

<hr>


</body>
<script>
    function updateBoard(rb_id) {
        console.log(rb_id);

        window.location.href = "http://localhost:8080/boardUpdatePage?rb_id=" + rb_id;
    };

    function deleteBoard(rb_id) {
        console.log(rb_id);

        $.ajax({
            type: "post",
            url: "http://localhost:8080/boardDelete",
            data: {
                rb_id: rb_id
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
</html>
