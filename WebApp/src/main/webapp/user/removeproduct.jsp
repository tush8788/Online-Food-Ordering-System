<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
	if(session.getAttribute("auname")==null)
	{
		response.sendRedirect("login.html");
	}

%>
   
<%@page import="java.sql.*" %>
<%!
	int num;
%>
<%

	//out.println(pid);
	try
	{
		 num=Integer.parseInt(request.getParameter("id"));
		String uname=session.getAttribute("auname").toString();
	//	out.print(num);
		
		Class.forName("org.postgresql.Driver");
		Connection con=DriverManager.getConnection("jdbc:postgresql://localhost:5432/eatscafe","postgres","admin");
		
		PreparedStatement ps=con.prepareStatement("delete from usercart where uname=? and pid=?");
		ps.setString(1,uname);
		ps.setInt(2,num);
		int i=ps.executeUpdate();
		if(i==1)
		{
%>


<script>
if(confirm("Product Remove Successfully"))
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
		else
		{
			%>


			<script>
			if(confirm("error in delete product"))
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
		out.println(e);
	}

%>