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
<title>All user</title>
<link rel="shortcut icon" href="../image/icon2.jpg">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet">
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
	function display() 
	{
		s=document.getElementById("txtsearch").value;
		//alert(s);
		ob=new XMLHttpRequest();
		ob.open("GET","getuser.jsp?name="+s);
		ob.send();
		ob.onreadystatechange=function()
		{
			if(ob.status==200 && ob.readyState==4)
			{
				document.getElementById("output").innerHTML=ob.responseText;
					 
			}
		}


	}	
	
	function allusers()
	{
		ob=new XMLHttpRequest();
		ob.open("GET","displayalluser.jsp");
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
	.body
	{
		background-image: rl('../image/Food.jpg');
		width=100%;
		
		
		
		
	}
	.main
	{
		width:100%;
		height:100vh;
	}
</style>
</head>
<body onload="allusers()" style="font-family: sans-serif;background-image: linear-gradient(to right bottom, #ebf0f0, #e9f0f0, #e8f0f0, #e6f0f0, #e4f0f0, #bde6ea, #93dbe9, #60cfec, #00b0fa, #008dff, #0062ff, #2311e5);">
<div class="main">
<nav class="navbar navbar-light">
  <a class="navbar-brand"><b>Online Food Ordering <span style="color:red"> System </span></b></a>
  
  <form class="form-inline m-3" style="">
  <a class="btn btn-primary m-3" href="../AdminDashboardH.jsp" target="blank" style="background:red;border:none;" role="button">Dashboard</a>
   <a class="btn btn-primary m-3" href="../feedback/FeedbackH.jsp" target="blank" style="background:red;border:none;" role="button">Feedback</a>
   <a class="btn btn-primary m-3" href="../product/addproductH.jsp" target="blank" style="background:red; border:none;" role="button">Products</a>
  </form>
</nav>
	
	<div style="padding-top: 50px">
	<h3 align="center" style="">Search <span style="color:red"> User</span></h3>
	<div  class="container" align="center">
		<div class="mb-3">
    	<input type="text" placeholder="Enter Email" style="padding: 10px; width:50%;" class="form-control" id="txtsearch" onkeyup="display()" name="username">
  		</div>
	</div>
	 <div class="container">
				<table class="table">
  			<thead>
		    <tr>
		      <th scope="col">Name</th>
		      <th scope="col">Email</th>
		      <th scope="col">Mobile</th>
		      <th scope="col">Address</th>
		      <th scope="col">Function</th>
		 	</tr>
 			 </thead>
  			<tbody id="output">
  			
  			<!-- content come from database -->
  			
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