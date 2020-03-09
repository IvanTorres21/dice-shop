<%@page import="com.mysql.jdbc.StringUtils"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="CRUD.Cart"%>
<%@page import="CRUD.Dice"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Details</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
        integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link rel="stylesheet" href="style/stylesheet.css">
</head>
<body>
    
    <%
        if (session.getAttribute("admin") == null) {

            response.sendRedirect("index.jsp");
        }
        Class.forName("com.mysql.jdbc.Driver");
        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/diceshop", "root", "");
        Statement s = connection.createStatement();
        String query = "SELECT D.CodDic, D.PreVen, D.CanDic, R.NomDic FROM dicesets R JOIN det_receipt D ON (R.CodDic=D.CodDic) " +
                        "WHERE D.CodRec = " +  request.getParameter("cod");
        ResultSet list = s.executeQuery(query);
        Cart cart = new Cart();
        // Filling the cart
        while(list.next()) {
            int cod = Integer.parseInt(list.getString("CodDic"));
            String name = list.getString("NomDic");
            double pre = Double.parseDouble(list.getString("PreVen"));
            int cant = Integer.parseInt(list.getString("CanDic"));
            cart.addDice(new Dice(cod, name, pre, cant));
        }
    %>
    <div class="container w-50 my-3">
        <div class="row FirstRow p-2">
            <div class="col">Product
            </div>
            <div class="col">Amount</div>
            <div class="col">Price</div>
        </div>
        <%
            out.println(cart);
        %>
        <div class="row">
            <div class="col"></div>
            <div class="col">
                <a class="btn btn-light mx-2" href="ReceiptsManager.jsp">Go back</a>
            </div>
        </div> 
    </div>
</body>
</html>