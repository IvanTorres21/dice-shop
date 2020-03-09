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
            <h1>Modify Dice</h1>
        </div>
    </header>
    <main>
        <%
            if (session.getAttribute("admin") == null) {

            response.sendRedirect("index.jsp");
            }
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/diceshop", "root", "");
            Statement s = connection.createStatement();
            String query = "SELECT * FROM dicesets WHERE CodDic = " + request.getParameter("id");
            ResultSet list = s.executeQuery(query);
            list.last();
        %>
        <form action="ChangeDice.jsp" method="POST">
            <div class="container w-25">
                <div class="row">
                    <div class="col my-1">Dice Name</div>
                    <div class="col my-1">
                    <input type="text" name="name"  value="<%=list.getString("NomDic")%>" required>
                    </div>
                </div>
                <div class="row">
                    <div class="col my-1">Dice Price</div>
                    <div class="col my-1">
                    <input type="text" value="<%=list.getString("PreDic")%>" name="price" min="0" required>
                    </div>
                </div>
                <div class="row">
                    <div class="col my-1">Stock</div>
                    <div class="col my-1">
                    <input type="number" min="0" value="<%=list.getString("CanDic")%>" name="stock" required>
                    </div>
                </div>
                <div class="row">
                    <div class="col my-1">Description</div>
                    <div class="col my-1">
                    <input type="text" value="<%=list.getString("DesDic")%>" name="description" required>
                    </div>
                </div>
                <div class="row">
                    <div class="col my-1"> 
                    <input type="file"  name="image">
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