<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.hotelbooking.util.Database" %>
<%
request.setCharacterEncoding("UTF-8");
if (!"POST".equalsIgnoreCase(request.getMethod())) {
    response.sendRedirect("register.jsp");
    return;
}

String email = request.getParameter("email");
String password = request.getParameter("password");
String sql = "SELECT username, emailid FROM ohbusers WHERE LOWER(emailid)=LOWER(?) AND password=?";

try (Connection connection = Database.open();
     PreparedStatement statement = connection.prepareStatement(sql)) {
    statement.setString(1, email == null ? "" : email.trim());
    statement.setString(2, password == null ? "" : password);
    try (ResultSet result = statement.executeQuery()) {
        if (result.next()) {
            session.setAttribute("username", result.getString("username"));
            session.setAttribute("email", result.getString("emailid"));
            response.sendRedirect("index.jsp");
            return;
        }
    }
} catch (SQLException exception) {
    application.log("Customer login failed", exception);
    response.sendRedirect("register.jsp?error=database");
    return;
}

response.sendRedirect("register.jsp?error=invalid");
%>
