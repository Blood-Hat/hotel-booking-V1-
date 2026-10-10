<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Show Hotel</title>
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
    String query="SELECT id,region,place,name,about,type,totalrooms,typeofroom1,typeofroom2,typeofroom3,noofsingleroom,noofdoubleroom,noofdeluxeroom,posingleroom,podoubleroom,podeluxeroom,image FROM ohbhotels";
    PreparedStatement ps=conn.prepareStatement(query);
    rs=ps.executeQuery(query);
%>
<table bgcolor="#CCCCCC" align="center">
	 <tr>
	    <th>ID of Hotel</th>
		<th width="30px">Domestic/ <br>International Hotel</th>
		<th>Place of Hotel</th>
		<th>Name of the Hotel</th>
		<th width="230px">About the Hotel</th>
		<th>Type of Hotel</th>
		<th>Total no.of rooms in the Hotel</th>
		<th width="70px">Type of rooms in the Hotel</th>
		<th>No.of Single rooms</th>
		<th>No.of Double rooms</th>
		<th>No.of Deluxe rooms</th>
		<th>Price(in Rs)of each Single room</th>
		<th>Price(in Rs)of each Double room</th>
		<th>Price(in Rs)of each Deluxe room</th>
		<th>Photo of the Hotel</th>
		<th></th>
	</tr>
	<%
	   while(rs.next()==true)
	   {
	%>
	   <tr>
	      <td align="center"><%=rs.getInt("id")%></td>	
		  <td align="center" width="30px"><%=rs.getString("region")%></td>
		  <td align="center"><%=rs.getString("place")%></td>
		  <td align="center"><%=rs.getString("name")%></td>
		  <td width="230px"><%=rs.getString("about")%></td>
		  <td align="center"><%=rs.getString("type")%></td>
		  <td align="center"><%=rs.getInt("totalrooms")%></td>
		  <td width="70px">
		  <%
			String single=rs.getString("typeofroom1");
		  	if(single!=null)
		  	{
		  %>
		  		<input type="checkbox" name="Single" checked="checked">Single
		  <%		
		  	}
		  	else
		  	{
		  %>
		  		<input type="checkbox" name="Single">Single
		  <%		
		  	}
		  %>
		  <%
			String double1=rs.getString("typeofroom2");
		  	if(double1!=null)
		  	{
		  %>
		  		<input type="checkbox" name="Double" checked="checked">Double
		  <%		
		  	}
		  	else
		  	{
		  %>
		  		<input type="checkbox" name="Double">Double
		  <%		
		  	}
		  %>
		  <%
			String deluxe=rs.getString("typeofroom3");
		  	if(deluxe!=null)
		  	{
		  %>
		  		<input type="checkbox" name="Deluxe" checked="checked">Deluxe
		  <%		
		  	}
		  	else
		  	{
		  %>
		  		<input type="checkbox" name="Deluxe">Deluxe
		  <%		
		  	}
		  %></td>
		  <td align="center"><%=rs.getInt("noofsingleroom")%></td>
		  <td align="center"><%=rs.getInt("noofdoubleroom")%></td>
		  <td align="center"><%=rs.getInt("noofdeluxeroom")%></td>
		  <td align="center"><%=rs.getDouble("posingleroom")%></td>
		  <td align="center"><%=rs.getDouble("podoubleroom")%></td>
		  <td align="center"><%=rs.getDouble("podeluxeroom")%></td>
		  <td align="center">
		  	<%
		  		String pathImage=rs.getString("image");
		  		pathImage=pathImage.substring(pathImage.lastIndexOf("\\")+1);
		  		out.print(pathImage);
		  	%>
		  	<img src=<%=pathImage%> width="200" height="250">
		  </td>
          <td>
		  	<form action="update.jsp" method="post" name="">
          		<input type="hidden" name="hidid" value=<%=rs.getInt("id")%>>
          		<input type="submit" name="edit" value="Edit" >
          	</form>
          	<br>
          	<form action="deletehoteldb.jsp" method="post" name="">
          		<input type="hidden" name="hidid1" value=<%=rs.getInt("id")%>>
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
       <input type="submit" value="Add more Hotels">
    </form>
</body>
</html>

