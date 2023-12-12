<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<c:set var=""/>--%>
<%--작성 일시 모달--%>
<form>
  <div class="modal_top">
    <button class="btn btn-secondary" type="button" data-dismiss="modal">X</button>
  </div>
  <div class="modal_body">
    <textarea cols="50" rows="10">${replyData.r_contents}</textarea>
  </div>
  <div class="modal_bottom">
    <button type="button">수정하기</button>
    <input type="submit" value="삭제하기">
  </div>
</form>
