<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@page import="java.sql.*" %>
<%@ page import="com.oreilly.servlet.*" %>

 <%!
 	String pdesc,pimg;
 	int pmrp,pdis,pid;
 	
 %>   
 <%
 
 	MultipartRequest m=new MultipartRequest(request,"E:/Eats cafe img");
	pdesc=m.getParameter("txtPdesc");
	pid=Integer.parseInt(m.getParameter("txtPid"));
	pmrp=Integer.parseInt(m.getParameter("txtMRP"));
	pdis=Integer.parseInt(m.getParameter("txtDisc"));
	//pid=Integer.parseInt(m.getParameter("txtPid"));
	 
	//out.println("File Uploaded "+pimg);
	
//	out.println(pn+"  "+pdesc+"  "+pmrp+"  "+pdisc+"  "+pqty+" ");
	try
	{
	
	Class.forName("org.postgresql.Driver");
	Connection con=DriverManager.getConnection("jdbc:postgresql://localhost:5432/eatscafe","postgres","admin");
	PreparedStatement ps=con.prepareStatement("update product set pdesc=?,pmrp=?,pdic=? where pid=? ");
	ps.setString(1,pdesc);
	ps.setInt(2,pmrp);
	ps.setInt(3,pdis);
	ps.setInt(4,pid);
	
	int x=ps.executeUpdate();
	if(x>0){
	%>
	
	<script>
		if(confirm("Product Update Successfully"))
			{
				location="addproductH.jsp";
			}
		else
			{
				location="addproduct.jsp";
			}
		
	</script>
	<%	
		}
	else
	{
%>		
	<script>
		if(confirm("Product Not Update "))
			{
				location="editproduct.jsp";
			}
		else
			{
				location="editproduct.jsp";
			}
		
	</script>
<%
	}
	
	}
	catch(Exception e)
	{
		out.println(e);
		
	}
 %>
