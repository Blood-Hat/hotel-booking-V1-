<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String bookingId = request.getParameter("roombookid");
if (bookingId != null && bookingId.matches("\\d+")) {
    response.sendRedirect("booking-success.jsp?id=" + bookingId);
} else {
    response.sendRedirect("bookings.jsp");
}
%>
