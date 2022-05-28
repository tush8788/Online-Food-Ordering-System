<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="java.sql.*" %>
<%!
	int total=0;
%>
<%
try
{
	Class.forName("org.postgresql.Driver");
	Connection con=DriverManager.getConnection("jdbc:postgresql://localhost:5432/eatscafe","postgres","admin");
	Statement st=con.createStatement();
	
	ResultSet re=st.executeQuery("select * from userdetails");
	total=0;
	while(re.next())
	{
		total=total+1;
	}
	
	out.println(total);
	
			
}
catch(Exception e)
{
	out.println(e);		
}

%>