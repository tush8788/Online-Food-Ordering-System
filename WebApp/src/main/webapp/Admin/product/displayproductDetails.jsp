<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@page import="java.sql.*" %>

<%

try
{

Class.forName("org.postgresql.Driver");
Connection con=DriverManager.getConnection("jdbc:postgresql://localhost:5432/eatscafe","postgres","admin");
Statement st=con.createStatement();

ResultSet rs=st.executeQuery("select * from product order by pid");

out.print("<tr><th>Product Id</th><th>Product Name</th><th>Description </th><th>MRP</th><th>Discount</th><th>Edit</th><th>Delete</th></tr>");
while(rs.next())
{
	out.print("<tr><td>"+rs.getInt(1)+"</td><td>"+rs.getString(2)+"</td><td>"+rs.getString(3)+"</td><td>"+rs.getInt(4)+"</td><td>"+rs.getInt(5)+"</td><td><a href=editproduct.jsp?pid="+rs.getInt(1)+">Edit</a></td><td><a href=deleteproduct.jsp?pid="+rs.getInt(1)+">Delete</a></td></tr>");
}

}
catch(Exception e)
{
	out.println(e);
}



%>