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
<title>Orders</title>
<link rel="shortcut icon" href="../image/icon2.jpg">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
<link rel="stylesheet"href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
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
<script type="text/javascript">
	
	function allfeedback()
	{
		ob=new XMLHttpRequest();
		ob.open("GET","success_order_display.jsp");
		ob.send();
		ob.onreadystatechange=function()
		{
			if(ob.status==200 && ob.readyState==4)
			{
				document.getElementById("output").innerHTML=ob.responseText;
					 
			}
		}

	}


</script>

<style>
	.btn btn-primary m-3
	{ 
		background:red;
		border:none;
	}
	
	.navbar-brand
	{
		padding-left:20px;
		font-size:30px;
		
	}
</style>
</head>
<body onload="allfeedback()" style="font-family: sans-serif;background-image: linear-gradient(to right bottom, #f0ebf0, #f2e5f1, #f5def3, #f8d8f3, #fbd1f3, #fcc3f1, #fcb5ef, #fca6ed, #f88be8, #f36ee4, #ec4ce0, #e511dc);">
	
	
	
	
<div style="height:100vh;">
	<nav class="navbar navbar-light">
  <a class="navbar-brand"><b>Online Food Ordering <span style="color:red"> System </span></b></a>
  
  <form class="form-inline m-3" style="">
   <a class="btn btn-primary m-3" href="../AdminDashboardH.jsp" target="blank" style="background:red;border:none" role="button">Dashboard</a>
   <a class="btn btn-primary m-3" href="../product/addproductH.jsp" target="blank" style="background:red;border:none" role="button">Product</a>
   <a class="btn btn-primary m-3" href="../usershow/alluserH.jsp" target="blank" style="background:red; border:none;" role="button">Users</a>
  	
  </form>
</nav>
<div style="padding-top:50px">
	 <div class="container">
				<table class="table">
  			<thead>
		    <tr>
		      <th scope="col">Email</th>
		      <th scope="col">Total Amount</th>
		      <th scope="col">Status</th> 
		      <th scope="col">Remove</th>
		 	</tr>
 			 </thead>
  			<tbody id="output">
  			</tbody>
		</table>
	</div>
</div>
</div>
<div class="footer">
  <p>This Site Is Developed By : Tushar R. Jagtap (Sinhagad Institute of Management)</p>
</div>
</body>
</html>