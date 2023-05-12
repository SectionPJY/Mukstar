<%--
  Created by IntelliJ IDEA.
  User: sectionsmacbookair
  Date: 2023/05/12
  Time: 9:33 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<script>
    const msg = "<c:out value='${msg }' />";
    const url = "<c:out value='${url }' />";

    alert(msg);
    location.href = url;
</script>