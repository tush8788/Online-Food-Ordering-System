<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
	if(session.getAttribute("auname")==null)
	{
		response.sendRedirect("login.html");
	}

%>  
  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Product</title>
<link rel="shortcut icon" href="../image/icon2.jpg">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
	
	<style>

</style>
<style type="text/css">
.footer {
   left: 0;
   bottom: 0;
   width: 100%;
   font-size:15px;
   background-color: black;
   color: #fff;
   text-align: center;
   padding:7px;
}
</style>
</head>
<body style="font-family: sans-serif;background-image: linear-gradient(to right top, #ebf0f0, #e9f0f0, #e8f0f0, #e6f0f0, #e4f0f0, #d8efef, #ccefee, #c0eeed, #a4ecea, #85eae6, #5ee8e1, #11e5dc);">

<%@page import="java.sql.*" %>
<%! 
	int pid;
%>
<%
	pid=Integer.parseInt(request.getParameter("pid"));
	//out.println(pid);

	
try
{

Class.forName("org.postgresql.Driver");
Connection con=DriverManager.getConnection("jdbc:postgresql://localhost:5432/eatscafe","postgres","admin");
PreparedStatement ps=con.prepareStatement("select * from product where pid=?");
ps.setInt(1,pid);
ResultSet rs=ps.executeQuery();
rs.next();  //pointer next line pe aajayeaga 
%>

<div style="height:100vh; width:100%; padding-top:50px;">
<h2 align="center" style=""><b>Edit <span style="color:red"> Product</span></b></h2>
<div class="container" style="font-family: sans-serif">
		<div class="row">
			<div class="col-sm-5">
				<form action=updateproduct.jsp method=post enctype="multipart/form-data" >
				
				<div class="form-group">
						<label for="exampleInputName">Product id</label> <input type="text"
							class="form-control" id="txtPid" name="txtPid" value="<%= rs.getInt(1) %>"  readonly> 
					</div>
					
					<div class="form-group">
						<label for="exampleInputName">Product Name</label> <input type="text"
							class="form-control" id="txtPname" name="txtPname" value="<%= rs.getString(2) %>" readonly> 
					</div>
					
					<div class="form-group">
						<label for="exampleInputEmail1">Description</label> <input
							type="text" class="form-control" id="txtPdesc" name=txtPdesc
							aria-describedby="emailHelp" value="<%= rs.getString(3) %>" required> <small id="errFname"
							class="form-text text-muted"></small>
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">MRP</label> 
						<input type="text" class="form-control" id="txtMRP" name="txtMRP" value="<%= rs.getInt(4) %>"required>
					</div>

					<div class="form-group">
						<label for="exampleInputEmail1">Discount(%)</label> <input type="text" name=txtDisc
							class="form-control" id="txtDisc" value="<%= rs.getInt(5) %>" required>
				
					</div>
				
					<button type="submit" class="btn btn-primary">Update</button>
				</form>


			</div>
			<div class="col-sm-7" id="regimg">
				
				<!-- image space -->
				<div align="center" style="margin-top:20%">
					
					<img width="50%" src="../Eats cafe img/<%=rs.getString(6) %>" class="rounded mx-auto d-block" alt="<%=rs.getString(6)%>">
				</div>

			</div>

		</div>
	</div>
</div>
<%
}
catch(Exception e)
{
	out.println(e);
}

%>


<div class="footer">
  <p>This Site Is Developed By : Tushar R. Jagtap (Sinhagad Institute of Management)</p>
</div>

</body>
</html>