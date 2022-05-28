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
<title>Admin_Dashboard</title>
<link rel="shortcut icon" href="image/a.png">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
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
	
function fun()
{
	totalproduct();
	totalfeedback();
	totaluser();
	//ordercount();
	//successorder();
}

function totaluser()
{	
	
	obj=new XMLHttpRequest();
	obj.open("GET","totaluser.jsp");
	obj.send();
	obj.onreadystatechange=function()
	{
		if(obj.status==200 && obj.readyState==4)
		{
			document.getElementById("tuser").innerHTML=obj.responseText;
				 
		}
	}
	
	
}


function totalfeedback()
{
	ob=new XMLHttpRequest();
	ob.open("GET","totalfeedback.jsp");
	ob.send();
	ob.onreadystatechange=function()
	{
		if(ob.status==200 && ob.readyState==4)
		{
			document.getElementById("tfeedback").innerHTML=ob.responseText;
				 
		}
	}

}

function totalproduct()
{
	obp=new XMLHttpRequest();
	obp.open("GET","totalproduct.jsp");
	obp.send();
	obp.onreadystatechange=function()
	{
		
		if(obp.status==200 && obp.readyState==4)
		{
			//alert(ob.responseText);
			document.getElementById("tproduct").innerHTML=obp.responseText;
				 
		}
	}

}



</script>

</head>
<body onload="fun()">

<nav class="navbar navbar-light">
  <a class="navbar-brand "><b><h2 class="font-weight-bold">Online Food Ordering <span style="color:red"> System </span></h2></b></a>
  
  <form class="form-inline m" style="">
  	<a class="btn btn-primary m" href="../Admin/logout.jsp" style="background:red;border:none;" role="button">Logout</a>
  </form>
</nav>

<div class="container mb-2">
	<!-- first Row -->
	<div class="row mt-4">
		
		<!-- first col -->
		<div class="col-sm-4">
		
			<div class="card text-center">
				<div class="card-body">
					<div class="container">
					<img  style="max-width:125px" class="img-fluid rounded-circle" alt="user icon" src="image/user.png">
					</div>
					<h1 id="tuser" onload="totaluser()"></h1>
					<h1 class="text-uppercase text-muted">User</h1>
					<div class="container">
			<a href="usershow/alluserH.jsp" class="btn btn-primary">Users</a>				
			</div>
				</div>		
			</div>
		
		</div>
		
		<!-- secound col -->
		<div class="col-sm-4">
		
		<div class="card text-center">
				<div class="card-body">
				<div class="container">
					<img  style="max-width:125px" class="img-fluid rounded-circle" alt="feedback_icon" src="image/feedback.png">
					</div>
					<h1 id="tfeedback"></h1>
					<h1  class="text-uppercase text-muted">Feedbacks</h1>
					<div class="container">
						<a href="feedback/FeedbackH.jsp" class="btn btn-primary">Feedback</a>
					</div>
				</div>		
		</div>
		
		</div>
		
		<!-- third col -->
		<div class="col-sm-4">
		
		<div class="card text-center">
				<div class="card-body">
				<div class="container">
					<img  style="max-width:125px" class="img-fluid " alt="eror icon" src="image/product.png">
					</div>
					<h1 id="tproduct"></h1>
					<h1  class="text-uppercase text-muted">Products</h1>
					<div class="container">
						<a href="product/addproductH.jsp" class="btn btn-primary">Add Product</a>
					</div>
				</div>		
		</div>
		
		</div>
		
	</div>
	
	<!-- Secound Row -->
	
	<div class="row mt-4">
		<div class="col-sm-6">
		
		<div class="card text-center">
				<div class="card-body">
				<div class="container">
					<img  style="max-width:125px" class="img-fluid rounded-circle" alt="user icon" src="image/order.png">
					</div>
					<h1 id="torder"></h1>
					<h1  class="text-uppercase text-muted">Waiting Orders</h1>
					<div class="container">
						<a href="product/conform_orderH.jsp" class="btn btn-primary">Confirm Order</a>
					</div>
				</div>		
		</div>
		
		</div>
		
		<div class="col-sm-6">
		
		<div class="card text-center">
				<div class="card-body">
				<div class="container">
					<img  style="max-width:125px" class="img-fluid rounded-circle" alt="user icon" src="image/rupee.png">
					</div>
					<h1 id=successfull></h1>
					<h1  class="text-uppercase text-muted">Successfull Orders</h1>
					<div class="container">
						<a href="product/success_order.jsp" class="btn btn-primary">Successfull</a>
					</div>
				</div>		
		</div>
		
		</div>
	</div>
</div>
<div class="footer">
  <p>This Site Is Developed By : Tushar R. Jagtap (Sinhagad Institute of Management)</p>
</div>
</body>
</html>