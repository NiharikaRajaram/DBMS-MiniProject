<%-- 
    Document   : home
    Created on : 23 Nov, 2018, 7:36:51 PM
    Author     : Rajaram
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
        <%String filter = request.getParameter("filter"); %>
        <%String title = request.getParameter("title").toUpperCase();%>
         
                <h2><% out.println(title); %></h2>
       
        
    <%
            if(filter.equals("Actor")){
                session.setAttribute("title", title);
                response.sendRedirect("actor.jsp");
            }
            else if(filter.equals("Producer")){
                session.setAttribute("title", title);
                response.sendRedirect("producer.jsp");
            }
            else if(filter.equals("Director")){
                session.setAttribute("title", title);
                response.sendRedirect("director.jsp");
            }
            else{
                
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbmsproject?useSSL=false", "root", "niharikar@1");
            
            String Query = "select length, genre, language, year, dname, pname, aname, trailer_link from movie where title=?";
            PreparedStatement psmt = con.prepareStatement(Query);
            psmt.setString(1, title);
                    
                    
            ResultSet rs = psmt.executeQuery();
            
           
                
            if(rs.next()){
               int length = rs.getInt("length");
               String genre = rs.getString("genre");
               String language = rs.getString("language");
               int year = rs.getInt("year");
               String dname = rs.getString("dname");
               String pname = rs.getString("pname");
               String aname = rs.getString("aname");
               String trailer = rs.getString("trailer_link");
               
           
    %>
    <% out.println("Length:  " + length + " mins \n"); %>
    <br>
    <% out.println("Genre:  " + genre +"\n"); %>
    <br>
    <% out.println("Language:  "+ language +"\n"); %>
    <br>
    <% out.println("Year:  " + year +"\n"); %>
    <br>
    <% out.println("Director:  " + dname+"\n"); %>
    <br>
    <% out.println("Producer:  " + pname+"\n"); %>
    <br>
    <% out.println("Actor:  " + aname); %>
    <br>
    <br>
    Click <a href=<%= trailer %>>here</a> to watch the trailer.
    <br>
    <br>
    
          
            
    
    <%
    rs.close();
    con.close();
    psmt.close();
    }

}



%>
</div>
        </body>
</html>