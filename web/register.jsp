<!DOCTYPE html>
<html>
    <head>
        <title>User Registration</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f2f2f2;
                padding: 20px;
            }

            h1 {
                text-align: center;
            }

            .registration-form {
                max-width: 400px;
                margin: 0 auto;
                background-color: #ffffff;
                border-radius: 5px;
                padding: 20px;
                box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
            }

            .registration-form label {
                display: block;
                margin-bottom: 10px;
            }

            .registration-form input[type="text"],
            .registration-form input[type="password"],
            .registration-form select {
                width: 100%;
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
            }

            .registration-form input[type="submit"] {
                width: 100%;
                padding: 10px;
                background-color: #4CAF50;
                color: #ffffff;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }

            .registration-form input[type="submit"]:hover {
                background-color: #45a049;
            }
        </style>
    </head>
    <body
        <div class="registration-form">
            <%
        // Check if the user is logged in

%>
        <h1>User Registration</h1>
        <form action="processRegister.jsp" method="post">
            <input type="text" name="firstName" value="First Name..." onfocus="if (this.value == 'First Name...')
                        this.value = '';" /><br/>
            <input type="text" name="lastName" value="Last Name..." onfocus="if (this.value == 'Last Name...')
                        this.value = '';" /><br/>
                    <input type="text" name="userName" placeholder="User Name" required /><br>
            <input type="password" name="password" placeholder="Password" required /><br>
            <select type="text" name="role" placeholder = "Role" required>
                <option type="text" value="admin">Admin</option>
                <option type="text" value="customer">Customer</option>
            </select><br>
            <input type="submit" value="Register">
        </form>
    </div>
</body>
</html>
