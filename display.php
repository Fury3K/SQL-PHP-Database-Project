<?php
session_start();
if (!isset($_SESSION['username'])) {
    header("Location: login.php");
    exit;
}


$connect = mysqli_connect("localhost", "root", "", "sendngo") or die("Unable to connect");

$query = "SELECT * FROM Customer";
$result = mysqli_query($connect, $query);
?>

<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
    <meta charset="utf-8">
    <title>Display Customer Data</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            padding: 8px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #007bff;
            color: #fff;
        }
        tr:hover {
            background-color: #f5f5f5;
        }
        .action-links a {
            margin-right: 5px;
            text-decoration: none;
        }
        .action-links a:hover {
            color: #007bff;
        }
    </style>
</head>
<body>
<h2>Customer Records</h2>
<table>
    <thead>
        <tr>
            <th>Customer ID</th>
            <th>First Name</th>
            <th>Middle Initial</th>
            <th>Last Name</th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody>
        <?php
        while ($row = mysqli_fetch_assoc($result)) {
            echo "<tr>";
            echo "<td>" . $row['CustomerID'] . "</td>";
            echo "<td>" . $row['FName'] . "</td>";
            echo "<td>" . $row['MidInitial'] . "</td>";
            echo "<td>" . $row['LName'] . "</td>";
            echo "<td class='action-links'><a href='update.php?id=" . $row['CustomerID'] . "&username=" . $_SESSION['username'] . "'>Update</a>";
            echo "<a href='delete.php?id=" . $row['CustomerID'] . "' onclick='return confirm(\"Are you sure you want to delete this record?\")'>Delete</a></td>";
            echo "</tr>";
        }
        ?>
    </tbody>
</table>
</body>
</html>
