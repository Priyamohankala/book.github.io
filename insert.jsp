<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%
Connection con;
try{
String first=request.getParameter("firstname");
String last=request.getParameter("lastname");
String add=request.getParameter("address");
String cityname=request.getParameter("city");
String statename=request.getParameter("state");
String countryname=request.getParameter("country");
String pincodeval=request.getParameter("pincode");
String usename=request.getParameter("username");
String passval=request.getParameter("password");
Class.forName("com.mysql.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/test_db","root","Root");
PreparedStatement ps=con.prepareStatement("insert into book1 values(?,?,?,?,?,?,?,?,?)");
ps.setString(1,first);
ps.setString(2,last);
ps.setString(3,add);
ps.setString(4,cityname);
ps.setString(5,statename);
ps.setString(6,countryname);
ps.setString(7,pincodeval);
ps.setString(8,usename);
ps.setString(9,passval);
ps.executeUpdate();
out.println("<h2>Record Registered Successfully...!</h2>");
out.println("<form action='http://localhost:8080/book31/login.html'>");
out.println("<input type='submit' value='redirect to website'>");
out.println("</form>");

con.close();
ps.close();
}
catch(Exception e)
{
	out.println(e);
}
%>