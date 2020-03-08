<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.security.MessageDigest"%>
<%@page import="javax.xml.bind.DatatypeConverter"%>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Creation</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
        integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link rel="stylesheet" href="style/stylesheet.css">
</head>

<body>
    <main>
        <div class="text-center my-auto">
        <%
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/diceshop", "root", "");
            Statement s = connection.createStatement();
            int codUse = 0;
            double cred = 0;
            if (request.getParameter("id") == null){ // So that we assign an id to the user if it doesnt have one
                
                ResultSet aux = s.executeQuery("SELECT CodUse FROM user");
                aux.last();
                codUse = Integer.parseInt(aux.getString("CodUse")) + 1;
            } else {
                
                codUse = Integer.parseInt(request.getParameter("id"));
                cred = Integer.parseInt(request.getParameter("cred"));
            }
            String query = "SELECT CodUse FROM user WHERE CodUse = " + String.valueOf(codUse); //Making sure the ID isnt repeated
            ResultSet list = s.executeQuery(query);
            list.last();
            if (list.getRow() != 0) {

                out.println("<p>There already is an user with the ID: " + request.getParameter("id") + "</p>");
                %>
                    <a  class="btn btn-light" href="index.jsp">Go Back</a>
                <%
            }else {
                query = "SELECT * FROM `user` WHERE NicUse =  '" + request.getParameter("nick") + "'"; //Making sure the nickname isnt repeated
                list = s.executeQuery(query);
                list.last();
                if (list.getRow() != 0) {

                    out.println("<p>There already is an user with that nickname</p>");
                %>
                    <a  class="btn btn-light" href="index.jsp">Go Back</a>
                <%
                } else {
                    MessageDigest md  = MessageDigest.getInstance("MD5"); //Encrypt the password
                    md.update((request.getParameter("pswd")).getBytes());
                    String hash = DatatypeConverter.printHexBinary(md.digest());
                    query = "INSERT INTO user VALUES ('" + String.valueOf(codUse) //Insert the user
                            + "', '" + request.getParameter("name") 
                            + "', '" + request.getParameter("surname") 
                            + "', '" + request.getParameter("nick")
                            + "', '" + String.valueOf(cred)
                            + "', '" + hash 
                            + "', '" + request.getParameter("email")
                            + "', '" + request.getParameter("city")
                            + "', '" + request.getParameter("strt")
                            + "', '" + request.getParameter("number") 
                            + "', '" + request.getParameter("date")
                            + "', '" + request.getParameter("priv") + "')";
                            
                    s.execute(query);
                    out.println("<p>User has been added succesfully</p>");
                    response.sendRedirect("index.jsp");
                    %>
                    <a  class="btn btn-light" href="CRUDUsers.jsp">Go back to manager</a>
                    <%
                }
            }
        %>
        </div>
        
    </main>
</body> 
</html>