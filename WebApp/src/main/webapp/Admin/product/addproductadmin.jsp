<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%
	if(session.getAttribute("auname")==null)
	{
		response.sendRedirect("login.html");
	}

%>   

<%@page import="java.sql.*" %>
<%@ page import="com.oreilly.servlet.*" %>

 <%!
 	String pn,pdesc,pimg,pcate;
 	int pmrp,pdisc;
 	
 %>   
 <%
 
 	MultipartRequest m=new MultipartRequest(request,"E:/Eats cafe img");
 	pimg=m.getOriginalFileName("photo");
 	pn=m.getParameter("txtPname");
	pdesc=m.getParameter("txtPdesc");
	pcate=m.getParameter("txtcat");
	pmrp=Integer.parseInt(m.getParameter("txtMRP"));
	pdisc=Integer.parseInt(m.getParameter("txtDisc")); 
	//out.println("File Uploaded "+pimg);
	
	//out.println(pn+"  "+pdesc+"  "+pmrp+"  "+pdisc+"  "+pcate+" ");
	try
	{

	Class.forName("org.postgresql.Driver");
	Connection con=DriverManager.getConnection("jdbc:postgresql://localhost:5432/eatscafe","postgres","admin");
	PreparedStatement ps=con.prepareStatement("insert into product(pname,pdesc,pmrp,pdic,pimage,pcat) values(?,?,?,?,?,?)");
	ps.setString(1,pn);
	ps.setString(2,pdesc);
	ps.setInt(3,pmrp);
	ps.setInt(4,pdisc);
	ps.setString(5,pimg);
	ps.setString(6,pcate);
	
	int x=ps.executeUpdate();
	if(x>0){
	%>
	
	<script>
		if(confirm("Product Added Successfully"))
			{
				location="addproductH.jsp";
			}
		else
			{
				location="addproductH.jsp";
			}
		
	</script>
	<%	
		}
	else
	{
		out.println("Error in Execution");
	}
	
	}
	
	catch(Exception e)
	{
		out.println(e);
		
	}
	
 %>
