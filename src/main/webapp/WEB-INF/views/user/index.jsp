<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>메인 페이지</title>
  <link href="resources/css/user/index.css" rel="stylesheet">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <%@ include file="header.jsp" %>
</head>
<body>
<div class="wrap"> <!-- 배너표시영역 -->
  <div class="rolling-list"> <!-- 원본배너 -->
    <ul>
        <c:forEach items="${boardList }" var="Board">
            <li onclick="location.href='/pSelect?rb_id=${Board.rb_id}'">
                        <div class="image-wrap"><img src="./img/img_banner1.svg" alt="${Board.rb_id}"></div>
                        <div class="desc">
                            <strong>${Board.rb_sub}</strong>
                            <span>${Board.rb_contents}</span>
                        </div>
            </li>
        </c:forEach>
    </ul>
  </div>
</div>
</body>
<script>
  // 롤링 배너 복제본 생성
  let roller = document.querySelector('.rolling-list');
  roller.id = 'roller1'; // 아이디 부여

  let clone = roller.cloneNode(false)
  // cloneNode : 노드 복제. 기본값은 false. 자식 노드까지 복제를 원하면 true 사용
  clone.id = 'roller2';
  document.querySelector('.wrap').appendChild(clone); // wrap 하위 자식으로 부착

  document.querySelector('#roller1').style.left = '0px';
  document.querySelector('#roller2').style.left = document.querySelector('.rolling-list ul').offsetWidth + 'px';
  // offsetWidth : 요소의 크기 확인(margin을 제외한 padding값, border값까지 계산한 값)

  roller.classList.add('original');
  clone.classList.add('clone');
</script>
<footer>
    <%@ include file="footer.jsp" %>
</footer>
</html>
