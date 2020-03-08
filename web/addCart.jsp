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
    <title>adding to Cart</title>
</head>
<body>
    <%
        Class.forName("com.mysql.jdbc.Driver");
        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/diceshop", "root", "");
        Statement s = connection.createStatement();
        int cod = Integer.parseInt(request.getParameter("dice"));
        ResultSet list = s.executeQuery("SELECT * FROM dicesets WHERE CodDic = " + cod);
        list.last();
        Dice dic = new Dice(cod, list.getString("NomDic"), Double.parseDouble(list.getString("PreDic")), 1);
        Cart cart =  (Cart) session.getAttribute("cart");
        cart.addDice(dic);
        session.setAttribute("cart", cart);
        response.sendRedirect("index.jsp");
    %>
</body>
</html>