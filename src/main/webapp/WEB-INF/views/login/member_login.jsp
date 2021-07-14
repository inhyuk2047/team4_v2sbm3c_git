<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*" %>

<%
session.setAttribute("id", "User1");
session.setAttribute("passwd", "1234");
session.setAttribute("grade", "M"); // A: Admin, M: Member, G: Guest

response.sendRedirect("/index.do");
%>
