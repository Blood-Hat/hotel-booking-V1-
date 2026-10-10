<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %><%@ page import="com.hotelbooking.util.Database" %><%@ page import="com.hotelbooking.util.Html" %>
<%
String context = request.getContextPath(); String username = (String) session.getAttribute("username");
if (username == null) { response.sendRedirect("register.jsp"); return; }
int bookingId; try { bookingId = Integer.parseInt(request.getParameter("id")); } catch (Exception e) { response.sendRedirect("bookings.jsp"); return; }
try (Connection connection = Database.open(); PreparedStatement statement = connection.prepareStatement("SELECT * FROM ohbroombook WHERE roombookid=? AND username=?")) {
statement.setInt(1, bookingId); statement.setString(2, username); try (ResultSet booking = statement.executeQuery()) { if (!booking.next()) { response.sendError(404); return; }
%>
<!DOCTYPE html><html><head><meta charset="UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1"><title>Booking confirmed | Let's Go</title><link rel="stylesheet" href="<%=context%>/bootstrap/css/bootstrap.min.css"><link rel="stylesheet" href="<%=context%>/themes/css/app.css"></head><body>
<header class="app-header"><div class="app-shell"><a class="app-brand" href="<%=context%>/index.jsp">Let's Go</a></div></header><main class="app-main"><div class="app-shell"><div class="app-card"><div class="app-alert success">Your booking is confirmed.</div>
<h2>Booking #<%=bookingId%></h2><p><strong><%=Html.escape(booking.getString("nameofhotel"))%></strong>, <%=Html.escape(booking.getString("placeofhotel"))%></p>
<p><%=Html.escape(booking.getString("typeofroom"))%> room &middot; <%=booking.getInt("nosroom")%> room(s) &middot; <%=booking.getInt("nonight")%> night(s)</p>
<p><%=Html.escape(booking.getString("checkin"))%> to <%=Html.escape(booking.getString("checkout"))%></p><p>Total: &#8377;<strong><%=String.format("%.2f", booking.getDouble("totalamountpay"))%></strong></p>
<a class="app-button" href="<%=context%>/bookings.jsp">View my bookings</a> <a class="app-button secondary" href="<%=context%>/place.jsp">Browse hotels</a></div></div></main></body></html>
<% } } catch (SQLException exception) { application.log("Unable to load booking", exception); response.sendError(500); } %>
