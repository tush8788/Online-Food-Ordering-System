<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>

<%! 
	String un,up;
%>

<%
	un=request.getParameter("txtuname");
	up=request.getParameter("txtpass");
	//password incription
	
	
	try
	{
		Class.forName("org.postgresql.Driver");
		Connection con=DriverManager.getConnection("jdbc:postgresql://localhost:5432/eatscafe","postgres","admin");
		PreparedStatement ps=con.prepareStatement("select count(*) from admin where aname=? and apass=?");
		ps.setString(1,un);
		ps.setString(2,up);
		
		ResultSet rs=ps.executeQuery();
		
		rs.next();
		int i=rs.getInt(1);
		if(i==1)
		{
			session.setAttribute("auname",un);   //session start here 
			response.sendRedirect("AdminDashboardH.jsp");
		}
		else
		{
%>
<script type="text/javascript">
if(confirm("Invild Email Or Password"))
	{
		location="login.html";
	}
else  
	{
	location="login.html";
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