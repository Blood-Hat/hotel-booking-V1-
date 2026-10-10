<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.hotelbooking.util.Database" %>
<%@ page import="com.hotelbooking.util.Html" %>
<%
String context = request.getContextPath();
int hotelId;
try { hotelId = Integer.parseInt(request.getParameter("id")); }
catch (Exception exception) { response.sendRedirect("place.jsp"); return; }

String sql = "SELECT * FROM ohbhotels WHERE id=?";
try (Connection connection = Database.open(); PreparedStatement statement = connection.prepareStatement(sql)) {
    statement.setInt(1, hotelId);
    try (ResultSet hotel = statement.executeQuery()) {
        if (!hotel.next()) { response.sendError(404); return; }
%>
<!DOCTYPE html><html lang="en"><head><meta charset="UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1">
<title><%=Html.escape(hotel.getString("name"))%> | Let's Go</title>
<link rel="stylesheet" href="<%=context%>/bootstrap/css/bootstrap.min.css"><link rel="stylesheet" href="<%=context%>/themes/css/app.css"></head><body>
<header class="app-header"><div class="app-shell"><a class="app-brand" href="<%=context%>/index.jsp">Let's Go</a><nav class="app-nav"><a href="<%=context%>/place.jsp">Hotels</a><a href="<%=context%>/bookings.jsp">My Bookings</a><a href="<%=context%>/register.jsp">Login</a></nav></div></header>
<main class="app-main"><div class="app-shell"><article class="app-card">
<img src="<%=context%>/<%=Html.escape(hotel.getString("image"))%>" alt=""><h2><%=Html.escape(hotel.getString("name"))%></h2>
<p class="muted"><%=Html.escape(hotel.getString("place"))%> &middot; <%=Html.escape(hotel.getString("type"))%></p><p><%=Html.escape(hotel.getString("about"))%></p></article>
<section class="app-card"><h3>Book your room</h3>
<% if (session.getAttribute("username") == null) { %>
<div class="app-alert error">Please <a href="<%=context%>/register.jsp">log in or register</a> before booking.</div>
<% } else { %>
<form class="app-form" action="<%=context%>/bookroom.jsp" method="post"><input type="hidden" name="hotelId" value="<%=hotelId%>">
<label for="roomType">Room type</label><select id="roomType" name="roomType" required>
<option value="Single"><%=Html.escape(hotel.getString("typeofroom1"))%> - &#8377;<%=String.format("%.0f", hotel.getDouble("posingleroom"))%>/night</option>
<option value="Double"><%=Html.escape(hotel.getString("typeofroom2"))%> - &#8377;<%=String.format("%.0f", hotel.getDouble("podoubleroom"))%>/night</option>
<option value="Deluxe"><%=Html.escape(hotel.getString("typeofroom3"))%> - &#8377;<%=String.format("%.0f", hotel.getDouble("podeluxeroom"))%>/night</option></select>
<label for="checkin">Check-in</label><input id="checkin" type="date" name="checkin" required>
<label for="checkout">Check-out</label><input id="checkout" type="date" name="checkout" required>
<label for="rooms">Number of rooms</label><input id="rooms" type="number" name="rooms" min="1" max="5" value="1" required>
<label for="guests">Number of guests</label><input id="guests" type="number" name="guests" min="1" max="12" value="1" required>
<label for="guestNames">Guest names</label><textarea id="guestNames" name="guestNames" rows="3" required></textarea><br>
<button class="app-button" type="submit">Confirm booking</button></form>
<% } %></section></div></main></body></html>
<%
    }
} catch (SQLException exception) {
    application.log("Unable to load hotel", exception);
    response.sendError(500);
}
%>
