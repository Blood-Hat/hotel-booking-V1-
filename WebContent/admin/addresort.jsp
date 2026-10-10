<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
if (session.getAttribute("userid2") == null) {
    response.sendRedirect("adminlogin.jsp");
} else {
    response.sendRedirect("addhotel1.jsp");
}
%>
