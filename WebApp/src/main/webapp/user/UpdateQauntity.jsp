<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@page import="java.sql.*" %>
<%!
 	String usernm;
 	int pid,qty;
 	
 %>   
 
 <%
 try
 {
	 
	 usernm=request.getParameter("username");
	 qty=Integer.parseInt(request.getParameter("quantity"));
	 pid=Integer.parseInt(request.getParameter("pid"));
	// out.print(qty+" "+usernm+" "+pid);
	
	 Class.forName("org.postgresql.Driver");
		Connection con=DriverManager.getConnection("jdbc:postgresql://localhost:5432/eatscafe","postgres","admin");
		PreparedStatement ps=con.prepareStatement("update usercart set pqty=? where uname=? and pid=? ");
		
		ps.setInt(1,qty);
		ps.setString(2,usernm);
		ps.setInt(3,pid);
		
		
		int x=ps.executeUpdate();
		if(x>0){
			%>
			
			<script>
				if(confirm("Quantity Update Successfully"))
					{
						location="showcart.jsp";
					}
				else
					{
						location="showcart.jsp";
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
 