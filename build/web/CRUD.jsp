<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Management</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
        integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link rel="stylesheet" href="style/stylesheet.css">
</head>

<body>
    <%
        if (session.getAttribute("admin") == null) {

            response.sendRedirect("index.jsp");
        }
        // Connecting to the database
        Class.forName("com.mysql.jdbc.Driver");
        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/diceshop", "root", "");
        Statement s = connection.createStatement();
    %>
    <header>
        <div class="bg-dark text-white p-3 text-center">
            <div class="container">
                <div class="row">
                    <div class="col-10">
                        <h1>Dice Management</h1>
                        <a class="btn btn-light" href="addDice.html">Add Dice</a>
                        <a class="btn btn-light" href="CRUDusers.jsp">User Management</a>
                        <a class="btn btn-light" href="ReceiptsManager.jsp">Receipts</a>
                    </div>
                    <div class="col mt-4">
                        <a class="btn btn-light" href="index.jsp">Go to Shop</a>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <main class="m-2">
        <!-- GRIDS FOR THE LIST-->
        <div class="container-fluid">
            <!-- First row-->
            <div class="row FirstRow p-4">
                <div class="col">Code</div>
                <div class="col">Name</div>
                <div class="col">Stock</div>
                <div class="col">Price</div>
                <div class="col">Description</div>
                <div class="col">Modify</div>
                <div class="col">Delete</div>
            </div>

            <!-- Lists -->
            <%
                ResultSet list = s.executeQuery("SELECT * FROM dicesets");
                int i = 0;
                while(list.next()){
                    if (i % 2 == 0) {
                    out.println("\n<div class=\"row p-4\">");
                    } else {

                        out.println("\n<div class=\"row p-4 ImpRow\">");
                    }
                    out.println("<div class=\"col\">" + list.getString("CodDic") + "</div>");
                    out.println("<div class=\"col\">" + list.getString("NomDic") + "</div>");
                    out.println("<div class=\"col\">" + list.getString("CanDic") + "</div>");
                    out.println("<div class=\"col\">" + list.getString("PreDic") + "</div>");
                    out.println("<div class=\"col\">" + list.getString("DesDic") + "</div>");
            %>
            <div class="col">
                <form action="modifyDice.jsp" method="GET">
                    <input type="hidden" name="id" value="<%=list.getString("CodDic") %>">
                    <input type="submit" value="Modify">
                </form>
            </div>
            <div class="col">
                <form action="DeleteDice.jsp" method="POST">
                    <input type="hidden" name="id" value="<%=list.getString("CodDic") %>">
                    <input type="submit" value="Delete">
                </form>
            </div>
            <%
                out.println("</div>");
                 i++;
               }
            %>
        </div>
        </div>
    </main>
</body>

</html>