import java.io.*;
import java.util.*;
import javax.servlet.http.*;
import javax.servlet.*;
import java.sql.*;
public class Order extends HttpServlet
{
public void service(HttpServletRequest request,HttpServletResponse response)
throws IOException,ServletException
{
response.setContentType("text/html");
PrintWriter out=response.getWriter();
try
{
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/test_db","root","Root");
	PreparedStatement ps=conn.prepareStatement("select * from shipping");
	ResultSet rs = ps.executeQuery();
	out.println("<table border='2'>");
	out.println("<tr>");
	out.println("<td>Name</td>");
	out.println("<td>Email-id</td>");
	out.println("<td>Address</td>");
	out.println("<td>City</td>");
	out.println("<td>State</td>");
    out.println("<td>Amount</td>");

	out.println("</tr>");
	
	while(rs.next())
	{
		
		out.println("<tr>");
		out.print("<td>"+rs.getString(1)+"</td>");
		
	
		out.print("<td>"+rs.getString(2)+"</td>");
		
		out.print("<td>"+rs.getString(3)+"</td>");
		
		out.print("<td>"+rs.getString(4)+"</td>");
		
		out.print("<td>"+rs.getString(5)+"</td>");
        out.print("<td>"+rs.getString(6)+"</td>");
		

		out.print("</tr>");
		
		
	}
	out.println("</table>");
	rs.close();
	conn.close();
}
catch(Exception e)
{
	out.println(e);
}
}
}