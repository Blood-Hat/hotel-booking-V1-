<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %><%@ page import="com.hotelbooking.util.Database" %><%@ page import="com.hotelbooking.util.Html" %>
<%
String context = request.getContextPath(); String username = (String) session.getAttribute("username");
if (username == null) { response.sendRedirect("register.jsp?error=login-required"); return; }
%>
<!DOCTYPE html><html><head><meta charset="UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1"><title>My bookings | Let's Go</title><link rel="stylesheet" href="<%=context%>/bootstrap/css/bootstrap.min.css"><link rel="stylesheet" href="<%=context%>/themes/css/app.css"></head><body>
<header class="app-header"><div class="app-shell"><a class="app-brand" href="<%=context%>/index.jsp">Let's Go</a><nav class="app-nav"><a href="<%=context%>/place.jsp">Hotels</a><a href="<%=context%>/logout.jsp">Logout</a></nav></div></header>
<main class="app-main"><div class="app-shell"><h2>My bookings</h2><table class="app-table"><thead><tr><th>Booking</th><th>Hotel</th><th>Room</th><th>Dates</th><th>Total</th></tr></thead><tbody>
<%
boolean found = false;
try (Connection connection = Database.open(); PreparedStatement statement = connection.prepareStatement("SELECT * FROM ohbroombook WHERE username=? ORDER BY roombookid DESC")) {
statement.setString(1, username); try (ResultSet booking = statement.executeQuery()) { while (booking.next()) { found = true;
%><tr><td>#<%=booking.getInt("roombookid")%></td><td><%=Html.escape(booking.getString("nameofhotel"))%><br><span class="muted"><%=Html.escape(booking.getString("placeofhotel"))%></span></td><td><%=Html.escape(booking.getString("typeofroom"))%> &times; <%=booking.getInt("nosroom")%></td><td><%=Html.escape(booking.getString("checkin"))%><br>to <%=Html.escape(booking.getString("checkout"))%></td><td>&#8377;<%=String.format("%.2f", booking.getDouble("totalamountpay"))%></td></tr><%
} } } catch (SQLException exception) { application.log("Unable to load bookings", exception); %><tr><td colspan="5">Bookings are temporarily unavailable.</td></tr><% }
if (!found) { %><tr><td colspan="5">You have no bookings yet. <a href="<%=context%>/place.jsp">Browse hotels</a>.</td></tr><% } %>
</tbody></table></div></main></body></html>
