<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<%
	String umail=request.getParameter("email");
	//out.println(umail);
	String st="ordered";
	try
	{
		Class.forName("org.postgresql.Driver");
		Connection con=DriverManager.getConnection("jdbc:postgresql://localhost:5432/eatscafe","postgres","admin");
		PreparedStatement ps=con.prepareStatement("delete from order_food where un=?");
		ps.setString(1,umail);
		int i=ps.executeUpdate();
		
		PreparedStatement ps1=con.prepareStatement("delete from usercart where uname=? and status=?");
		ps1.setString(1,umail);
		ps1.setString(2,st);
		int it=ps1.executeUpdate();
		if(it==1 || i==1)
		{
%>
<script type="text/javascript">
if(confirm("Sucessfully"))
	{
		location="../AdminDashboardH.jsp";
	}
else
	{
	location="../AdminDashboardH.jsp";
	}
</script>
<%
		}
		else
		{
			out.println(i);
			out.println(it);
		}
		
	}
	catch(Exception e)
	{
		out.println(e);		
	}
%>