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
<title>Add Product</title>
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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<script>
function DisplayProducts()
{
	ob=new XMLHttpRequest();
	
	ob.open("GET","displayproductDetails.jsp");
	ob.send();
	ob.onreadystatechange=function(){
		
		if(ob.status==200 && ob.readyState==4){
			document.getElementById("output").innerHTML=ob.responseText;				
		}
	
	}
	
}

</script>



<title>Add product</title>
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
</style>
	

</head>
<body onload="DisplayProducts()" style="font-family: sans-serif;background-image: linear-gradient(to right top, #a33ab9, #ad67cd, #b98cde, #c9b0ec, #ddd2f6, #e7e1fa, #f3f0fd, #ffffff, #ffffff, #ffffff, #ffffff, #ffffff);">
<div class="body">

<nav class="navbar navbar-light">
  <a class="navbar-brand"><b>Online Food Ordering <span style="color:red"> System </span></b></a>
  
  <form class="form-inline m-3" style="">
  	<a class="btn btn-primary m-3" href="../AdminDashboardH.jsp" target="blank" style="background:red;border:none;" role="button">DashBoard</a>
   <a class="btn btn-primary m-3" href="../feedback/FeedbackH.jsp" target="blank" style="background:red;border:none;" role="button">Feedback</a>
   <a class="btn btn-primary m-3" href="../usershow/alluserH.jsp" target="blank" style="background:red; border:none;" role="button">Users</a>
  </form>
</nav>


<div>
	<div class="container" style="padding-bottom:20px">

		<div class="row">
			
			<div class="col-sm-5">
			<h3 align="center" style="">Add <span style="color:red"> Product</span></h3>
				<form action=addproductadmin.jsp method=post enctype="multipart/form-data" >
					<div class="form-group">
						<label for="exampleInputName">Product Name</label> <input type="text"
							class="form-control" id="txtPname" name="txtPname" required> 
							<small id="nameErr" class="form-text text-muted"></small>
					</div>
					
					<div class="form-group">
						<label for="exampleInputEmail1">Description</label> <input
							type="text" class="form-control" id="txtPdesc" name=txtPdesc
							aria-describedby="emailHelp" required> <small id="errFname"
							class="form-text text-muted"></small>
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">MRP</label> <input
							type="text" class="form-control" id="txtMRP" name=txtMRP
							aria-describedby="emailHelp" required> <small id="errEmail" 
							class="form-text text-muted"></small>
					</div>

					<div class="form-group">
						<label for="exampleInputEmail1">Discount(%)</label> <input type="text" name=txtDisc
							class="form-control" id="txtDisc" aria-describedby="emailHelp" required>
						<small id="errMobile" class="form-text text-muted"></small>
					</div>
				

					<div class="mb-3">
  						<label for="formFile" class="form-label">Product Image</label>
  						<input class="form-control" type="file" name="photo">
  						<small>image size under 1 mb</small>
					</div>

					<div class="form-group">
				   	 <label for="exampleFormControlSelect2">Choice Category</label>
				    	<select class="form-control" name="txtcat">
				      	<option selected>Select Option</option>
				      	<option value="veg">Veg item </option>
				      	<option value="non veg">Non-Veg Item</option>
				    	</select>
					</div>

						
					<div align="center">
					<button  type="submit" a class="btn btn-primary" style="background-color:red; border:none;">Add Product</button>
					</div>
				</form>


			</div>
			<div class="col-sm-7" id="regimg">
				<h3 align="center" style="">Display<span style="color:red; margin-bottom:20px;"> Product</span></h3>
				<table class="table" id="output" style="margin-top:30px;margin-left:20px;" >
					
					
				</table>

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
