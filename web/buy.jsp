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
    <title>Buying</title>
</head>
<body>
    <%
        Class.forName("com.mysql.jdbc.Driver");
        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/diceshop", "root", "");
        Statement s = connection.createStatement();
        int codUse = Integer.parseInt(String.valueOf(session.getAttribute("user")));
        Cart cart =  (Cart) session.getAttribute("cart");
        int codRec = 1;
        if(cart.getDice() != null) {

            // First we insert into receipt
            ResultSet recList = s.executeQuery("SELECT * FROM receipt");
            recList.last();
            if (recList.getRow() != 0) {

                codRec = Integer.parseInt(recList.getString("CodRec")) + 1;  // we get the new Code  
            }
            String query = "INSERT INTO receipt " +
                            "VALUES ('" + codRec + "', '" + codUse + "', CURDATE())";
            s.executeUpdate(query);

            // Then we insert into det_receipt
            query = "INSERT INTO det_receipt VALUES ";
            for (Dice d : cart.getDice()) {

                query += "('" + d.getCodDic() +"', '" + codRec + "', '" + d.getPreDic() 
                        + "', '" + d.getCantidad() +"'),";
                // We take out the amount of dice that's been bought
                ResultSet aux = s.executeQuery("SELECT CanDic FROM dicesets WHERE CodDic = " + d.getCodDic());
                aux.last();
                String auxS = "UPDATE dicesets SET CanDic = " + (Integer.parseInt(aux.getString("CanDic")) - d.getCantidad())
                                + " WHERE CodDic = " + d.getCodDic();
                s.executeUpdate(auxS);
            }
            // We delete the last comma
            query = query.substring(0, query.length() -1);
            s.executeUpdate(query);
            // We take money out from the user
            ResultSet list = s.executeQuery("SELECT CreUse FROM user WHERE CodUse = " + codUse);
            list.last();
            query = "UPDATE user SET " 
                    + "CreUse = " + ((Double.parseDouble(list.getString("CreUse"))) - cart.getToPay()) 
                    + "WHERE CodUse = " + codUse;
            s.executeUpdate(query);
        }
            cart = null;
            session.setAttribute("cart", cart);
            response.sendRedirect("index.jsp");


    %>
</body>
</html>