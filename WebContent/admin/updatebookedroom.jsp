<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Booked Rooms</title>
<style>
table 
{
    border-collapse: collapse;
    width: 66%;
}

th, td 
{
    padding: 8px;
    border-bottom: 2px solid #ddd;
    border-left: 2px solid #ddd;
}
tr:hover 
{
	background-color:#f5f5f5;
}
</style>
</head>
<body background="addhotelbg.jpg">
<%
Connection conn;
ResultSet rs;
try
{ 	
	String driver="oracle.jdbc.driver.OracleDriver";
    Class.forName(driver);
    String url="jdbc:oracle:thin:@localhost:1521:XE";
    String userid="hotelbooking";
    String password="hotelbooking";
    conn=DriverManager.getConnection(url,userid,password);
    int rbid=Integer.parseInt(request.getParameter("rbid"));
    String query="SELECT idofhotel,nameofhotel,placeofhotel,imageofhotel,typeofroom,priceofroom,username,emailid,nosroom,noguest,nameofguest,checkin,checkout,nonight,totalamountpay,roombookid FROM ohbroombook WHERE roombookid='"+rbid+"' ";
    PreparedStatement ps=conn.prepareStatement(query);
    rs=ps.executeQuery(query);
%>
<form action="updatebookedroomdb.jsp" method="post">
<table bgcolor="#CCCCCC" align="center">
<tr>
	<th bgcolor="#eeeeee" align="center" colspan="2">All details of booked rooms</th>
</tr>
<%
   while(rs.next()==true)
   {
%>
	<tr>
    	<td>ID of the Hotel :</td>
    	<td><input type="text" name="idofhotel" value="<%=rs.getInt("idofhotel")%>"></td>
  	</tr>
  	<tr>
       	<td>Name of the Hotel :</td>
       	<td><input type="text" name="nameofhotel" value="<%=rs.getString("nameofhotel")%>"></td>
    </tr>
    <tr>
        <td>Place of Hotel :</td>
        <td><input type="text" name="placeofhotel" value="<%=rs.getString("placeofhotel")%>"></td>
   </tr>
   <tr>
        <td>Image of the Hotel :</td>
        <td><input type="text" name="imagepath" value="<%=rs.getString("imageofhotel")%>"></td>
    </tr>
    <tr>
        <td>Type of room :</td>
        <td><input type="text" name="typeofroom" value="<%=rs.getString("typeofroom")%>"></td>
    </tr>
    <tr>
        <td>Price of room :</td>
        <td><input type="text" name="priceofroom" value="<%=rs.getDouble("priceofroom")%>"></td>
    </tr>
    <tr>
        <td>Username :</td>
        <td><input type="text" name="us" value="<%=rs.getString("username")%>"></td>
    </tr>
    <tr>
        <td>Email ID : </td>
        <td><input type="text" name="ei" value="<%=rs.getString("emailid")%>"></td>
    </tr>
    <tr>
        <td>No.of rooms booked :</td>
        <td><input type="text" name="norb" value="<%=rs.getInt("nosroom")%>"></td>
    </tr>
    <tr>
        <td>No.of Guests :</td>
        <td><input type="text" name="nog" value="<%=rs.getInt("noguest")%>"></td>
    </tr>
    <tr>
        <td>Name of all Guests :</td>
        <td><input type="text" name="nameofguest" value="<%=rs.getString("nameofguest")%>"></td>
    </tr>
    <tr>
        <td>Check-In Date :</td>
        <td><input type="text" name="cid" value="<%=rs.getString("checkin")%>"></td>
    </tr>
    <tr>
        <td>Check-Out Date :</td>
        <td><input type="text" name="cod" value="<%=rs.getString("checkout")%>"></td>
    </tr>
    <tr>
        <td>Number of Nights booked :</td>
        <td><input type="text" name="non" value="<%=rs.getInt("nonight")%>"></td>
    </tr>
    <tr>
        <td>Total Amount to be paid :</td>
        <td><input type="text" name="totalamt" value="<%=rs.getDouble("totalamountpay")%>"></td>
    </tr>
    <tr>
        <td>Room Book ID :</td>
        <td><input type="text" name="roombid" value="<%=rs.getInt("roombookid")%>" readonly></td>
    </tr>
    <tr>
        <td colspan="2" align="center"><input type="submit" value="Update"></td>
    </tr>
<%
	   }
	    conn.close();
       }
	   catch(Exception e)
	   {
		   out.print(e);
	   }
%>
</table>
</form>
</body>
</html>
