<%@page import="java.io.IOException"%>
<%@page import="javax.servlet.ServletException"%>
<%@page import="javax.servlet.http.Cookie"%>
<%@page import="javax.servlet.http.HttpServlet"%>
<%@page import="javax.servlet.http.HttpServletRequest"%>
<%@page import="javax.servlet.http.HttpServletResponse"%>
        <%
        String userID = "Priya";
	String password = "123";
		// get request parameters for userID and password
        out.println("verfication process...");
		String user = request.getParameter("username1");
		String pwd = request.getParameter("password1");
		if(userID.equals(user) && password.equals(pwd)){
			Cookie loginCookie = new Cookie("user",user);
			//setting cookie to expiry in 30 mins
			loginCookie.setMaxAge(30*60);
			response.addCookie(loginCookie);
            
			response.sendRedirect("selectrecord.jsp");
		}else{
			
		   
			out.println("<font color=red>Either user name or password is wrong.</font>");
		
		}

	
%>
