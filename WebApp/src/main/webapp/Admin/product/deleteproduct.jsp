<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
	if(session.getAttribute("auname")==null)
	{
		response.sendRedirect("login.html");
	}

%>
   
<%@page import="java.sql.*" %>
<%
	int Pi=Integer.parseInt(request.getParameter("pid"));
	//out.println(pid);
	try
	{
		
		Class.forName("org.postgresql.Driver");
		Connection con=DriverManager.getConnection("jdbc:postgresql://localhost:5432/eatscafe","postgres","admin");
		
		PreparedStatement ps=con.prepareStatement("delete from product where pid=?");
		ps.setInt(1,Pi);
		int i=ps.executeUpdate();
		if(i==1)
		{
%>


<script>
if(confirm("Product Delete Successfully"))
	{
		location="addproductH.jsp";
	}
else
	{
		location="addproduct.jsp";
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
					location="addproductH.jsp";
				}
			else
				{
					location="addproduct.jsp";
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