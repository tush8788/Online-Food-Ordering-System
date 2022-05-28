<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<%
	String umail=request.getParameter("email");
	//out.println(umail);
	try
	{
		Class.forName("org.postgresql.Driver");
		Connection con=DriverManager.getConnection("jdbc:postgresql://localhost:5432/eatscafe","postgres","admin");
		PreparedStatement ps=con.prepareStatement("delete from userdetails where uemail=?");
		ps.setString(1,umail);
		int i=ps.executeUpdate();
		if(i==1)
		{
%>
<script type="text/javascript">
if(confirm("User Delete Sucessfully"))
	{
		location="alluserH.jsp";
	}
else
	{
	location="alluserH.jsp";
	}
</script>
<%
		}
		else
		{
			out.println("Error In user Delete");
		}
		
	}
	catch(Exception e)
	{
		out.println(e);		
	}
%>