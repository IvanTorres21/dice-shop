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
    <form action="createUser.jsp" method="POST">
        <div class="container w-25">
            <div class="row">
                <div class="col my-1">Name</div>
                <div class="col my-1">
                    <input type="text" name="name" required>
                </div>
            </div>
            <div class="row">
                <div class="col my-1">Surname</div>
                <div class="col my-1">
                    <input type="text" name="surname" required>
                </div>
            </div>
            <div class="row">
                <div class="col my-1">NickName</div>
                <div class="col my-1">
                    <input type="text" name="nick" required>
                </div>
                <small>You will use this name to log in</small>
            </div>
            <div class="row">
                <div class="col my-1">PassWord</div>
                <div class="col my-1">
                    <input type="password" name="pswd" required>
                </div>
            </div>
            <div class="row">
                <div class="col my-1">Email</div>
                <div class="col my-1">
                    <input type="text" name="email" required>
                </div>
            </div>
            <div class="row">
                <div class="col my-1">City</div>
                <div class="col my-1">
                    <input type="text" name="city" required>
                </div>
            </div>
            <div class="row">
                <div class="col my-1">Street</div>
                <div class="col my-1">
                    <input type="text" name="strt" required>
                </div>
            </div>
            <div class="row">
                <div class="col my-1">Number</div>
                <div class="col my-1">
                    <input type="text" name="number" required>
                </div>
            </div>
            <div class="row">
                <div class="col my-1">Date of Birth</div>
                <div class="col my-1">
                    <input type="date" name="date" required>
                </div>
            </div>
            <div class="row mx-auto">
                <div class="col my-2 text-center">
                    <input type="hidden" value="0" name="priv">
                    <input type="submit" value="Add">
                </div>
            </div>
        </div>
    </form>

</body>
</html>