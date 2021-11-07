<?php
include 'database.php';
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Guest</title>
</head>
<body>
    Hello Guest
    <table border=1px;>
        <tr>
            <th>Event Name</th>
            <th>Event Date</th>
            <th>Event Time</th>
            <th>Event Location</th>
        </tr>
        <tr>
<?php
$sql= "select * from eventdetail";
$result= mysqli_query($con, $sql);
//if ($result->num_rows>0){
while ($rows=$result->fetch_assoc())
{
?>
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