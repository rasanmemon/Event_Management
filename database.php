<?php
$servername = "localhost";
$username="root";
$password ="";
$dbname="event_management";
//create connection
$con =mysqli_connect($servername, $username, $password,$dbname);
if ($con -> connect_error) {
die("connection failed:".$con->connect_error);
}
?>