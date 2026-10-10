<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.hotelbooking.util.Database" %>
<%
request.setCharacterEncoding("UTF-8");
if (!"POST".equalsIgnoreCase(request.getMethod())) {
    response.sendRedirect("register.jsp");
    return;
}

String username = request.getParameter("username");
String email = request.getParameter("email");
String password = request.getParameter("password");
if (username == null || username.trim().length() < 2 || email == null || email.trim().isEmpty()
        || password == null || password.length() < 4) {
    response.sendRedirect("register.jsp?error=registration");
    return;
}

String sql = "INSERT INTO ohbusers(username,emailid,password) VALUES(?,?,?)";
try (Connection connection = Database.open(); PreparedStatement statement = connection.prepareStatement(sql)) {
    statement.setString(1, username.trim());
    statement.setString(2, email.trim());
    statement.setString(3, password);
    statement.executeUpdate();
    session.setAttribute("username", username.trim());
    session.setAttribute("email", email.trim());
    response.sendRedirect("index.jsp?registered=true");
} catch (SQLException exception) {
    application.log("Registration failed", exception);
    response.sendRedirect("register.jsp?error=duplicate");
}
%>
