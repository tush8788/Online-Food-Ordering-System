<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="">
<input type="text" id="uname" name="uname">
<input type="submit">
</form>
<%!
String a=null;
%>
<%
a=request.getParameter("uname");
out.println("jsp: "+a);
%>
</body>
</html>