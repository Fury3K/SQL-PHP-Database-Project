<?php
    session_start();
    $username = "testUser";
    $password = "123456";  
    $loginSuccessful = false;
    if(isset($_POST['btnLogin'])) {
        if($_POST['txtUsername'] == $username && $_POST['txtPassword'] == $password) {
            $loginSuccessful = true;
        } else {
            echo "Invalid Login!";
        }
    }
    
    if ($loginSuccessful) {
        $_SESSION['username'] = $_POST['txtUsername']; 
        header("Location: main.php"); 
        exit;
    }
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Simple GUI</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background-color: #f5f5f5;
        }
        form {
            width: 300px;
            padding: 20px;
            background-color: #fff;
            border: 1px solid #ccc;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            font-size: 16px;
        }
        input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #4CAF50;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <form id="loginForm" onsubmit="return validateForm()" method="post">
        <label for="username">Username:</label>
        <input type="text" id="username" name="txtUsername">

        <label for="password">Password:</label>
        <input type="password" id="password" name="txtPassword">

        <input type="submit" name="btnLogin" value="Login">
    </form>

    <script>
        function validateForm() {
            const username = document.getElementById("username").value;
            const password = document.getElementById("password").value;
            const usernameCorrect = username === "testUser";
            const passwordCorrect = password === "123456";

            if (usernameCorrect && passwordCorrect) {
                alert("Correct!");
                return true;
            } else {
                alert("Invalid Login!");
                return false;
            }
        }
    </script>
</body>
</html>
