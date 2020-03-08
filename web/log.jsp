<%@page import="java.security.MessageDigest"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="javax.xml.bind.DatatypeConverter"%>



<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <%
        if (session.getAttribute("user") != null) {

            response.sendRedirect("index.jsp");
        }
        Class.forName("com.mysql.jdbc.Driver");
        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/diceshop", "root", "");
        Statement s = connection.createStatement();
        ResultSet list = s.executeQuery("SELECT * from user");
        String code = "";
        boolean admin = false;
        boolean logged = false;
        while (list.next() && !logged) {
            
            if ((list.getString("NicUse")).equals(request.getParameter("name"))){
            
                MessageDigest md = MessageDigest.getInstance("MD5");
                md.update((request.getParameter("pswd")).getBytes());
                String hash = DatatypeConverter.printHexBinary(md.digest());
                if ((list.getString("PasUse")).equals(hash)){
                    
                    code = list.getString("CodUse");
                    if ((list.getString("admin")).equals("1")) {

                        session.setAttribute("admin", "1");
                    } else {

                        session.setAttribute("admin", null);
                    }
                    logged = true;
                }
            }
        }
        if (logged) {

            session.setAttribute("user", code);
            response.sendRedirect("index.jsp");
        } else {

            response.sendRedirect("login.jsp");
        }
    %>
</body>
</html>