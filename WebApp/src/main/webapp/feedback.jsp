<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<%!
	String un,umail,ufood,umess;
%>

<%
	un=request.getParameter("name");
	umail=request.getParameter("email");
	ufood=request.getParameter("food");
	umess=request.getParameter("message");
	
	//out.println(un+" "+umail+" "+ufood+" "+umess);
	
	try
	{
		Class.forName("org.postgresql.Driver");
		Connection con=DriverManager.getConnection("jdbc:postgresql://localhost:5432/eatscafe","postgres","admin");
		PreparedStatement ps=con.prepareStatement("insert into feedback values(?,?,?,?)");
		ps.setString(1,un);
		ps.setString(2,umail);
		ps.setString(3,ufood);
		ps.setString(4,umess);
		int i=ps.executeUpdate();
		
		if(i>0)
		{
%>
	<script type="text/javascript">
		if(confirm("Thank You For Feedback..!"))
			{
			 location="index.html";
			}
		else
			{
			location="index.html";
			}
	</script>		
<%		
		}
		else
		{
			out.println("Error for String Data");
					
		}
	}
	catch(Exception e)
	{
		out.println(e);
	}
%>