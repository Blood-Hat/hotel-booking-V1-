<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>UpdateBookedRoomdb</title>
</head>
<body>
<% 
	Connection conn;
    try
    { 	
		//int roombid=Integer.parseInt(request.getParameter("roombid"));
		int idofhotel=Integer.parseInt(request.getParameter("idofhotel"));
		String nameofhotel=request.getParameter("nameofhotel");
		String placeofhotel=request.getParameter("placeofhotel");
		String imagepath=request.getParameter("imagepath");
		String typeofroom=request.getParameter("typeofroom");
		double priceofroom=Double.valueOf(request.getParameter("priceofroom"));
		String us=request.getParameter("us");
		String ei=request.getParameter("ei");
		int norb=Integer.parseInt(request.getParameter("norb"));
		int nog=Integer.parseInt(request.getParameter("nog"));
		String nameofguest=request.getParameter("nameofguest");
		String cid=request.getParameter("cid");
		String cod=request.getParameter("cod");
		int non=Integer.parseInt(request.getParameter("non"));
		double totalamt=Double.valueOf(request.getParameter("totalamt"));
		int roombid=Integer.parseInt(request.getParameter("roombid"));
		
		String driver="oracle.jdbc.driver.OracleDriver";
        Class.forName(driver);
        
        String url="jdbc:oracle:thin:@localhost:1521:XE";
        String userid="hotelbooking";
        String password="hotelbooking";
        
        conn=DriverManager.getConnection(url,userid,password);
        String query="UPDATE ohbroombook SET "+" idofhotel=?,nameofhotel=?,placeofhotel=?,imageofhotel=?,typeofroom=?,priceofroom=?,username=?,emailid=?,nosroom=?,noguest=?,nameofguest=?,checkin=?,checkout=?,nonight=?,totalamountpay=? WHERE roombookid=?";
        
		PreparedStatement ps=conn.prepareStatement(query);
		
		ps.setInt(1,idofhotel);
		ps.setString(2,nameofhotel);
		ps.setString(3,placeofhotel);
		ps.setString(4,imagepath);
		ps.setString(5,typeofroom);
		ps.setDouble(6,priceofroom);
		ps.setString(7,us);
		ps.setString(8,ei);
		ps.setInt(9,norb);
		ps.setInt(10,nog);
		ps.setString(11,nameofguest);
		ps.setString(12,cid);
		ps.setString(13,cod);
		ps.setInt(14,non);
		ps.setDouble(15,totalamt);
		ps.setInt(16,roombid);
		
		int rn=ps.executeUpdate();
		
		if(rn>0)
		{
			response.sendRedirect("showbookedrooms.jsp");
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
