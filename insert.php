<?php
session_start();
if (!isset($_SESSION['username'])) {
    header("Location: login.php");
    exit;
}

$connect = mysqli_connect("localhost", "root", "", "sendngo") or die("Unable to connect");

$insertMessage = ""; // Initialize insert message

if (isset($_POST['submit'])) {
    $customerID = $_POST['customerID'];
    $firstName = $_POST['firstName'];
    $midInitial = $_POST['midInitial'];
    $lastName = $_POST['lastName'];
    $password = $_POST['password'];

    $sql = "SELECT CustomerID FROM Customer WHERE FName = ? AND LName = ?";
    $stmt = mysqli_prepare($connect, $sql);
    mysqli_stmt_bind_param($stmt, "ss", $firstName, $lastName);
    mysqli_stmt_execute($stmt);
    $result = mysqli_stmt_get_result($stmt);
    $exists = mysqli_num_rows($result);

    if ($exists == 0) {
        $query = "INSERT INTO Customer (CustomerID, FName, MidInitial, LName, password) VALUES (?, ?, ?, ?, ?)";
        $stmt = mysqli_prepare($connect, $query);
        mysqli_stmt_bind_param($stmt, "issss", $customerID, $firstName, $midInitial, $lastName, $password);
        $success = mysqli_stmt_execute($stmt);

        if ($success) {
            $_SESSION['username_recent'] = $firstName;
            $insertMessage = "New record added successfully"; // Set insert message
            header("refresh:2; url=main.php"); // Redirect to main.php after 2 seconds
        } else {
            $insertMessage = "Failed to add new record"; // Set insert message
        }
    } else {
        $insertMessage = "Record already exists"; // Set insert message
    }
}
?>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
    <meta charset="utf-8">
    <title>Insert Customer Data</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .login {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .login h2 {
            margin-bottom: 20px;
            text-align: center;
        }
        .inputBx {
            margin-bottom: 15px;
        }
        .inputBx label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        .inputBx input[type="text"],
        .inputBx input[type="password"] {
            width: 100%;
            padding: 8px;
            border-radius: 4px;
            border: 1px solid #ccc;
            box-sizing: border-box;
        }
        .inputBx input[type="submit"] {
            width: 100%;
            padding: 10px;
            border: none;
            background-color: #007bff;
            color: #fff;
            cursor: pointer;
            border-radius: 4px;
        }
        .inputBx input[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<div class="login">
    <h2>Insert Customer</h2>
    <?php if (!empty($insertMessage)) : ?>
        <p><?php echo $insertMessage; ?></p>
    <?php endif; ?>
    <form action="" method="post" autocomplete="off">
        <div class="inputBx">
            <label for="customerID">Customer ID</label>
            <input type="text" name="customerID" required>
        </div>
        <div class="inputBx">
            <label for="firstName">First Name</label>
            <input type="text" name="firstName" required>
        </div>
        <div class="inputBx">
            <label for="midInitial">Middle Initial</label>
            <input type="text" name="midInitial" maxlength="1" required>
        </div>
        <div class="inputBx">
            <label for="lastName">Last Name</label>
            <input type="text" name="lastName" required>
        </div>
        <div class="inputBx">
            <label for="password">Password</label>
            <input type="password" name="password" required>
        </div>
        <div class="inputBx">
            <input type="submit" name="submit" value="Submit">
        </div>
    </form>
</div>
</body>
</html>
