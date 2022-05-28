<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>

<%@page import="java.security.*" %>
<%@page import="java.math.BigInteger" %>

<%! 
	String umail,up;
	String hashtext;
%>

<%
	umail=request.getParameter("txtemail");
	up=request.getParameter("txtpass");
	//password incription
	try
	{
		MessageDigest md= MessageDigest.getInstance("MD5");
		byte[] messageDigest = md.digest(up.getBytes());
		BigInteger no=new BigInteger(1,messageDigest);
		hashtext =no.toString(16);
	}
	catch(Exception e)
	{
		out.println("error");
	}
	
	
	
	
	try
	{
		Class.forName("org.postgresql.Driver");
		Connection con=DriverManager.getConnection("jdbc:postgresql://localhost:5432/eatscafe","postgres","admin");
		PreparedStatement ps=con.prepareStatement("select count(*) from userdetails where uemail=? and upass=?");
		ps.setString(1,umail);
		ps.setString(2,hashtext);
		
		ResultSet rs=ps.executeQuery();
		
		rs.next();
		int i=rs.getInt(1);
		if(i==1)
		{
			session.setAttribute("auname",umail);
			response.sendRedirect("user/DashboardH.jsp");
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