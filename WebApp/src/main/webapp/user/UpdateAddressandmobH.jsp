<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
 <!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Address</title>
<link rel="shortcut icon" href="../images/icon2.jpg">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>
<center>
<form action="UpdateAdd_mob.jsp" method="post" class="w-50 p-3">

 <%!
 	String username;
 %>   
 <% 
 username=session.getAttribute("auname").toString();
 try
 {
 	Class.forName("org.postgresql.Driver");
 	Connection con=DriverManager.getConnection("jdbc:postgresql://localhost:5432/eatscafe","postgres","admin");
 	 PreparedStatement ps1=con.prepareStatement("select umob,address from userdetails where uemail=?");
   	ps1.setString(1,username);
   	ResultSet rs1=ps1.executeQuery();
    while(rs1.next())
  	{
 	%>		
 


  <div class="form-group row">
    <label for="staticEmail" class="col-sm-2 col-form-label">Username</label>
    <div class="col-sm-10">
      <input type="text" readonly class="form-control-plaintext" name="username" value="<%out.print(username);%>">
    </div>
  </div>
  
  <div class="form-group row">
    <label for="inputPassword" class="col-sm-2 col-form-label">New Address</label>
    <div class="col-sm-10">
      <input class="form-control" type="text" id="txt" name="add" value="<%=rs1.getString(2)%>">
    </div>
  </div>
  
    <div class="form-group row">
    <label for="inputPassword" class="col-sm-2 col-form-label">Enter New Phone No </label>
    <div class="col-sm-10">
      <input class="form-control" type="text" id="mob" name="mob" value="<%=rs1.getString(1)%>">
    </div>
  </div>
  <button type="submit" class="btn btn-primary btn-lg btn-block">Update Address and Mobile No</button>

<% 
 	}
 }
 catch(Exception e)
 {
 	out.println(e);		
 }

 %>
 </form>
</center>
 </body>
</html>
 