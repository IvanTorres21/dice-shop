<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.text.DecimalFormat"%>

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
        // Connecting to the database
        Class.forName("com.mysql.jdbc.Driver");
        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/diceshop", "root", "");
        Statement s = connection.createStatement();
        DecimalFormat form = new DecimalFormat("#0.00");
    %>
    <header>
        <div class="bg-dark text-white p-3 text-center">
            <div class="container">
                <div class="row">
                    <div class="col-10">
                        <h1>Receipt Management</h1>
                        <a class="btn btn-light" href="CRUDusers.jsp">User Management</a>
                        <a class="btn btn-light" href="CRUD.jsp">Dice Management</a>
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
                <div class="col">User</div>
                <div class="col">Date</div>
                <div class="col">Price</div>
                <div class="col">Details</div>
            </div>

            <!-- Lists -->
            <%
                String query = "SELECT R.CodRec, R.CodUse, R.DatRec, SUM((D.PreVen*D.CanDic)) AS 'pre'"
                                + " FROM receipt R JOIN det_receipt D ON (R.CodRec=D.CodRec)"
                                + " GROUP BY R.CodRec, R.CodUse, R.DatRec";
                ResultSet list = s.executeQuery(query);
                int i = 0;
                while(list.next()){
                    if (i % 2 == 0) {
                    out.println("\n<div class=\"row p-4\">");
                    } else {

                        out.println("\n<div class=\"row p-4 ImpRow\">");
                    }
                    out.println("<div class=\"col\">" + list.getString("CodRec") + "</div>");
                    out.println("<div class=\"col\">" + list.getString("CodUse") + "</div>");
                    out.println("<div class=\"col\">" + list.getString("DatRec") + "</div>");
                    out.println("<div class=\"col\">" + form.format(Double.parseDouble(list.getString("pre"))) + "</div>");
                    %>
                    <div class="col">
                        <form method="POST" action="recDet.jsp">
                            <input type="hidden" value="<%=list.getString("CodRec")%>" name="cod">
                            <input type="submit" value="Details">
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