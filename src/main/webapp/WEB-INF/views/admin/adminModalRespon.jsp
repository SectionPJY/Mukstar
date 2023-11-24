<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<c:set var=""/>--%>
<%-- 회원 응대 모달 --%>
<div class="modal_header">
  <div class="head 1">
    <div class="head_con">닉네임_응대내용</div>
    <div class="head_con">알림 설정(날짜)</div>
  </div>
  <div class="head 2">
    <div class="head_con">전화번호</div>
    <div class="head_con">날짜</div>
  </div>
  <div class="head 3">
    <div class="head_con">
      <select>
        <option value="">응대 유형</option>
        <option value="tel">전화</option>
        <option value="msg">메세지</option>
      </select>
    </div>
    <div class="head_con">in / out</div>
  </div>
</div>
<div class="modal-body" style="margin: 0 auto">
  <textarea cols="80" rows="15"></textarea>
</div>
<div class="modal-footer">
  <button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
  <input type="submit" value="작성 완료"/>
</div>
