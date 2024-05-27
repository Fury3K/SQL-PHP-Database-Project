<?php
session_start();

if (!isset($_SESSION['username'])) {
    header("Location: login.php");
    exit;
}

if (!isset($_GET['id']) || !is_numeric($_GET['id'])) {
    header("Location: display.php");
    exit;
}

$connect = mysqli_connect("localhost", "root", "", "sendngo") or die("Unable to connect");

$id = $_GET['id'];
$query = "DELETE FROM Customer WHERE CustomerID=?";
$stmt = mysqli_prepare($connect, $query);
mysqli_stmt_bind_param($stmt, "i", $id);
$success = mysqli_stmt_execute($stmt);

if ($success) {
    $_SESSION['delete_message'] = "Record deleted successfully";
} else {
    $_SESSION['delete_message'] = "Failed to delete record";
}

header("Location: display.php");
exit;
?>
