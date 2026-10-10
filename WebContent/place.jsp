<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.hotelbooking.util.Database" %>
<%@ page import="com.hotelbooking.util.Html" %>
<%
String context = request.getContextPath();
String place = request.getParameter("place");
String type = request.getParameter("type");
boolean filterByPlace = place != null && !place.trim().isEmpty();
boolean filterByType = type != null && !type.trim().isEmpty();
String heading = filterByPlace ? "Stays in " + place : (filterByType ? type + "s" : "All stays");
String sql = "SELECT id, place, name, about, type, posingleroom, image FROM ohbhotels";
if (filterByPlace) sql += " WHERE LOWER(place)=LOWER(?)";
else if (filterByType) sql += " WHERE LOWER(type)=LOWER(?)";
sql += " ORDER BY place, name";
%>
<!DOCTYPE html>
<html lang="en"><head><meta charset="UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1">
<title><%=Html.escape(heading)%> | Let's Go</title>
<link rel="stylesheet" href="<%=context%>/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=context%>/themes/css/app.css"></head><body>
<header class="app-header"><div class="app-shell"><a class="app-brand" href="<%=context%>/index.jsp">Let's Go</a>
<nav class="app-nav"><a href="<%=context%>/index.jsp">Home</a><a href="<%=context%>/place.jsp">Hotels</a><a href="<%=context%>/place.jsp?type=Resort">Resorts</a><a href="<%=context%>/bookings.jsp">My Bookings</a><a href="<%=context%>/aboutus.jsp">About</a></nav></div></header>
<main class="app-main"><div class="app-shell"><h2><%=Html.escape(heading)%></h2>
<%
boolean found = false;
try (Connection connection = Database.open(); PreparedStatement statement = connection.prepareStatement(sql)) {
    if (filterByPlace) statement.setString(1, place.trim());
    else if (filterByType) statement.setString(1, type.trim());
    try (ResultSet result = statement.executeQuery()) {
        while (result.next()) {
            found = true;
%>
<article class="app-card">
  <img src="<%=context%>/<%=Html.escape(result.getString("image"))%>" alt="<%=Html.escape(result.getString("name"))%>">
  <h3><%=Html.escape(result.getString("name"))%></h3>
  <p class="muted"><%=Html.escape(result.getString("place"))%> &middot; <%=Html.escape(result.getString("type"))%></p>
  <p><%=Html.escape(result.getString("about"))%></p>
  <p>Rooms from &#8377;<strong><%=String.format("%.0f", result.getDouble("posingleroom"))%></strong> per night</p>
  <a class="app-button" href="<%=context%>/hotel.jsp?id=<%=result.getInt("id")%>">View and book</a>
</article>
<%
        }
    }
} catch (SQLException exception) {
    application.log("Unable to load hotels", exception);
%><div class="app-alert error">Hotel information is temporarily unavailable.</div><%
}
if (!found) {
%><div class="app-card"><h3>No stays found</h3><p>Try another destination from the Hotels page.</p><a class="app-button" href="<%=context%>/place.jsp">View all hotels</a></div><%
}
%></div></main></body></html>
