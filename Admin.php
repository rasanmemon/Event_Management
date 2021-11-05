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
            <button type="submit" class="signupbtn" name="submit">Submit</button>
        </tr>
    </table>
    </form>
    <h1>Output</h1>
    <table border=1px;>
        <tr>
            <th>Event Name</th>
            <th>Event Date</th>
            <th>Event Time</th>
            <th>Event Location</th>
        </tr>
        <tr>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
    </table>
</body>
</html>
<?php
if(isset($_POST['submit']))
{

       $ename =$_POST['fname'];
       $edate =$_POST['lname'];
       $phone =$_POST['phone'];
       $cnic =$_POST['cnic'];
       $email=$_POST['email'];
       $psw=$_POST['psw'];
       
       $sql= "INSERT INTO guest(Guest_FName,Guest_LName,Guest_email,Guest_phone,Guest_CNIC,Guest_Password)
       VALUES('$fname','$lname','$email','$phone','$cnic','$psw')";

       if(mysqli_query($con, $sql))
       {
           echo "record inserted successfully!";
           header('Location: SignUp.php');

       }
       else {
           echo "Error inserting records!".mysqli_connect_error();
       }
      }
?>