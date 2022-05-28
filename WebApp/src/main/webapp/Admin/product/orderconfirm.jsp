<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<%
try
{
	//out.print("show");
	String uname=request.getParameter("email");
	String str="aprove";
	Class.forName("org.postgresql.Driver");
	Connection con=DriverManager.getConnection("jdbc:postgresql://localhost:5432/eatscafe","postgres","admin");
	PreparedStatement ps=con.prepareStatement("update order_food set ustatus=? where un=?");
	ps.setString(1,str);
	ps.setString(2,uname);
	int x=ps.executeUpdate();
	if(x>0){
		%>
		
		<script>
			if(confirm("Order Confirm Successfully"))
				{
					location="conform_orderH.jsp";
				}
			else
				{
					location="conform_orderH.jsp";
				}
			
		</script>
		<%	
			}
}

catch(Exception e)
{
 out.print(e);
}

%>