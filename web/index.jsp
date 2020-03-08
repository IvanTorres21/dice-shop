<%-- 
    Document   : index
    Created on : 23-feb-2020, 18:26:18
    Author     : ivan torres
--%>

<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="CRUD.Cart"%>
<%@page import="CRUD.Dice"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Dice Shop</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
        integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link rel="stylesheet" href="style/stylesheet.css">
</head>

<body>
    <%
    // Connecting to the database
    Class.forName("com.mysql.jdbc.Driver");
    Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/diceshop", "root", "");
    Statement s = connection.createStatement();
    // Create cart
    if (session.getAttribute("user") != null && session.getAttribute("cart") == null) {

        Cart cart = new Cart();
        session.setAttribute("cart", cart);
    }
    ResultSet list = s.executeQuery("SELECT * FROM dicesets");
    %>
    <div id="wrapper" class="mx-auto">
        <!-- NAVBAR -->
        <nav class="navbar navbar-expand-lg navbar-light bg-light sticky-top">
            <a class="navbar-brand" href="#"><img src="imagenes/logo.png" alt="logo" width="80"></a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item active">
                        <a class="nav-link" href="#sec1">Home <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#sec2">Shop</a>
                    </li>
                </ul>
            </div>
            <% if(session.getAttribute("admin") != null) {%>
                <a href="CRUD.jsp" class="btn btn-secondary my-2 my-sm-0 mx-2">Manager</a>
            <%} if(session.getAttribute("user") == null) {%>

                <a href="login.jsp" class="btn btn-secondary my-2 my-sm-0 mx-2">Log In</a>
            <% } else {%>   
                <a class="btn btn-secondary my-2 my-sm-0 mx-2" href="carrito.jsp">
                
                    <% 
                    Cart cart =  (Cart) session.getAttribute("cart");
                        if ((cart.getDice()).size() == 0) {%>

                            Cart 
                    <%} else {
                        
                        out.println("Cart (" + (cart.getDice()).size() + ")");
                        }
                    %>
                </a>
                <a class="btn btn-danger my-2 my-sm-0 mx-2" href="logout.jsp">Log out</a>
           <% }%>
        </nav>
        <main>
            <section id="sec1">
                <div class="jumbotron jumbotron-fluid m-0 mb-2 p-0">
                    <div class="container m-0 p-0">
                        <img style="width: inherit;" src="imagenes/home.png" alt="home">
                    </div>
                </div>
            </section>
            <section class="my-4" id="sec2">
                    <h2 class="text-center">Our collection</h2>
                    <!-- SHOP STUFF -->
                    <div class="container">
                        <div class="row">
                        <!-- Start of while -->
                            <% while(list.next()) {
                            if (Integer.parseInt(list.getString("CanDic")) > 0){
                            %>
                            <div class="col m-3">
                                <div class="card" style="width: 18rem;">
                                    <img src="imagenes/<%=list.getString("ImgDad")%>" class="card-img-top" alt="dice"
                                        height="200px">
                                    <div class="card-body">
                                        <h5 class="card-title"><%=list.getString("NomDic")%></h5>
                                        <p class="card-text"><%=list.getString("DesDic")%></p>
                                        <div class="container">
                                            <div class="row">
                                                <div class="col">
                                                    <p><%=list.getString("PreDic")%>€</p>
                                                </div>
                                                <div class="col-4">
                                                    <%if(session.getAttribute("user") != null) {%>
                                                    <form action="addCart.jsp" method="POST">
                                                        <input type="hidden" value="<%=list.getString("CodDic")%>"
                                                            name="dice">
                                                        <input type="submit" class="btn btn-primary ml-3" value="Buy">
                                                    </form>
                                                    <%} else {%>
                                                    <a href="login.jsp" class="btn btn-primary ml-3">Buy</a>
                                                    <%}%>
                                                        </div>
                                                    </div>
                                                  </div>
                                                </div>
                                            </div>
                                        </div>
                                        <%} } %>
                        <!-- End of while -->
                    </div>
            </section>
        </main>
    </div>

    <!-- JAVASCRIPT LINKS-->
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
        integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
        integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
        integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
        crossorigin="anonymous"></script>
</body>

</html>