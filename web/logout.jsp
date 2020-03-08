<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Logging out</title>
</head>
<body>
    <%
        session.setAttribute("user", null);
        session.setAttribute("admin", null);
        response.sendRedirect("index.jsp");
    %>
</body>
</html>