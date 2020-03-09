<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up</title>
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
    <form action="createUser.jsp" method="POST" class="mx-auto w-50 my-4">
        <div class="form-group">
            <label for="name">Name</label>
            <input type="text" class="form-control" name="name" id="name">
        </div>
        <div class="form-group">
            <label for="sname">Surname</label>
            <input type="text" class="form-control" name="surname" id="sname">
        </div>
        <div class="form-group">
            <label for="nick">Nickname</label>
            <input type="text" class="form-control" name="nick" id="nick">
            <small>You will use this name to log in</small>
        </div>
        <div class="form-group">
            <label for="pswd">PassWord</label>
            <input type="password" class="form-control" name="pswd" id="pswd">
        </div>
        <div class="form-group">
            <label for="email">Email</label>
            <input type="text" class="form-control" name="email" id="email">
        </div>
        <div class="form-group">
            <label for="city">City</label>
            <input type="text" class="form-control" name="city" id="city">
        </div>
        <div class="form-group">
            <label for="strt">Street</label>
            <input type="text" class="form-control" name="strt" id="strt">
        </div>
        <div class="form-group">
            <label for="number">Number</label>
            <input type="text" class="form-control" name="number" id="number">
        </div>
        <div class="form-group">
            <label for="date">Date of Birth</label>
            <input type="date" class="form-control" name="date" id="date">
        </div>
        <button type="submit" class="btn btn-primary">Sign up</button>
        <a class="btn btn-danger m-1" href="login.jsp">Go back</a>
    </form>

</body>

</html>