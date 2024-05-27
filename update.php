<?php
session_start();
if (!isset($_SESSION['username'])) {
    header("Location: login.php");
    exit;
}


$connect = mysqli_connect("localhost", "root", "", "sendngo") or die("Unable to connect");

$updateMessage = ""; // Initialize update message

if (isset($_POST['submit'])) {
    $customerID = $_POST['customerID'];
    $firstName = $_POST['firstName'];
    $midInitial = $_POST['midInitial'];
    $lastName = $_POST['lastName'];
    $password = $_POST['password'];

    $sql = "UPDATE Customer SET FName=?, MidInitial=?, LName=?, password=? WHERE CustomerID=?";
    $stmt = mysqli_prepare($connect, $sql);
    mysqli_stmt_bind_param($stmt, "ssssi", $firstName, $midInitial, $lastName, $password, $customerID);
    $success = mysqli_stmt_execute($stmt);

    if ($success) {
        $updateMessage = "Record updated successfully"; // Set update message
        header("refresh:2; url=main.php"); // Redirect to main.php after 2 seconds
    } else {
        $updateMessage = "Failed to update record"; // Set update message
    }
}

if (isset($_GET['id'])) {
    $id = $_GET['id'];
    $query = "SELECT * FROM Customer WHERE CustomerID=?";
    $stmt = mysqli_prepare($connect, $query);
    mysqli_stmt_bind_param($stmt, "i", $id);
    mysqli_stmt_execute($stmt);
    $result = mysqli_stmt_get_result($stmt);
    $row = mysqli_fetch_assoc($result);
}
?>

<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
    <meta charset="utf-8">
    <title>Update Customer Data</title>
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
        .update {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .update h2 {
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
        .message {
            text-align: center;
            margin-top: 10px;
            color: green;
        }
    </style>
</head>
<body>
<div class="update">
    <h2>Update Customer</h2>
    <div class="message"><?php echo $updateMessage; ?></div>
    <form action="" method="post" autocomplete="off">
        <div class="inputBx">
            <label for="customerID">Customer ID</label>
            <input type="text" name="customerID" value="<?php echo isset($row['CustomerID']) ? $row['CustomerID'] : ''; ?>" readonly>
        </div>
        <div class="inputBx">
            <label for="firstName">First Name</label>
            <input type="text" name="firstName" value="<?php echo isset($row['FName']) ? $row['FName'] : ''; ?>" required>
        </div>
        <div class="inputBx">
            <label for="midInitial">Middle Initial</label>
            <input type="text" name="midInitial" value="<?php echo isset($row['MidInitial']) ? $row['MidInitial'] : ''; ?>" maxlength="1" required>
        </div>
        <div class="inputBx">
            <label for="lastName">Last Name</label>
            <input type="text" name="lastName" value="<?php echo isset($row['LName']) ? $row['LName'] : ''; ?>" required>
        </div>
        <div class="inputBx">
            <label for="password">Password</label>
            <input type="password" name="password" value="<?php echo isset($row['password']) ? $row['password'] : ''; ?>" required>
        </div>
        <div class="inputBx">
            <input type="submit" name="submit" value="Update">
        </div>
    </form>
</div>
</body>
</html>
