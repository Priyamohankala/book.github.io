import java.io.*;
import java.util.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
public class Log extends HttpServlet{

public void service(HttpServletRequest request,HttpServletResponse response)
throws ServletException,IOException
{
Connection dbconn=null;
Statement stm=null;
//PreparedStatement ps=null;
ResultSet rs=null;
response.setContentType("text/html");
PrintWriter out=response.getWriter();


try{
Class.forName("com.mysql.jdbc.Driver");
String URL="jdbc:mysql://localhost:3306/test_db";
dbconn=DriverManager.getConnection(URL,"root","Root");

String use= request.getParameter("username1");
String pass=request.getParameter("password1");
String query="select * from book1 where username='"+use+"' and password='"+pass+"'";
stm=dbconn.createStatement();
rs=stm.executeQuery(query);

if(rs.next())
{

try{
	
/*String a=rs.getString(name);
String b=rs.getString(lastname);
String c=rs.getString(Address);
String d=rs.getString(city);
String e=rs.getString(state);
String f=rs.getString(country);
String g=rs.getString(pincode);
String h=rs.getString(username);
String i=rs.getString(password);
*/
out.println("<html>");
out.print("<head>");

out.println("<link rel='stylesheet' href='style.css' type='text/css'>");

out.print("</head>");
out.println("<body align='center'>");
out.println("<b>customer Details<b>");
out.println("<form align='center'>");
out.println("<table border=2 align='center'>");
out.println("<tr>");
out.print("<td>Name</td>");
out.print("<td>"+rs.getString(1)+"</td>");
out.println("</tr>");
out.println("<tr>");
out.print("<td>LastName</td>");
out.print("<td>"+rs.getString(2)+"</td>");
out.println("</tr>");
out.println("<tr>");
out.print("<td>Address</td>");
out.print("<td>"+rs.getString(3)+"</td>");
out.println("</tr>");
out.println("<tr>");
out.print("<td>city</td>");
out.print("<td>"+rs.getString(4)+"</td>");
out.println("</tr>");
out.println("<tr>");
out.print("<td>state</td>");
out.print("<td>"+rs.getString(5)+"</td>");
out.println("</tr>");
out.println("<tr>");
out.print("<td>country</td>");
out.print("<td>"+rs.getString(6)+"</td>");
out.println("</tr>");
out.println("<tr>");
out.print("<td>pincode</td>");
out.print("<td>"+rs.getString(7)+"</td>");
out.println("</tr>");
out.println("<tr>");
out.print("<td>username</td>");
out.print("<td>"+rs.getString(8)+"</td>");
out.println("</tr>");
out.println("<tr>");
out.print("<td>Password</td>");
out.print("<td>"+rs.getString(9)+"</td>");
out.println("</tr>");
out.println("</table>");
/*out.println(rs.getString("name"));
out.println(rs.getString("lastname"));
out.println(rs.getString("Address"));
out.println(rs.getString("city"));
out.println(rs.getString("state"));
out.println(rs.getString("country"));
out.println(rs.getString("username"));
out.println(rs.getString("password"));
*/

out.println("</form>");
out.println("<form action='http://localhost:8080/book31/OnlineBook.html'>");
out.println("<b>Successfully logged in<b>");
out.println("<input type='submit' value='Redirect to website' name='sub'>");

out.println("</form>");
out.println("</body>");
out.println("</html>");
}
catch(Exception e)
{
	
	out.println("Please first register yourself");
	response.sendRedirect("http://localhost:8080/book31/Registration.html");
	
}

}
rs.close();
dbconn.close();
}catch(Exception e)
{
	out.println("<html>");
	out.println("<script>");
	out.print("alert('username or password is incorrect')");
	out.println("</script>");
	out.println("</html>");
out.println("username or password is incorrect");
out.println("<form action='Registration.html'>");
out.print("<input type='submit' value='Register' name='register'/>");
out.println("</form>");

}

}
}