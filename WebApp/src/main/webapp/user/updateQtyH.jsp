<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%!
 	String username;
 	int pid;
 %>   
 <% 
 username=session.getAttribute("auname").toString();
 try
 {
	 pid=Integer.parseInt(request.getParameter("id"));
	// out.print(pid);
	
 }
 catch(Exception e)
 {
	 out.print(e);
 }
 %>
 
 <!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>
<center>
<form action="UpdateQauntity.jsp" method="post" class="w-50 p-3">

  <div class="form-group row">
    <label for="staticEmail" class="col-sm-2 col-form-label">Username</label>
    <div class="col-sm-10">
      <input type="text" readonly class="form-control-plaintext" name="username" value="<%out.print(username);%>">
    </div>
  </div>
  
    <div class="form-group row">
    <label for="staticEmail" class="col-sm-2 col-form-label">Product Id</label>
    <div class="col-sm-10">
      <input type="text" readonly class="form-control-plaintext" id="username" name="pid" value="<%out.print(pid);%>">
    </div>
  </div>
  
  <div class="form-group row">
    <label for="inputPassword" class="col-sm-2 col-form-label">Quantity</label>
    <div class="col-sm-10">
      <input class="form-control" value="1" type="number" id="quantity" name="quantity" min="1" max="50">
    </div>
  </div>
  <button type="submit" class="btn btn-primary btn-lg btn-block">Update Quantity</button>
</form>
</center>
</body>
</html>