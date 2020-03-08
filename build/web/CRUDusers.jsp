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
                        <h1>User Management</h1>
                        <a class="btn btn-light" href="addUser.html">Add User</a>
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
                <div class="col">Name</div>
                <div class="col">Surname</div>
                <div class="col">NickName</div>
                <div class="col">Direction</div>
                <div class="col">Credit</div>
                <div class="col">Privilege</div>
                <div class="col">Date of Birth</div>
                <div class="col">Modify</div>
                <div class="col">Delete</div>
                </div>
            
            <!-- Lists -->
            <%
                ResultSet list = s.executeQuery("SELECT * FROM user");
                int i = 0;
                while(list.next()){
                    if (i % 2 == 0) {
                    out.println("\n<div class=\"row p-4\">");
                    } else {

                        out.println("\n<div class=\"row p-4 ImpRow\">");
                    }
                    out.println("<div class=\"col\">" + list.getString("CodUse") + "</div>");
                    out.println("<div class=\"col\">" + list.getString("NomUse") + "</div>");
                    out.println("<div class=\"col\">" + list.getString("ApeUse") + "</div>");
                    out.println("<div class=\"col\">" + list.getString("NicUse") + "</div>");
                    out.println("<div class=\"col\">" + list.getString("CiuUse") + 
                                ", " + list.getString("StrUse") + ", " + list.getString("NumUse") + 
                                "</div>");
                    out.println("<div class=\"col\">" + list.getString("CreUse") + "</div>");
                    if ((list.getString("admin")).equals("1")){

                        out.println("<div class=\"col\">Admin</div>");
                    } else {
                        out.println("<div class=\"col\">User</div>");
                    }           
                    out.println("<div class=\"col\">" + list.getString("DatUse") + "</div>");
                    
            %>
            <div class="col">
            <form action="modifyUser.jsp" method="GET">
                <input type="hidden" name="id" value="<%=list.getString("CodUse") %>">
                <input type="submit" value="Modify">
            </form>
            </div>
            <div class="col">
            <form action="deleteUser.jsp" method="POST">
                <input type="hidden" name="id" value="<%=list.getString("CodUse") %>">
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


