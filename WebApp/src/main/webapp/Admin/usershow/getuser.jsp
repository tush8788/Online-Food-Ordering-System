<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<%
	String umail=request.getParameter("name");
	//out.println(umail);
	try
	{
		Class.forName("org.postgresql.Driver");
		Connection con=DriverManager.getConnection("jdbc:postgresql://localhost:5432/eatscafe","postgres","admin");
		PreparedStatement ps=con.prepareStatement("select * from userdetails where uemail=?");
		ps.setString(1,umail);
		ResultSet re=ps.executeQuery();
		while(re.next())
		{
			out.println("<tr><td>"+re.getString(1)+"</td><td>"+re.getString(2)+"</td><td>"+re.getString(4)+"</td><td>"+re.getString(7)+"</td><td><a href=deleteuser.jsp?email="+re.getString(2)+">Delete</a></td></tr>");
		}
		
		
				
	}
	catch(Exception e)
	{
		out.println(e);		
	}
%>