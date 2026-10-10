<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %><%@ page import="com.hotelbooking.util.Database" %>
<%
request.setCharacterEncoding("UTF-8");
String context = request.getContextPath(); String messageState = null;
if ("POST".equalsIgnoreCase(request.getMethod())) {
    String name = request.getParameter("name"), email = request.getParameter("email"), message = request.getParameter("message");
    if (name != null && !name.trim().isEmpty() && email != null && !email.trim().isEmpty() && message != null && !message.trim().isEmpty()) {
        try (Connection connection = Database.open(); PreparedStatement statement = connection.prepareStatement("INSERT INTO ohbblog(name,emailid,message) VALUES(?,?,?)")) {
            statement.setString(1, name.trim()); statement.setString(2, email.trim()); statement.setString(3, message.trim()); statement.executeUpdate(); messageState = "success";
        } catch (SQLException exception) { application.log("Contact message failed", exception); messageState = "error"; }
    } else messageState = "error";
}
%>
<!DOCTYPE html><html><head><meta charset="UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1"><title>Contact | Let's Go</title><link rel="stylesheet" href="<%=context%>/bootstrap/css/bootstrap.min.css"><link rel="stylesheet" href="<%=context%>/themes/css/app.css"></head><body>
<header class="app-header"><div class="app-shell"><a class="app-brand" href="<%=context%>/index.jsp">Let's Go</a><nav class="app-nav"><a href="<%=context%>/place.jsp">Hotels</a><a href="<%=context%>/aboutus.jsp">About</a><a href="<%=context%>/blog.jsp">Blog</a></nav></div></header>
<main class="app-main"><div class="app-shell"><section class="app-card"><h2>Contact us</h2><p>Tell us how we can help with your stay.</p>
<% if ("success".equals(messageState)) { %><div class="app-alert success">Thank you. Your message has been received.</div><% } else if ("error".equals(messageState)) { %><div class="app-alert error">Please complete all fields and try again.</div><% } %>
<form class="app-form" method="post"><label for="name">Name</label><input id="name" name="name" required><label for="email">Email</label><input id="email" name="email" type="email" required><label for="message">Message</label><textarea id="message" name="message" rows="5" required></textarea><br><button class="app-button" type="submit">Send message</button></form>
</section></div></main></body></html>
