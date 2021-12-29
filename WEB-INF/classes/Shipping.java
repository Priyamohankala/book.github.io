import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
public class Shipping extends HttpServlet
{
	public void service(HttpServletRequest request,HttpServletResponse response)
	throws IOException,ServletException
	{
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
		try
		{
		String firstname=request.getParameter("first");
		String email=request.getParameter("email");
		String add=request.getParameter("address");
		String city=request.getParameter("city");
		String state=request.getParameter("state");
        String amount=request.getParameter("amount");

			Class.forName("com.mysql.jdbc.Driver");
			Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/test_db","root","Root");
			PreparedStatement ps=conn.prepareStatement("insert into shipping values(?,?,?,?,?,?)");
			ps.setString(1,firstname);
			ps.setString(2,email);
			ps.setString(3,add);
			ps.setString(4,city);
			ps.setString(5,state);
            ps.setString(6,amount);

			ps.executeUpdate();
			ps.close();
			conn.close();
            out.println("<body bg-color='pink' align='center'>");
            out.println("<img src='place.jpg' alt='Place Order'/>");
            out.println("<form action='closemsg.html'>");
            out.print("<button>Order</button>");
            out.print("</form>");
            out.print("</body>");
		}
		catch(Exception e)
		{
			out.println(e);
		}
	}
}
