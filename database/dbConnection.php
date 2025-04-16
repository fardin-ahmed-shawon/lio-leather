<?php
$servername = "localhost";

// $username = "liooxzpx";
// $password = "NINW3QqomN7P";

$username = "root";
$password = "";

$database_name = "liooxzpx_lioo_leather";


$conn = mysqli_connect($servername, $username, $password, $database_name);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
} 
?>