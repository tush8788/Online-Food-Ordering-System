<%@page import="java.sql.*" %>
<%!
 	String usernm,mob,add;
 	
 %>   
 
 <%
 try
 {
	 
	 usernm=request.getParameter("username");
	 add=request.getParameter("add");
	 mob=request.getParameter("mob");
	// out.print(qty+" "+usernm+" "+pid);
	
	 Class.forName("org.postgresql.Driver");
		Connection con=DriverManager.getConnection("jdbc:postgresql://localhost:5432/eatscafe","postgres","admin");
		PreparedStatement ps=con.prepareStatement("update userdetails set umob=?,address=? where uemail=?");
		
		
		ps.setString(1,mob);
		ps.setString(2,add);
		ps.setString(3,usernm);
		
		int x=ps.executeUpdate();
		if(x>0){
			%>
			
			<script>
				if(confirm("Update Successfully"))
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
