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
</head>
<body>
    <main>
        <%
            if (session.getAttribute("admin") == null) {

            response.sendRedirect("index.jsp");
            }
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/diceshop", "root", "");
            Statement s = connection.createStatement();
            request.setCharacterEncoding("UTF-8");
            String img = "";
            if ((request.getParameter("image")).equals("")) {

                String getImg = "SELECT ImgDad FROM dicesets WHERE CodDic = " + request.getParameter("id");
                ResultSet list = s.executeQuery(getImg);
                list.last();
                img = list.getString("ImgDad");
                
            } else {

                img = request.getParameter("image");
                
            }
            String query = "UPDATE dicesets SET " +
                           "NomDic = '" + request.getParameter("name") + "'," +
                           "PreDic = " + Double.valueOf(request.getParameter("price")) + "," +
                           "CanDic = " + Integer.valueOf(request.getParameter("stock")) + "," +
                           "DesDic = '" + request.getParameter("description") + "'"
                          + ",ImgDad = '" + img + "'";

            query += "WHERE CodDic = " + Integer.valueOf(request.getParameter("id"));
            s.execute(query);
            out.println("<p>Dice Set has been modified succesfully</p>");
            %>
            <form action="CRUD.jsp" class="text-center">
                <input type="submit" value="Go to Manager">
            </form>   
    </main>
</body>
</html>