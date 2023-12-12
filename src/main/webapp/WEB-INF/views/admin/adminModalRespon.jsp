<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<c:set var=""/>--%>
<%-- 회원 응대 모달 --%>
<form action="/qnaAnswer">
  <div class="modal_header">
    <input type="hidden" name="q_id" value="${qnaData[0].q_id}">
    <input type="hidden" name="q_uid" value="${qnaData[0].q_uid}">
    <c:forEach items="${qnaData}" var="qna">
    <div class="head 1">
      <div class="head_con">${qna.q_uid}</div>
      <div class="head_con">${qna.q_sub}</div>
    </div>
    <div class="head 2">
      <div class="head_con">${qna.q_date}</div>
    </div>
    <div class="modal-body">
      <textarea cols="80" rows="10" name="q_ansCon">${qna.q_contents}</textarea>
      <textarea cols="80" rows="10" name="q_ansCon">${qna.q_ansCon}</textarea>
    </div>
    <div class="modal-footer">
      <button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
      <input type="submit" value="작성 완료"/>
    </div>
    </c:forEach>
</form>
