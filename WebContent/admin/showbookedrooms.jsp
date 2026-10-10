<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Show all booked rooms</title>
<style>
table 
{
    border-collapse: collapse;
    width: 100%;
}

th, td 
{
    padding: 4px;
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
    String query="SELECT * FROM ohbroombook";
    PreparedStatement ps=conn.prepareStatement(query);
    rs=ps.executeQuery(query);
%>
<table bgcolor="#CCCCCC" align="center">
	 <tr>
	    <th>ID of Hotel</th>
		<th>Name of Hotel</th>
		<th>Place of Hotel</th>
		<th>Type of room</th>
		<th>Price of room/Night</th>
		<th>Username</th>
		<th>Email Id</th>
		<th>No.of rooms booked</th>
		<th>No.of Guests</th>
		<th width="50px">Name of <br>all Guests</th>
		<th>Check-In Date</th>
		<th>Check-Out Date</th>
		<th>No of Nights</th>
		<th>Total amount to be paid</th>
		<th>Image of the Hotel</th>
		<th>Room book Id</th>
		<th></th>
	</tr>
	<%
	   while(rs.next()==true)
	   {
	%>
	   <tr>
	      <td align="center"><%=rs.getInt("idofhotel")%></td>	
		  <td align="center"><%=rs.getString("nameofhotel")%></td>
		  <td align="center"><%=rs.getString("placeofhotel")%></td>
		  <td align="center"><%=rs.getString("typeofroom")%></td>
		  <td align="center"><%=rs.getDouble("priceofroom")%></td>
		  <td align="center"><%=rs.getString("username")%></td>
		  <td align="center" width="50px"><%=rs.getString("emailid")%></td>
		  <td align="center"><%=rs.getInt("nosroom")%></td>
		  <td align="center"><%=rs.getInt("noguest")%></td>
		  <td align="center" width="50px"><%=rs.getString("nameofguest")%></td>
		  <td align="center" width="80px"><%=rs.getString("checkin")%></td>
		  <td align="center" width="80px"><%=rs.getString("checkout")%></td>
		  <td align="center"><%=rs.getInt("nonight")%></td>
		  <td align="center"><%=rs.getDouble("totalamountpay")%></td>
		  <td align="center">
		  	<%
		  		String pathImage=rs.getString("imageofhotel");
		  		pathImage=pathImage.substring(pathImage.lastIndexOf("\\")+1);
		  		out.print(pathImage);
		  	%>
		  	<img src=<%=pathImage%> width="140" height="140">
		  </td>
		  <td align="center"><%=rs.getInt("roombookid")%></td>
          <td>
		  	<form action="updatebookedroom.jsp" method="post" name="">
          		<input type="hidden" name="rbid" value=<%=rs.getInt("roombookid")%>>
          		<input type="submit" name="edit" value="Edit" >
          	</form>
          	<br>
          	<form action="deletebookedroom.jsp" method="post" name="">
          		<input type="hidden" name="rbid1" value=<%=rs.getInt("roombookid")%>>
          		<input type="submit" name="delete" value="Delete" >
          	</form>
          </td>
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
    <br>
    <form action="adminsuccess.jsp" method="post" name="">
       <input type="submit" value="Go to Home Page">
    </form>
</body>
</html>

