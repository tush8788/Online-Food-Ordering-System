<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<%
	String umail=request.getParameter("email");
	//out.println(pid);
	try
	{
		
		Class.forName("org.postgresql.Driver");
		Connection con=DriverManager.getConnection("jdbc:postgresql://localhost:5432/eatscafe","postgres","admin");
		
		PreparedStatement ps=con.prepareStatement("delete from feedback where email=?");
		ps.setString(1,umail);
		int i=ps.executeUpdate();
		if(i==1)
		{
%>


<script>
if(confirm("Feedback Delete Successfully"))
	{
		location="FeedbackH.jsp";
	}
else
	{
		location="FeedbackH.jsp";
	}

</script>
		
			
<%		

		}
		else
		{
			out.println("error in delete Feedback");
		}
		
		
		
		
	}
	catch(Exception e)
	{
		out.println(e);
	}

%>