<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="CRUD.Cart"%>
<%@page import="CRUD.Dice"%>
<%@page import="java.text.DecimalFormat"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Carrito</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
        integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link rel="stylesheet" href="style/stylesheet.css">
</head>
<body>

    <%
        Class.forName("com.mysql.jdbc.Driver");
        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/diceshop", "root", "");
        Statement s = connection.createStatement();
        int codUse = Integer.parseInt(String.valueOf(session.getAttribute("user")));
        ResultSet list = s.executeQuery("SELECT * FROM user WHERE CodUse = " + codUse);
        list.last();
        Cart cart =  (Cart) session.getAttribute("cart");
        DecimalFormat form = new DecimalFormat("#0.00");
        if ((cart.getDice()).size() != 0) {
    %>
    <div class="container w-50">
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
            <div class="col">Your Balance: </div>
            <div class="col">
                <%
                    out.println(form.format(Double.parseDouble(list.getString("CreUse"))));
                %>
            </div>
        </div>
        <div class="row">
            <div class="col"></div>
            <div class="col">
                <a class="btn btn-light mx-2" href="index.jsp">Go back</a>
            </div>
            <% if(Double.parseDouble(list.getString("CreUse")) >= (cart.getToPay())) { %>
            <div class="col">
                <a class="btn btn-light mx-2" href="buy.jsp">Buy</a>
            </div>
            <%} else {%>
            <div class="col">
                <p class="btn btn-light mx-2">Not enough credit</p>
            </div>
            <%}%>
        </div> 
    </div>
    <!-- If the user doesn't have any item in their cart they are redirected to index.jsp -->
    <% } else {

            response.sendRedirect("index.jsp");
    }
    %> 
</body>
</html>