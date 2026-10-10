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
    int hid=Integer.parseInt(request.getParameter("hidid"));
    String query="SELECT id,region,place,name,about,type,totalrooms,typeofroom1,typeofroom2,typeofroom3,noofsingleroom,noofdoubleroom,noofdeluxeroom,posingleroom,podoubleroom,podeluxeroom,image FROM ohbhotels WHERE id='"+hid+"' ";
    PreparedStatement ps=conn.prepareStatement(query);
    rs=ps.executeQuery(query);
%>
<form action="updatedb.jsp" method="post">
<table bgcolor="#CCCCCC" align="center">
<tr>
	<th bgcolor="#eeeeee" align="center" colspan="2">All details of the Hotel</th>
</tr>
<%
   while(rs.next()==true)
   {
%>
<tr>
    <td>ID of the Hotel :</td>
    <td><%=rs.getInt("id")%></td>
    <input type="hidden" name="hidid" value=<%=rs.getInt("id")%>>
    </tr>
    <tr>
       <td>Domestic/International Hotel :</td>
       <td><input type="text" name="region" value="<%=rs.getString("region")%>"></td>
    </tr>
       
    <tr>
        <td>Place of Hotel :</td>
        <td><input type="text" name="place" value="<%=rs.getString("place")%>"></td>
    </tr>
      
    <tr>
        <td>Name of the Hotel :</td>
        <td><input type="text" name="name" value="<%=rs.getString("name")%>"></td>
    </tr>
    <tr>
        <td>About the Hotel :</td>
        <td><input type="text" name="about" value="<%=rs.getString("about")%>"></td>
    </tr>
    <tr>
        <td>Type of Hotel :</td>
        <td><input type="text" name="type" value="<%=rs.getString("type")%>"></td>
    </tr>
    <tr>
        <td>Total no of rooms in the Hotel : </td>
        <td><input type="text" name="noofrooms" value="<%=rs.getInt("totalrooms")%>"></td>
    </tr>
    <tr>
        <td>Type of rooms in the Hotel :</td>
        <td>
        	<%
			String single=rs.getString("typeofroom1");
		  	if(single!=null)
		  	{
		  %>
		  		<input type="checkbox" name="id1" checked="checked" value="Single">Single
		  <%		
		  	}
		  	else
		  	{
		  %>
		  		<input type="checkbox" name="id1" value="Single">Single
		  <%		
		  	}
		  %>
		  <%
			String double1=rs.getString("typeofroom2");
		  	if(double1!=null)
		  	{
		  %>
		  		<input type="checkbox" name="id2" checked="checked" value="Double">Double
		  <%		
		  	}
		  	else
		  	{
		  %>
		  		<input type="checkbox" name="id2" value="Double">Double
		  <%		
		  	}
		  %>
		  <%
			String deluxe=rs.getString("typeofroom3");
		  	if(deluxe!=null)
		  	{
		  %>
		  		<input type="checkbox" name="id3" checked="checked" value="Deluxe">Deluxe
		  <%		
		  	}
		  	else
		  	{
		  %>
		  		<input type="checkbox" name="id3" value="Deluxe">Deluxe
		  <%		
		  	}
		  %>
        
        </td>
        <!-- <td><input type="text" name="id1" value="<%//=rs.getString("typeofroom1")%>"><inpuT type="text" name="id2" value="<%//=rs.getString("typeofroom2")%>"><inpuT type="text" name="id3" value="<%//=rs.getString("typeofroom3")%>"></td>-->
    </tr>
    <tr>
        <td>Number of Single rooms :</td>
        <td><input type="text" name="nosinglerm" value="<%=rs.getInt("noofsingleroom")%>"></td>
    </tr>
    <tr>
        <td>Number of Double rooms :</td>
        <td><input type="text" name="nodoublerm" value="<%=rs.getInt("noofdoubleroom")%>"></td>
    </tr>
    <tr>
        <td>Number of Deluxe rooms :</td>
        <td><input type="text" name="nodeluxerm" value="<%=rs.getInt("noofdeluxeroom")%>"></td>
    </tr>
    <tr>
        <td>Price(in Rupees)of each Single room :</td>
        <td><input type="text" name="posinglerm" value="<%=rs.getDouble("posingleroom")%>"></td>
    </tr>
    <tr>
        <td>Price(in Rupees)of each Double room :</td>
        <td><input type="text" name="podoublerm" value="<%=rs.getDouble("podoubleroom")%>"></td>
    </tr>
    <tr>
        <td>Price(in Rupees)of each Deluxe room :</td>
        <td><input type="text" name="podeluxerm" value="<%=rs.getDouble("podeluxeroom")%>"></td>
    </tr>
     <tr>
        <td>Photos of the Hotel :</td>
        <td><input type="text" name="imagepath" value="<%=rs.getString("image")%>"></td>
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
