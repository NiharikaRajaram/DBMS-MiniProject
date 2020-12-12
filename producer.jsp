<%-- 
    Document   : producer
    Created on : 26 Nov, 2018, 5:52:33 PM
    Author     : Rajaram
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Producer Details</title>
    </head>
    <style>
            input{
            width: 60%;
            padding: 12px 20px;
            margin: 8px 0;
            display: inline-block;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            }
            div {
            
            border-radius: 5px;
            background-color: #f2f2f2;
            padding: 20px;
            position: absolute;
            top:0;
            bottom: 0;
            left: 0;
            right: 0;

            margin: auto;
            }
        </style>
    <body>
        <div>
            <%@page import="java.sql.*" %>
            <%@page import="javax.sql.*" %>
            
            <%
             String title2 = (String)session.getAttribute("title");
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbmsproject?useSSL=false", "root", "niharikar@1");
            
            String Query = "select dob,gender from actor where title=?";
            PreparedStatement psmt = con.prepareStatement(Query);
            psmt.setString(1, title2);
                    
                    
            ResultSet rs = psmt.executeQuery();
            
           
                
            if(rs.next()){
               String owner = rs.getString("owner");
               String address = rs.getString("address");
               %>
               <% out.println(title2); %>
               <br>
               <% out.println(owner); %>
               <br>
               <% out.println(address); %>
               <br>
               <br>
               
               
               <% }
%>
        </div>
    </body>
</html>
