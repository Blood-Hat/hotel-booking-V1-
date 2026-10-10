<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
</head>
<body>
<%
	try
	{ 
		System.out.println("1");
		Connection conn;
		Statement stmt;
		ResultSet rs;
		String driver="oracle.jdbc.driver.OracleDriver";
		Class.forName(driver);
		String url="jdbc:oracle:thin:@localhost:1521:XE";
		String userid="hotelbooking";
		String password="hotelbooking";
    	conn=DriverManager.getConnection(url,userid,password);
    	stmt=conn.createStatement();
	
		String userid1=request.getParameter("userid");
		String password1=request.getParameter("psw");
		
		String query="SELECT USERID FROM OHBADMIN WHERE USERID='"+userid1+"' AND PASSWORD='"+password1+"'";
		rs=stmt.executeQuery(query);
		if(rs.next())
		{
			System.out.println("2");
			String userid2=rs.getString("USERID");
			session.setAttribute("userid2",userid2);
			response.sendRedirect("adminsuccess.jsp");
		}
		else
		{
			System.out.println("3");
			response.sendRedirect("adminerror.jsp");
		}
		conn.close();
	}
catch(Exception e)
{
	System.out.println("4");
		out.print(e.toString());
}
%>
</body>
</html>
