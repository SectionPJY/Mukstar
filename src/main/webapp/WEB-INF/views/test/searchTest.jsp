<%--
  Created by IntelliJ IDEA.
  User: sectionsmacbookair
  Date: 11/7/23
  Time: 10:48 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Search Test Page</title>
</head>
<body>
    <h3>유저 검색결과</h3>
    <c:choose>
        <c:when test="${not empty userData }">
            <table>
                <thead>
                <tr>
                    <th>ID</th>
                    <th>닉네임</th>
                    <th>연락처</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${userData }" var="User">
                    <c:choose>
                        <c:when test="${User.u_id == u_id }"></c:when>
                        <c:otherwise>
                            <tr>
                                <td>${User.u_id }</td>
                                <td>${User.u_nickname }</td>
                                <td>${User.u_phone }</td>
                            </tr>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
                </tbody>
            </table>
        </c:when>
        <c:otherwise>
            <h2>유저 검색결과 없음</h2>
        </c:otherwise>
    </c:choose>

    <br><br>

    <h3>가게 검색결과</h3>
    <c:choose>
        <c:when test="${not empty resData }">
            <table>
                <thead>
                <tr>
                    <td>가게명</td>
                    <td>주소</td>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${resData }" var="Res">
                    <tr>
                        <td>${Res.r_name }</td>
                        <td>${Res.r_address }</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </c:when>
        <c:otherwise>
            <h2>가게 검색결과 없음</h2>
        </c:otherwise>
    </c:choose>

    <br><br>

    <h3>게시글 검색결과</h3>
    <c:choose>
        <c:when test="${not empty boardData }">
            <table>
                <thead>
                <tr>
                    <td>게시글 번호</td>
                    <td>제목</td>
                    <td>작성자</td>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${boardData }" var="Board">
                    <tr>
                        <td>${Board.rb_id }</td>
                        <td>${Board.rb_sub }</td>
                        <td>${Board.rb_uid }</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </c:when>
        <c:otherwise>
            <h2>게시글 검색결과 없음</h2>
        </c:otherwise>
    </c:choose>

    <br><br>

    <h3>댓글 검색결과</h3>
    <c:choose>
        <c:when test="${not empty replyData }">
            <table>
                <thead>
                <tr>
                    <td>댓글내용</td>
                    <td>작성자</td>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${replyData }" var="Reply">
                    <tr>
                        <td>${Reply.r_contents }</td>
                        <td>${Reply.r_uid }</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </c:when>
        <c:otherwise>
            <h2>댓글 검색결과 없음</h2>
        </c:otherwise>
    </c:choose>
</body>
</html>
