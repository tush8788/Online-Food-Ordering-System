<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@page import="java.sql.*" %>
<%!
	String umail,usq,usqa;
%>

<%
	umail=request.getParameter("txtemail");
	usq=request.getParameter("txtusq");
	usqa=request.getParameter("txtusa");
	
	
	
	try
	{
		Class.forName("org.postgresql.Driver");
		Connection con=DriverManager.getConnection("jdbc:postgresql://localhost:5432/eatscafe","postgres","admin");
		PreparedStatement ps=con.prepareStatement("select count(*) from userdetails where uemail=? and useq=? and useqans=?");
		//email=umail;
		ps.setString(1,umail);
		ps.setString(2,usq);
		ps.setString(3,usqa);
		
		ResultSet rs=ps.executeQuery();
		
		rs.next();
		int i=rs.getInt(1);
		if(i==1)
		{
%>
<!DOCTYPE html>
<html>
<head>
	<title>Update Password</title>
	<link rel="shortcut icon" href="images/icon2.jpg">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script type="text/javascript">
	$(document).ready(function(){
		
		$("#txtcompass").on(
				{
					blur:function()
					{
						pass=document.getElementById("txtpass").value;
						cpass=document.getElementById("txtcompass").value;
						if(pass=="" || cpass=="" || cpass!=pass)
							{
								document.getElementById("errpass").innerHTML="Invild Password...!";
								document.getElementById("errcompass").innerHTML="Invild Password...!";
								$("#errpass").show(500);
								$("#errcompass").show(500);
							}
						else
							{
							$("#errpass").hide(500);
							$("#errcompass").hide(500);
							document.getElementById("errpass").innerHTML="";
							document.getElementById("errcompass").innerHTML="";
							
							}
					}
				});
	});
	
	</script>
	<style type="text/css">
		*{
			margin: 0;
			padding: 0;
			box-sizing: border-box;
			font-family: sans-serif;
		}
		.main_div{
			width: 100%;
			height: 100vh;
			position: relative;
			background: rgba(0,0,0,.8);
			overflow: hidden;
			
		}
		.box{
			width: 600px;
			position: absolute;
			top: 50%;
			left: 50%;
			transform: translate(-50%,-50%);
			padding: 50px;
			background: rgba(0,0,0,.8);
			border-radius: 10px;
		}
		.box h1{
			margin-bottom: 30px;
			color: #fff;
			text-align: center;
			text-transform: capitalize;

		}
		.box .inputbox input{
			width: 100%;
			padding: 10px;
			font-size: 16px;
			color: #fff;
			letter-spacing: 1px;
			border:none;
			border-bottom: 1px solid #fff;
			background: transparent;
			outline: none;
			
		}
		.box .inputbox  label{
			top: 0;
			left: 0;
			letter-spacing: 1px;
			padding: 10px 0;
			font-size: 16px;
			color: #fff;
			transition: 0.5s;
		}
		.form-select
		{
			width: 100%;
			padding: 10px;
			font-size: 16px;
			color: #fff;
			letter-spacing: 1px;
			border:none;
			border-bottom: 1px solid #fff;
			background: transparent;
			outline: none;

		}
		.select
		{
			width: 100%;
			padding: 10px;
			font-size: 16px;
			color: #fff;
			letter-spacing: 1px;
			border:none;
			border-bottom: 1px solid #fff;
			background: rgba(0,0,0,.8);
			outline: none;
		}
		
		.login
		{
			background: transparent;
			border:none;
			color: #fff;
			outline: none;
			background: #ed0202;
			padding: 10px 16px;
			padding-left: 30px;
			padding-right: 30px;
			border-radius: 5px;
			font-size: 15px;
		}

	</style>
</head>
<body>
 	<div class="main_div">
 		<div class="box">
 			<h1>Eat's<span style="color: red"> Cafe</span></h1>
 			<form action="forgotpassword1.jsp" method="post">
 				<div class="inputbox" style="margin-bottom: 30px;">
 					<input type="text" name="txtemail" autocomplete="off" id="txtemail" value="<%out.print(umail);%>" readonly> </br>
 					<div id="errpass"  style="color:red"></div>
 				</div>
 			
 				<div class="inputbox" style="margin-bottom: 30px;">
 					<input type="password" name="txtpass" autocomplete="off" id="txtpass" required placeholder="Enter New Password"></br>
 					<div id="errpass"  style="color:red"></div>
 				</div>

 				<div class="inputbox" style="margin-bottom: 30px;">
 					<input type="password" name="txtcompass" id="txtcompass" autocomplete="off" required placeholder="Conform Password"></br>
 					<div id="errcompass" style="color:red"></div>
 					
 				</div>
 				<div align="center">
 					<input  type="submit" value="Update" class="login">
 				</div>
 			</form>
 		</div>
 	</div>
</body>
</html>

<%		
	}
		else
		{	
			%>
<script type="text/javascript">
			if(confirm("Invild Details"))
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