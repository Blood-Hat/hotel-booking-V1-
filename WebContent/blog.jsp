<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% String context = request.getContextPath(); %>
<!DOCTYPE html><html><head><meta charset="UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1"><title>Travel notes | Let's Go</title><link rel="stylesheet" href="<%=context%>/bootstrap/css/bootstrap.min.css"><link rel="stylesheet" href="<%=context%>/themes/css/app.css"></head><body>
<header class="app-header"><div class="app-shell"><a class="app-brand" href="<%=context%>/index.jsp">Let's Go</a><nav class="app-nav"><a href="<%=context%>/place.jsp">Hotels</a><a href="<%=context%>/place.jsp?type=Resort">Resorts</a><a href="<%=context%>/contact.jsp">Contact</a></nav></div></header>
<main class="app-main"><div class="app-shell"><h2>Travel notes</h2>
<article class="app-card"><h3>Plan a relaxed city break</h3><p>Choose a hotel close to the places you want to visit, then leave some open time in your schedule. A short, flexible plan often makes a better holiday than a crowded checklist.</p></article>
<article class="app-card"><h3>Before you book</h3><p>Check room capacity, arrival dates, and the full price for your stay. Our booking screen shows the nightly rate and calculates the total before confirmation.</p></article>
<article class="app-card"><h3>Discover stays across India</h3><p>Browse heritage hotels, city stays, and quiet resorts in our featured destinations.</p><a class="app-button" href="<%=context%>/place.jsp">Explore hotels</a></article>
</div></main></body></html>
