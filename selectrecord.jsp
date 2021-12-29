<!DOCTYPE html>
<html>

<head>
<title>Login Success Page</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<meta charset="utf-8">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<style>
     body
     {
          background-image: url(hello.jpeg);
        background-repeat: no-repeat;
        background-size: cover;
     }
</style>
</head>
<body>
<%
String userName = null;
Cookie[] cookies = request.getCookies();
if(cookies !=null){
for(Cookie cookie : cookies){
	if(cookie.getName().equals("user")) 
     userName = cookie.getValue();
}
}
if(userName == null) 
 response.sendRedirect("logadmin.html");
%>
<div class="container">  <p class="bg-success text-white"><h3>Hi <%=userName %>, Login successful.</h3></p>
</div>
<br>
<form action="view.jsp">
<input type="submit" class="btn btn-success" value="view all records" >
</form>
</body>
</html>
