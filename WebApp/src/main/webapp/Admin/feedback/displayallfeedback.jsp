<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@page import="java.sql.*" %>

<%

try
{

Class.forName("org.postgresql.Driver");
Connection con=DriverManager.getConnection("jdbc:postgresql://localhost:5432/eatscafe","postgres","admin");
Statement st=con.createStatement();

ResultSet rs=st.executeQuery("select * from feedback");

//out.print("<tr><th>Product Id</th><th></th><th>Description </th><th>MRP</th><th>Discount</th><th>Edit</th><th>Delete</th></tr>");
while(rs.next())
{
	out.print("<tr><td>"+rs.getString(1)+"</td><td>"+rs.getString(2)+"</td><td>"+rs.getString(3)+"</td><td>"+rs.getString(4)+"</td><td><a href=deletefeedback.jsp?email="+rs.getString(2)+">Delete</a></td></tr>");
}

}
catch(Exception e)
{
	out.println(e);
}



%>