<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Modify Dice</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
        integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link rel="stylesheet" href="style/stylesheet.css">
</head>
<body>
    <header>
        <div class="bg-dark text-white p-3 text-center">
            <h1>Modify User</h1>
        </div>
    </header>
    <main>
        <%
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/diceshop", "root", "");
            Statement s = connection.createStatement();
            String query = "SELECT * FROM user WHERE CodUse = " + request.getParameter("id");
            ResultSet list = s.executeQuery(query);
            list.last();
        %>
        <form action="changeUser.jsp" method="POST">
            <div class="container w-25">
                <div class="row">
                    <div class="col my-1">Name</div>
                    <div class="col my-1">
                    <input type="text" name="name"  value="<%=list.getString("NomUse")%>" required>
                    </div>
                </div>
                <div class="row">
                    <div class="col my-1">Surname</div>
                    <div class="col my-1">
                    <input type="text" value="<%=list.getString("ApeUse")%>" name="ApeUse" required>
                    </div>
                </div>
                <div class="row">
                    <div class="col my-1">Credit</div>
                    <div class="col my-1">
                    <input type="number" min="0" value="<%=list.getString("CreUse")%>" name="CreUse" required>
                    </div>
                </div>
                <div class="row">
                    <div class="col my-1">City</div>
                    <div class="col my-1">
                    <input type="text" value="<%=list.getString("CiuUse")%>" name="City" required>
                    </div>
                </div>
                <div class="row">
                    <div class="col my-1">Street</div>
                    <div class="col my-1">
                    <input type="text" value="<%=list.getString("StrUse")%>" name="Street" required>
                    </div>
                </div>
                <div class="row">
                    <div class="col my-1">Number</div>
                    <div class="col my-1">
                    <input type="text" value="<%=list.getString("NumUse")%>" name="number" required>
                    </div>
                </div>
                <div class="row">
                    <div class="col my-1">Email</div>
                    <div class="col my-1">
                    <input type="text" value="<%=list.getString("EmaUse")%>" name="email" required>
                    </div>
                </div>
                <div class="row">
                    <div class="col my-1">Nickname</div>
                    <div class="col my-1">
                    <input type="text" value="<%=list.getString("NicUse")%>" name="nick" required>
                    </div>
                </div>
                <div class="row">
                    <div class="col my-1">Date of Birth</div>
                    <div class="col my-1">
                    <input type="date" value="<%=list.getString("DatUse")%>" name="date" required>
                    </div>
                </div>
                <div class="row mx-auto">
                    <div class="col my-2 text-center">
                        <input type="hidden" value="<%= request.getParameter("id")%>" name="id">
                        <input type="submit" value="Modify">
                    </div>
                </div>
            </div>
        </form>
    </main>
</body>
</html>