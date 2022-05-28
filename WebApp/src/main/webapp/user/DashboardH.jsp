<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
	if(session.getAttribute("auname")==null)
	{
		response.sendRedirect("../login.html");
	}
%>  


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Dashboard</title>
<link rel="shortcut icon" href="../images/icon2.jpg">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style>
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

function allfun()
{
	displayproduct()
	showcount();
}
//display all product 
	function displayproduct() 
	{
		// display all food
		ob=new XMLHttpRequest();
		ob.open("GET","displayproduct.jsp");
		ob.send();
		ob.onreadystatechange=function()
		{
				
				if(ob.status==200 && ob.readyState==4)
				{
					document.getElementById("output").innerHTML=ob.responseText;				
				}
			
			}
			
		
	}

	function txtselect()
	{
		str=document.getElementById("txtselect").value;
		ob=new XMLHttpRequest();
		ob.open("GET","display_pro_cat.jsp?cat="+str);
		
		ob.send();
			ob.onreadystatechange=function(){
				
				if(ob.status==200 && ob.readyState==4)
				{
					document.getElementById("output").innerHTML=ob.responseText;				
				}
			
			}
			
		
	}
	
	
	function search()
	{
		str=document.getElementById("txtsearch").value;
		ob=new XMLHttpRequest();
		ob.open("GET","search_product.jsp?pro="+str);
		
		ob.send();
			ob.onreadystatechange=function(){
				
				if(ob.status==200 && ob.readyState==4)
				{
					document.getElementById("output").innerHTML=ob.responseText;				
				}
			
			}
			
		
	}
	
	function showcount()
	{
		ob1=new XMLHttpRequest();
		ob1.open("GET","showcount.jsp");
		ob1.send();
			ob1.onreadystatechange=function(){
				
				if(ob1.status==200 && ob1.readyState==4)
				{
					document.getElementById("showcart").innerHTML=ob1.responseText;				
				}
			
			}
			
		
	}
	

</script>

<style>
.container
{
	margin-top:5%;
	
}

</style>
</head>
<body onload="allfun()">
<nav class="navbar navbar-expand-sm fixed-top navbar-light justify-content-between"> <!-- This Line Make nav bar Trasperent -->
  <a class="navbar-brand"></a>
  <form class="form-inline">
  <a href="showcart.jsp" id="showcart" style="color:#c4ff03; font-size:30px">0</a>  <!-- Counter  -->
    <a href="showcart.jsp" ><img alt="tt" src="images/cart1.png"style="margin:10px" height=40;></a>
    <a class="btn btn-primary m btn-outline-success my-2 my-sm-0" href="Logout.jsp" style="background:red;color:#fff;border:none;padding:5px;" role="button">Logout</a>
  </form>
</nav>
<div style="width: 100%; height: 60vh;overflow: hidden;" id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="images/bg.jpg"class="d-block w-100" alt="..." style="width: 100%;">   <!-- src="images/bg.jpg"  -->
      
      <div class="carousel-caption d-none d-md-block" style="padding-bottom: 39%;">
      
      <form class="form-inline" style="width-left:;">
  	
</form>

	<!-- 	<a><img alt="" src="images/add to cart.png"></a>  -->
      
        <h2 class="display-3 font-weight-bold"><b>Online Food Ordering<span style="color:red;">.System</span></b></h2>
        <h3 style="padding-bottom: 10px">Discover the best food in Pune.</h3>
   
   
<div class="input-group mb-3" style="width:90%; margin-left:10%;padding:15px;">
<!--
<form class="form-inline m" style="width-left:90%;">
  	<a class="btn btn-primary m" href="logout.jsp" style="background:red;color:#fff;border:none;" role="button">Logout</a>
  	<a><img></a>
</form>
  		  -->
  <div class="form-group">
    <select class="form-control form-control-lg" id="txtselect" onclick="txtselect()">
     <option  selected>Select Category</option>
      <option value="veg">Veg Items</option>
      <option value="non veg">Non Veg Items</option>
    </select>
  </div>
  	<input type="text" class="form-control form-control-lg" placeholder="Search Dish" id="txtsearch" onkeyup="search()">
</div>
 
    </div>
  </div>
</div>
</div>


	<div class="container" >
		<div class="row" id="output">
			

		</div>
	</div>
<div class="footer">
  <p color="white;">This Site Is Developed By : Tushar R. Jagtap (Sinhagad Institute of Management)</p>
</div>
</body>
</html>