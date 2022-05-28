<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@page import="java.sql.*" %>

<%
 String pc=request.getParameter("cat");
	
try
{

Class.forName("org.postgresql.Driver");
Connection con=DriverManager.getConnection("jdbc:postgresql://localhost:5432/eatscafe","postgres","admin");
PreparedStatement ps=con.prepareStatement("select * from product where pcat=?");
ps.setString(1,pc);
ResultSet rs=ps.executeQuery();
while(rs.next())
{
%>

 <div class="row" >
<div class="col-sm-12 col-sm-offset-1" style=margin-right:20px>    
   
   <div class="card" style="width: 16rem; margin-bottom:20px;">
  <img src="../Admin/Eats cafe img/<%=rs.getString(6)%>" style=" height:30vh;" class="card-img-top" alt="not Load">
  <div class="card-body">
    <h5 class="card-title"><%=rs.getString(2) %></h5>
    <p class="card-text"><%=rs.getString(3) %></p>
  </div>
  <ul class="list-group list-group-flush">
    <li class="list-group-item"><b>MRP:-</b> Rs<strike> <%=rs.getInt(4)%> </strike></li>
   
    <% 
    	int amt=rs.getInt(4);
    	int dis=rs.getInt(5);
    	int discount =amt*dis/100;
    	int amount=amt-discount;
    	
    %>
    <li class="list-group-item"><b>Special Price: <% out.print(amount); %>( <%=rs.getString(5)%>%off)</b></li>
  </ul>
  <div class="card-body">
   <a href="addtocart.jsp?prid=<%= rs.getInt(1)%>" class="card-link">Add Cart</a>
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