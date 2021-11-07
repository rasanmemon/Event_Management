<?php
include 'database.php';
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin</title>
</head>
<body>
    <form method="POST">
    <h1>Input</h1>
    <table border=1px; >
        <tr>
            <th>Event Name</th>
            <th>Event Date</th>
            <th>Event Time</th>
            <th>Event Location</th>
        </tr>
        <tr>
            <td><input type="text" name="event_name"></td>
            <td><input type="date" name="event_date"></td>
            <td><input type="time" name="event_time"></td>
            <td><input type="text" name="event_location"></td>
        </tr>
    </table>
    <button type="submit" class="signupbtn" name="submit">Submit</button>
    </form>
    <h1>Output</h1>
    <table border=1px;>
        <tr>
            <th>Event Name</th>
            <th>Event Time</th>
            <th>Event Date</th>
            <th>Event Location</th>
        </tr>
        <?php
$sql= "select * from eventdetail";
$result= mysqli_query($con, $sql);
//if ($result->num_rows>0){
while ($rows=$result->fetch_assoc())
{
?>
        <tr>
            <td><?php   echo $rows['Event_Name'] ?></td>
            <td><?php   echo $rows['Event_Time']  ?></td>
            <td><?php   echo $rows['Event_Date']?></td>
            <td><?php   echo $rows['Event_Location']?></td>
        </tr>
        <?php
}
?>
    </table>
</body>
</html>
<?php
if(isset($_POST['submit']))
{

       $ename = $_POST['event_name'];
       $edate = $_POST['event_date'];
       $etime = $_POST['event_time'];
       $elocation = $_POST['event_location'];
       
       
       $sql= "INSERT INTO eventdetail(Event_Name,Event_Time,Event_Date,Event_Location)
       VALUES('$ename','$etime','$edate','$elocation')";

       if(mysqli_query($con, $sql))
       {
           echo "record inserted successfully!";
            header('Location: Admin.php');

       }
       else {
           echo "Error inserting records!".mysqli_connect_error();
       }
      }
?>