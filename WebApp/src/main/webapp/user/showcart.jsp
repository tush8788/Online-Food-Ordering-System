<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>Checkout</title>
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
   margin-top:50px;
}
</style>
<link rel="shortcut icon" href="../images/icon2.jpg">
    <!--  -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <!-- Bootstrap core CSS -->
    <link href="../../dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="form-validation.css" rel="stylesheet">
  </head>

  <body class="bg-light">
  
  <a class="btn btn-danger" data-toggle="collapse" href="DashboardH.jsp" role="button" aria-expanded="false" aria-controls="collapseExample">
   Dashboard
  </a>
<form action="order_conform.jsp" method="get">
    <div class="container">
      <div class="py-5 text-center">
        <h1 class="font-weight-bold" >Online Food Ordering <span style="color:red;">System</span></h1>
        <p class="lead">Thank You for Ordering Food</p>
      </div>

<%@page import="java.sql.*" %>
<%!
	String uname,sts;
    float sum;
        		int amount;
%>
<%

try
{
	sts="ucart";
	uname=session.getAttribute("auname").toString();
	Class.forName("org.postgresql.Driver");
	Connection con=DriverManager.getConnection("jdbc:postgresql://localhost:5432/eatscafe","postgres","admin");
	PreparedStatement ps=con.prepareStatement("select count(*) from usercart where uname=? and status=?");
	ps.setString(1,uname);
	ps.setString(2,sts);
	ResultSet rs=ps.executeQuery();	
%>
      <div class="row ">
        <div class="col-md order-md-2 mb-4">
          <h4 class="d-flex justify-content-between align-items-center mb-3">
            <span class="text-muted">Your cart</span>
            <span class="badge badge-secondary badge-pill">
        <%
        	if(rs.next())
			{
				out.print(rs.getInt(1));
			}
      
        %>
        <%
        PreparedStatement ps1=con.prepareStatement("select product.pid,pname,pmrp,pdic,pdesc,usercart.pqty from product,usercart where uname=? and product.pid=usercart.pid and status=?");
      	ps1.setString(1,uname);
    	ps1.setString(2,sts);
      	ResultSet rs1=ps1.executeQuery();
      	
      	sum=0;
        %>
          </span>
          </h4>
          <ul class="list-group mb-3">  
             
              <%
             while(rs1.next())
          	{
          
              %>
              <li class="list-group-item d-flex justify-content-between lh-condensed">
              <div>
                <h6 class="my-0"><%=rs1.getString(2) %></h6>
                <small class="text-muted"><%=rs1.getString(5)%></small>
                
              </div>
              <small class="text-muted">Qty: <%=rs1.getString(6)%></small>
                   <a href="updateQtyH.jsp?id=<%= rs1.getInt(1) %>">update Quantity</a>
            <% //Discount Calculation 
    			int amt=rs1.getInt(3);
    			int dis=rs1.getInt(4);
    			int discount =amt*dis/100;
    			int qty=rs1.getInt(6);
    			int amount=(amt-discount)*qty;
    			sum=sum+amount;
    		
		    %>
		  <a href="removeproduct.jsp?id=<%=rs1.getInt(1)%>">remove</a>
              <span class="text-muted"><% out.print(amount); %></span>
        
            </li>
           
            
            <%
           	}
		}
			catch(Exception e)
			{
				System.out.println(e);
			}
            %>
            
          
            <li class="list-group-item d-flex justify-content-between">
              <span>Total (USD)</span>
              <a href="UpdateAddressandmobH.jsp">Update Address And Mobile No</a>
              <strong><%out.print(sum); %></strong>
              
            </li>
          </ul>

         
        </div>
       
      </div>
      
      <hr class="mb-4">

            <h4 class="mb-3">Payment</h4>

            
            <div class="row">
              <div class="col-md-6 mb-3">
                <label for="cc-name">Name on card</label>
                <input type="text" class="form-control"  id="cc-name" placeholder="" required>
                <small class="text-muted">Full name as displayed on card</small>
                <div class="invalid-feedback">
                  Name on card is required
                </div>
              </div>
              <div class="col-md-6 mb-3">
                <label for="cc-number">Credit card number</label>
                <input type="text" class="form-control" id="cc-number" placeholder="" required>
                <div class="invalid-feedback">
                  Credit card number is required
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-md-3 mb-3">
                <label for="cc-expiration">Expiration</label>
                <input type="text" class="form-control" id="cc-expiration" placeholder="" required>
                <div class="invalid-feedback">
                  Expiration date required
                </div>
              </div>
              
              <div class="col-md-3 mb-3">
                <label for="cc-expiration">CVV</label>
                <input type="text" class="form-control" id="cc-cvv" placeholder="" required>
                <div class="invalid-feedback">
                  Security code required
                </div>
              </div>
              <div class="col-md-3 mb-3">
                <label for="cc-expiration">Amount</label>
                <input type="text" class="form-control" id="cc-expiration" value=<%out.print(sum); %> name="amtt" placeholder="" required>
                <div class="invalid-feedback">
                  Expiration date required
                </div>
              </div>
            </div>
            
            <hr class="mb-4">
            <button class="btn btn-primary btn-lg btn-block" type="submit">Pay  <% out.print(sum); %></button>
          </form>
        </div>
      </div>

     
    </div>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery-slim.min.js"><\/script>')</script>
    <script src="../../assets/js/vendor/popper.min.js"></script>
    <script src="../../dist/js/bootstrap.min.js"></script>
    <script src="../../assets/js/vendor/holder.min.js"></script>
    <script>
    function Qunt()
    {
    	q=document.getElementById("qty").value;
    	alert(q);
    	
    }
$(document).ready(function()  // payment validation 
		$("#cc-name").blur(function(){
			str=document.getElementById("txtuname").value;
			if(str=="" || !isNaN(str))
				{
					document.getElementById("erruname").innerHTML="Invild Name...!";
					$("#erruname").show(500);
				}
			else
				{
					document.getElementById("erruname").innerHTML="";
					$("#erruname").hide(500);
				}
		});
});
    
      // Example starter JavaScript for disabling form submissions if there are invalid fields
      (function() {
        'use strict';

        window.addEventListener('load', function() {
          // Fetch all the forms we want to apply custom Bootstrap validation styles to
          var forms = document.getElementsByClassName('needs-validation');

          // Loop over them and prevent submission
          var validation = Array.prototype.filter.call(forms, function(form) {
            form.addEventListener('submit', function(event) {
              if (form.checkValidity() === false) {
                event.preventDefault();
                event.stopPropagation();
              }
              form.classList.add('was-validated');
            }, false);
          });
        }, false);
      })();
      
    </script>
    
    <div class="footer">
  <p>This Site Is Developed By : Tushar R. Jagtap (Sinhagad Institute of Management)</p>
</div>
  </body>
</html>
    