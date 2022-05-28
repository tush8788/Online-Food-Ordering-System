<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
<%!
	int prid,qty;
	String uname,status;
%>
<%

prid=Integer.parseInt(request.getParameter("prid"));
uname=session.getAttribute("auname").toString();
status="ucart";
try
{
	Class.forName("org.postgresql.Driver");
	Connection con=DriverManager.getConnection("jdbc:postgresql://localhost:5432/eatscafe","postgres","admin");
	PreparedStatement ps=con.prepareStatement("insert into usercart values(?,?,?,?)");
	ps.setString(1,uname);
	ps.setInt(2,prid);
	ps.setInt(3,1);
	ps.setString(4,status);
	int i=ps.executeUpdate();
	
	if(i>0)
	{
		response.sendRedirect("DashboardH.jsp");
	}
	else
	{
		System.out.println("Error");
	}
}
catch(Exception e)
{
	System.out.print(e);
}
			
%>