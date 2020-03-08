<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Changing user...</title>
</head>
<body>
    <main>
        <%
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/diceshop", "root", "");
            Statement s = connection.createStatement();
            request.setCharacterEncoding("UTF-8");
            // Updating user
            String query = "UPDATE user SET " +
                           "NomUse = '" + request.getParameter("name") + "'," +
                           "ApeUse = '" + request.getParameter("ApeUse") + "'," +
                           "CreUse = '" + request.getParameter("CreUse") + "'," +
                           "CiuUse = '" + request.getParameter("City") + "'," +
                           "StrUse = '" + request.getParameter("Street") + "'," +
                           "NumUse = " + Integer.valueOf(request.getParameter("number")) + "," +
                           "EmaUse = '" + request.getParameter("email") + "'," +
                           "NicUse = '" + request.getParameter("nick") + "'," +
                           "DatUse = '" + request.getParameter("date") + "'";

            query += "WHERE CodUse = " + Integer.valueOf(request.getParameter("id"));
            s.execute(query);
            out.println("<p>user has been modified succesfully</p>");
            response.sendRedirect("CRUDusers.jsp");
            %>
            <form action="CRUDusers.jsp" class="text-center">
                <input type="submit" value="Go to Manager">
            </form>   
    </main>
</body>
</html>