<?php
include 'database.php';
?>
<!DOCTYPE html>
<html>
<style>
body {font-family: Arial, Helvetica, sans-serif;}
* {box-sizing: border-box}

/* Full-width input fields */
input[type=text], input[type=password] {
  width: 100%;
  padding: 15px;
  margin: 5px 0 22px 0;
  display: inline-block;
  border: none;
  background: #f1f1f1;
}

input[type=text]:focus, input[type=password]:focus {
  background-color: #ddd;
  outline: none;
}

hr {
  border: 1px solid #f1f1f1;
  margin-bottom: 25px;
}

/* Set a style for all buttons */
button {
  background-color: #04AA6D;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
  opacity: 0.9;
}

button:hover {
  opacity:1;
}

/* Extra styles for the cancel button */
.cancelbtn {
  padding: 14px 20px;
  background-color: #f44336;
}

/* Float cancel and signup buttons and add an equal width */
.cancelbtn, .signupbtn {
  float: left;
  width: 50%;
}

/* Add padding to container elements */
.container {
  padding: 16px;
}

/* Clear floats */
.clearfix::after {
  content: "";
  clear: both;
  display: table;
}

/* Change styles for cancel button and signup button on extra small screens */
@media screen and (max-width: 300px) {
  .cancelbtn, .signupbtn {
     width: 100%;
  }
}
</style>
<body>

<form action="" style="border:1px solid #ccc" method="POST">
  <div class="container">
    <h1>Login</h1>
   
    <hr>

    <label for="email"><b>Email</b></label>
    <input type="text" placeholder="Enter Email" name="email" required>

    <label for="psw"><b>Password</b></label>
    <input type="password" placeholder="Enter Password" name="psw" required>

    
    
    <label>
      <input type="checkbox" checked="checked" name="remember" style="margin-bottom:15px"> Remember me
    </label>
    
    

    <div class="clearfix">
      <a href="SignUp.html"><button type="button" class="cancelbtn">Sign Up </button></a>
      <button type="submit" class="signupbtn" name="submit">Login</button>
    </div>
  </div>
</form>

</body>
</html>
<?php
// if(isset($_POST['submit']))
// {
//   $result =  NULL;
//   $username = $_POST["email"];
//   $password = hash('sha512',$_POST["psw"]);
//   $check_query = mysqli_prepare($con , "SELECT * from `guest` where `Guest_email` = ? AND `Guest_Password` = ? ");
//   $check_query->bind_param('ss', $username , $password);
//   $check_query->execute();
//   $result = $check_query->get_result();
//   if(mysqli_num_rows($result) > 0)
//   {
//     // header("Location: index.php");  Uncommit this to redirect to index page and remove below code.
//     return true;
//   }
// }


if(isset($_POST['submit']))
{
  $result =  NULL;
  $username = $_POST["email"];
  $check_query = mysqli_prepare($con , "SELECT * from `guest` where `Guest_email` = ? ");
  $check_query->bind_param('s', $username);
  $check_query->execute();
  $result = $check_query->get_result();
  if(mysqli_num_rows($result) > 0)
  {
    foreach($result as $row)
    {
      $db_password = $row["Guest_Password"];
      // if($db_password == hash('sha512',$_POST["psw"]))
      if($db_password == $_POST["psw"])
      {
        echo "1";
        // return true;
      }else
      {
        echo "Incorrect Password";
      }
    }
     header("Location: Guest.php");  //Uncommit this to redirect to index page and remove below code.
    return true;
  }else
  {
    echo "Email does not exist";
  }
}
?>
