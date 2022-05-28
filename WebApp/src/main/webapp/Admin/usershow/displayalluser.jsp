<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<%
try
{
	Class.forName("org.postgresql.Driver");
	Connection con=DriverManager.getConnection("jdbc:postgresql://localhost:5432/eatscafe","postgres","admin");
	Statement st=con.createStatement();
	
	ResultSet re=st.executeQuery("select * from userdetails");
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