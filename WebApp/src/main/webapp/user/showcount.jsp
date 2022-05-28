<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<%!
	String uname,sts;
%>
<%
uname=session.getAttribute("auname").toString();
try
{
	sts="ucart";
	Class.forName("org.postgresql.Driver");
	Connection con=DriverManager.getConnection("jdbc:postgresql://localhost:5432/eatscafe","postgres","admin");
	PreparedStatement ps=con.prepareStatement("select count(*) from usercart where uname=? and status=?");
	ps.setString(1,uname);
	ps.setString(2,sts);
	
	ResultSet rs=ps.executeQuery();
	
	if(rs.next())
	{
		out.print(rs.getInt(1));
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