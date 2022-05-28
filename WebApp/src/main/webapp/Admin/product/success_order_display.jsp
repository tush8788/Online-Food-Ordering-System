<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<%
try
{
	//out.print("show");
	String str="aprove";
	Class.forName("org.postgresql.Driver");
	Connection con=DriverManager.getConnection("jdbc:postgresql://localhost:5432/eatscafe","postgres","admin");
	//Statement st=con.createStatement();
	//ResultSet re=st.executeQuery("select * from order_food where status=?");
	
	
	PreparedStatement ps=con.prepareStatement("select * from order_food where ustatus=?");
	ps.setString(1,str);
	ResultSet rs=ps.executeQuery();
	
	while(rs.next())
	{
		out.println("<tr><td>"+rs.getString(1)+"</td><td>"+rs.getFloat(2)+"</td><td>"+rs.getString(3)+"</td><td><a href=delete_aprove_order.jsp?email="+rs.getString(1)+">Remove</a></td></tr>");
	}
			
}
catch(Exception e)
{
	out.println(e);		
}

%>