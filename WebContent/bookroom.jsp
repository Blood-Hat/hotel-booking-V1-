<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.temporal.ChronoUnit" %>
<%@ page import="com.hotelbooking.util.Database" %>
<%
request.setCharacterEncoding("UTF-8");
String username = (String) session.getAttribute("username");
if (username == null) { response.sendRedirect("register.jsp?error=login-required"); return; }
if (!"POST".equalsIgnoreCase(request.getMethod())) { response.sendRedirect("place.jsp"); return; }

try {
    int hotelId = Integer.parseInt(request.getParameter("hotelId"));
    int rooms = Integer.parseInt(request.getParameter("rooms"));
    int guests = Integer.parseInt(request.getParameter("guests"));
    String roomType = request.getParameter("roomType");
    String guestNames = request.getParameter("guestNames");
    LocalDate checkin = LocalDate.parse(request.getParameter("checkin"));
    LocalDate checkout = LocalDate.parse(request.getParameter("checkout"));
    long nights = ChronoUnit.DAYS.between(checkin, checkout);
    if (nights < 1 || checkin.isBefore(LocalDate.now()) || rooms < 1 || rooms > 5 || guests < 1 || guests > 12) {
        response.sendRedirect("hotel.jsp?id=" + hotelId + "&error=dates"); return;
    }

    try (Connection connection = Database.open()) {
        connection.setAutoCommit(false);
        String hotelSql = "SELECT name, place, image, posingleroom, podoubleroom, podeluxeroom, noofsingleroom, noofdoubleroom, noofdeluxeroom FROM ohbhotels WHERE id=?";
        try (PreparedStatement hotelStatement = connection.prepareStatement(hotelSql)) {
            hotelStatement.setInt(1, hotelId);
            try (ResultSet hotel = hotelStatement.executeQuery()) {
                if (!hotel.next()) { response.sendError(404); return; }
                double price;
                int inventory;
                if ("Double".equals(roomType)) { price = hotel.getDouble("podoubleroom"); inventory = hotel.getInt("noofdoubleroom"); }
                else if ("Deluxe".equals(roomType)) { price = hotel.getDouble("podeluxeroom"); inventory = hotel.getInt("noofdeluxeroom"); }
                else { roomType = "Single"; price = hotel.getDouble("posingleroom"); inventory = hotel.getInt("noofsingleroom"); }

                String overlapSql = "SELECT NVL(SUM(nosroom),0) booked FROM ohbroombook WHERE idofhotel=? AND typeofroom=? AND checkin < ? AND checkout > ?";
                int alreadyBooked;
                try (PreparedStatement overlap = connection.prepareStatement(overlapSql)) {
                    overlap.setInt(1, hotelId); overlap.setString(2, roomType);
                    overlap.setString(3, checkout.toString()); overlap.setString(4, checkin.toString());
                    try (ResultSet result = overlap.executeQuery()) { result.next(); alreadyBooked = result.getInt("booked"); }
                }
                if (alreadyBooked + rooms > inventory) {
                    connection.rollback(); response.sendRedirect("hotel.jsp?id=" + hotelId + "&error=unavailable"); return;
                }

                String email = (String) session.getAttribute("email");
                if (email == null) {
                    try (PreparedStatement findUser = connection.prepareStatement("SELECT emailid FROM ohbusers WHERE username=?")) {
                        findUser.setString(1, username);
                        try (ResultSet user = findUser.executeQuery()) { if (user.next()) email = user.getString(1); }
                    }
                }
                int bookingId;
                try (Statement idStatement = connection.createStatement(); ResultSet idResult = idStatement.executeQuery("SELECT ohb_roombook_seq.NEXTVAL FROM dual")) { idResult.next(); bookingId = idResult.getInt(1); }
                String insert = "INSERT INTO ohbroombook (roombookid,idofhotel,nameofhotel,placeofhotel,imageofhotel,typeofroom,priceofroom,username,emailid,nosroom,noguest,nameofguest,checkin,checkout,nonight,totalamountpay) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
                try (PreparedStatement booking = connection.prepareStatement(insert)) {
                    booking.setInt(1, bookingId); booking.setInt(2, hotelId); booking.setString(3, hotel.getString("name"));
                    booking.setString(4, hotel.getString("place")); booking.setString(5, hotel.getString("image")); booking.setString(6, roomType);
                    booking.setDouble(7, price); booking.setString(8, username); booking.setString(9, email); booking.setInt(10, rooms);
                    booking.setInt(11, guests); booking.setString(12, guestNames); booking.setString(13, checkin.toString()); booking.setString(14, checkout.toString());
                    booking.setLong(15, nights); booking.setDouble(16, price * rooms * nights); booking.executeUpdate();
                }
                connection.commit();
                response.sendRedirect("booking-success.jsp?id=" + bookingId); return;
            }
        } catch (Exception exception) {
            connection.rollback(); throw exception;
        }
    }
} catch (Exception exception) {
    application.log("Booking failed", exception);
    response.sendRedirect("place.jsp?error=booking");
}
%>
