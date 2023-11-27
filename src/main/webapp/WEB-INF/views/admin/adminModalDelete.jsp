<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var=""/>
<%-- 회원 삭제 모달 --%>
<div class="modal-dialog" role="document" style="transform: translate(40%, 50%)">
  <div class="modal-content" style="width: 40% !important;">
    <div class="modal-body" style="margin: 0 auto;">
      <p>귀하는 본사의 커뮤니티 가이드라인을 위반하여 계정이 영구 정치 처리되어 이 계정은 사용이 불가능 합니다.</p>
    </div>
    <div class="modal-footer">
      <button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
      <input type="submit" value="삭제하기"/>
    </div>
  </div>
</div>
