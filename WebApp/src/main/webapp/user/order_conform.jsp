<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="java.sql.*" %>
<%!
	String uname,sts;
    float sum;
%>
<%
	try
{
		sts="waiting";
		//sts=request.getParameter("amtt");
		//amt=Integer.parseInt(sts);
		sum = Float.parseFloat(request.getParameter("amtt"));
		uname=session.getAttribute("auname").toString();
		Class.forName("org.postgresql.Driver");
		Connection con=DriverManager.getConnection("jdbc:postgresql://localhost:5432/eatscafe","postgres","admin");
		PreparedStatement ps1=con.prepareStatement("update usercart set status='ordered' where uname=? and status='ucart'");
		ps1.setString(1,uname);
		int n=ps1.executeUpdate();

		
		
		
		
		PreparedStatement ps=con.prepareStatement("insert into order_food values(?,?,?)");
		ps.setString(1,uname);
		ps.setFloat(2,sum);
		ps.setString(3,sts);
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
catch(Exception ob)
{
	out.print(ob);
}
%>