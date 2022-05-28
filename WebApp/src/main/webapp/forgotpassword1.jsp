<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<%@page import="java.security.*" %>
<%@page import="java.math.BigInteger" %>


<%!
	String umail,upass;
	String hashtext;
%>

<%
	umail=request.getParameter("txtemail");
	upass=request.getParameter("txtpass");
	//password incription
	
	
	try
	{
		MessageDigest md= MessageDigest.getInstance("MD5");
		byte[] messageDigest = md.digest(upass.getBytes());
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
		PreparedStatement ps=con.prepareStatement("update userdetails set upass=? where uemail=?");
		ps.setString(1,hashtext);
		ps.setString(2,umail);
		int i=ps.executeUpdate();
		
		if(i==1)
		{
%>
<script type="text/javascript">
	if(confirm("Password Update Sucessfully...!"))
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
		else
		{
			out.println("Password Update Fail....!");
		}
	}
	catch(Exception e)
	{
		out.println(e);
	}
%>