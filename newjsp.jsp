<%-- 
    Document   : newjsp
    Created on : 13 Nov, 2018, 9:42:46 PM
    Author     : Rajaram
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@page import="java.sql.*" %>
        <%@page import="javax.sql.*" %>
        <%
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbmsproject?useSSL=false", "root", "niharikar@1");
            
            CallableStatement callstat = con.prepareCall(" {call reg(?,?)}");
            
            callstat.setString(1,email);
            callstat.setString(2, password);
            
            ResultSet rs = callstat.executeQuery();
            con.close();
            callstat.close();
            response.sendRedirect("login.html");
        %>
    </body>
</html>
