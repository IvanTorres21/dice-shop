<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dice Creation</title>
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
            String query = "SELECT CodDic FROM dicesets WHERE CodDic = " + request.getParameter("id");
            ResultSet list = s.executeQuery(query);
            list.last();
            if (list.getRow() != 0) {

                out.println("<p>There already is a dice set with the ID: " + request.getParameter("id") + "</p>");
                %>
                    <a  class="btn btn-light" href="addDice.jsp">Go back</a>
                <%
            } else {

                query = "INSERT INTO dicesets VALUES('" + request.getParameter("id") +"', '" + request.getParameter("name")
                        + "', '" + request.getParameter("price") +"', '" + request.getParameter("stock")
                        + "', '" + request.getParameter("description") + "', '" + request.getParameter("image")
                        + "')";
                s.execute(query);
                out.println("<p>Dice Set has been added succesfully</p>");
                %>
                    <a  class="btn btn-light" href="CRUD.jsp">Go back to manager</a>
                <%
            }
        %>
        </div>
        
    </main>
</body> 
</html>