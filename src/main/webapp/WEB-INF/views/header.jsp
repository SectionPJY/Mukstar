<%--
  Created by IntelliJ IDEA.
  User: sectionsmacbookair
  Date: 2023/05/09
  Time: 9:21 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%
        if (null == session || null == session.getAttribute("u_uid")) {
            out.print(
                    "<a href='#' >Login</a><a href='signUp'>Sign Up</a>");
        } else {
                out.print(
                        "<a href='loadMyPage(" + session.getAttribute("u_id") + ")'>My Page</a>");

            out.print("<a href='signOut'>Sign Out</a>");
        }
    %>
</head>
</html>
