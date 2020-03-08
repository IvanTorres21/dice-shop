<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
        integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link rel="stylesheet" href="style/stylesheet.css">
</head>

<body>
    <%  
        if (session.getAttribute("user") != null) {

        response.sendRedirect("index.jsp");
        } 
    %>
    <form action="log.jsp" method="POST" class="mx-auto w-50">
        <div class="form-group">
            <label for="name">Nickname</label>
            <input type="text" class="form-control" name="name" id="name">
          </div>
          <div class="form-group">
            <label for="pswd">Password</label>
            <input type="password" class="form-control" name="pswd" id="pswd">
          </div>
          <button type="submit" class="btn btn-primary">Log in</button>
          <a class="btn btn-secondary m-1" href="signup.jsp">Sign up</a>
    </form> <!-- name, pswd-->
</body>

</html>