<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@page import="java.sql.*" %>

<%

try
{

Class.forName("org.postgresql.Driver");
Connection con=DriverManager.getConnection("jdbc:postgresql://localhost:5432/eatscafe","postgres","admin");
Statement st=con.createStatement();

ResultSet rs=st.executeQuery("select * from product");

//out.print("<tr><th>Product Id</th><th>Product Name</th><th>Description </th><th>MRP</th><th>Discount</th><th>Edit?</th></tr>");
while(rs.next())
{
	//out.print("<tr><td>"+rs.getInt(1)+"</td><td>"+rs.getString(2)+"</td><td>"+rs.getString(3)+"</td><td>"+rs.getInt(4)+"</td><td>"+rs.getInt(5)+"</td><td><a href=editproduct.jsp?pid="+rs.getInt(1)+">Edit</a></td></tr>");
%>

}
 <div class="row" >
<div class="col-sm-12 col-sm-offset-1" style=margin-right:20px>    
   
   <div class="card" style="width: 16rem; margin-bottom:20px;">
  <img src="../Admin/Eats cafe img/<%=rs.getString(6)%>" style=" height:30vh;" class="card-img-top" alt="not Load">
  <div class="card-body">
    <h5 class="card-title"><b><%=rs.getString(2) %></b></h5>
    <p class="card-text"><%=rs.getString(3) %></p>
  </div>
  <ul class="list-group list-group-flush">
    <li class="list-group-item"><b>MRP:- </b>Rs<strike> <%=rs.getInt(4)%> </strike></li>
   
    <% 
    	int amt=rs.getInt(4);
    	int dis=rs.getInt(5);
    	int discount =amt*dis/100;
    	int amount=amt-discount;
    	
    %>
    <li class="list-group-item"><b>Special Price: <% out.print(amount); %>( <%=rs.getString(5)%>%off)</b></li>
  </ul>
  <div class="card-body">
  	<a onclick="showcount()" href="addtocart.jsp?prid=<%= rs.getInt(1)%>" class="card-link">Add Cart</a>
  <!-- 	<input style="width:50px;" id="qtycu" type="number" step="1" min="1" max="" name="quantity" value="1" title="Qty" class="input-text qty text" size="4">
   -->
  </div>
  </div>
</div> 
</div>

<%
		
}

}
catch(Exception e)
{
	out.println(e);
}



%>