<%@page import="java.io.IOException"%>
<%@page import="javax.servlet.ServletException"%>
<%@page import="javax.servlet.http.Cookie"%>
<%@page import="javax.servlet.http.HttpServlet"%>
<%@page import="javax.servlet.http.HttpServletRequest"%>
<%@page import="javax.servlet.http.HttpServletResponse"%>
        <%
        
		// get request parameters for userID and password
        out.println("verfication process...");
		String book = request.getParameter("book1");
		String price = request.getParameter("price1");
	
			Cookie priceval = new Cookie("book",book);
            Cookie priceval = new Cookie("price",price);
			//setting cookie to expiry in 30 mins
			loginCookie.setMaxAge(30*60);
			response.addCookie(priceval);
            
			response.sendRedirect("display.jsp");
		

	
%>
