<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%

String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "test_db";
String userid = "root";
String password = "Root";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<!DOCTYPE html>
<html>
    <head>
        <style>
            body
            {
                 background-color: palevioletred;
            }
       </style>
         <meta charset="utf-8">
         <meta name="viewport" content="width=device-width, initial-scale=1">
         <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
         <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
         <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
         <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
       
    </head>

<body align="center" style="background-color:palevioletred;">
    

<div class="container">
    <h3>Customer Records</h3>
<hr>
    <table class="table table-hover" border="1" align="center" style="background-color: darkorange;">
        <thead>

                <tr>
            <th><b>Name</b></th>
            <th><b>Last Name</b></th>
            <th><b>Address</b></th>
            <th><b>City</b></th>
            <th><b>State</b></th>
            <th><b>Country</b></th>
            <th><b>Pincode</b></th>
            <th><b>Username</b></th>
            <th><b>Password</b></th>
                
            </tr>
        
        </thead>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from book1";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>

<tbody>
<tr>
<td><%=resultSet.getString("name") %></td>
<td><%=resultSet.getString("lastname") %></td>
<td><%=resultSet.getString("Address") %></td>
<td><%=resultSet.getString("city") %></td>
<td><%=resultSet.getString("state") %></td>
<td><%=resultSet.getString("country") %></td>
<td><%=resultSet.getString("pincode") %></td>
<td><%=resultSet.getString("username") %></td>
<td><%=resultSet.getString("password") %></td>
</tr>
</tbody>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>

</table>
</div>
</body>
</html>