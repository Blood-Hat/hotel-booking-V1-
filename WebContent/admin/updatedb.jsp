<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Updatedb</title>
</head>
<body>
<% 
	Connection conn;
    try
    { 	
		int id=Integer.parseInt(request.getParameter("hidid"));
		String region=request.getParameter("region");
		String place=request.getParameter("place");
		String name=request.getParameter("name");
		String about=request.getParameter("about");
		String type=request.getParameter("type");
		int noofrooms=Integer.parseInt(request.getParameter("noofrooms"));
		String id1=request.getParameter("id1");
		String id2=request.getParameter("id2");
		String id3=request.getParameter("id3");
		int nosinglerm=Integer.parseInt(request.getParameter("nosinglerm"));
		int nodoublerm=Integer.parseInt(request.getParameter("nodoublerm"));
		int nodeluxerm=Integer.parseInt(request.getParameter("nodeluxerm"));
		double posinglerm=Double.valueOf(request.getParameter("posinglerm"));
		double podoublerm=Double.valueOf(request.getParameter("podoublerm"));
		double podeluxerm=Double.valueOf(request.getParameter("podeluxerm"));
		String image=request.getParameter("imagepath");
		
		
        String driver="oracle.jdbc.driver.OracleDriver";
        Class.forName(driver);
        
        String url="jdbc:oracle:thin:@localhost:1521:XE";
        String userid="hotelbooking";
        String password="hotelbooking";
        
        conn=DriverManager.getConnection(url,userid,password);
        String query="UPDATE ohbhotels SET "+" region=?,place=?,name=?,about=?,type=?,totalrooms=?,typeofroom1=?,typeofroom2=?,typeofroom3=?,noofsingleroom=?,noofdoubleroom=?,noofdeluxeroom=?,posingleroom=?,podoubleroom=?,podeluxeroom=?,image=? WHERE id=?";
        
		
		PreparedStatement ps=conn.prepareStatement(query);
		
		ps.setString(1,region);
		ps.setString(2,place);
		ps.setString(3,name);
		ps.setString(4,about);
		ps.setString(5,type);
		ps.setInt(6,noofrooms);
		ps.setString(7,id1);
		ps.setString(8,id2);
		ps.setString(9,id3);
		ps.setInt(10,nosinglerm);
		ps.setInt(11,nodoublerm);
		ps.setInt(12,nodeluxerm);
		ps.setDouble(13,posinglerm);
		ps.setDouble(14,podoublerm);
		ps.setDouble(15,podeluxerm);
		ps.setString(16,image);
		ps.setInt(17,id);
		
		int rn=ps.executeUpdate();
		
		if(rn>0)
		{
			response.sendRedirect("showhotel.jsp");
		}
			//out.print("Successfully Registered. Welcome to Lets Go");
        conn.close();
     }
	 catch(Exception e)
	 {
		 out.print(e);
	 }
%>
</body>
</html>
