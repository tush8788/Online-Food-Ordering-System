<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@page import="java.sql.*"	%>

<%@page import="java.security.*" %>
<%@page import="java.math.BigInteger" %>

<%!
	String un,umail,up,umob,usq,usqa,uadd;
	String hashtext;
%>

<%
	un=request.getParameter("txtuname");
	umail=request.getParameter("txtemail");
	up=request.getParameter("txtpass");
	umob=request.getParameter("txtmob");
	usq=request.getParameter("txtusq");
	usqa=request.getParameter("txtusa");
	uadd=request.getParameter("txtadd");
	
	//out.println(un+" "+umail+""+up+" "+umob+""+usq+""+usqa);
	
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
		PreparedStatement ps=con.prepareStatement("insert into userdetails values(?,?,?,?,?,?,?)");
		ps.setString(1,un);
		ps.setString(2,umail);
		ps.setString(3,hashtext);
		ps.setString(4,umob);
		ps.setString(5,usq);
		ps.setString(6,usqa);
		ps.setString(7,uadd);
		int x=ps.executeUpdate();
		if(x>0)
		{
			//out.println("data Inserted");
			response.sendRedirect("login.html");
		}
		else
		{
			out.println("Invild");
			response.sendRedirect("signup.html");
		}
	}
	catch(Exception e)
	{
		out.println(e);
	}
%>

