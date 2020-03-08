<%@page import="CRUD.Cart"%>
<%@page import="CRUD.Dice"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Deleting dice...</title>
</head>
<body>
    
    <%
        Cart cart = (Cart) (session.getAttribute("cart"));

        cart.delDice(Integer.parseInt(request.getParameter("cod")));
        response.sendRedirect("carrito.jsp");
    %> 
</body>
</html>