<?php

$servername="localhost";
$username="root";
$password="duke";
$dbname="ssn";

$conn=mysqli_connect($servername,$username,$password,$dbname);

if($conn)
       echo "connection successfull";              
else
        die("connection failed".mysqli_connect_error());

$user=$_POST['username'];
$pass=$_POST['password'];

$query="select * from login where username='$user' and password='$pass'";
$result=mysqli_query($conn,$query)
   or die("failed to query".mysqli_error());

$row=mysqli_num_rows($result);

if($row==1) {
     system("/var/www/html/script.sh");
 
     header('Location: cont.html');
exit;

}

 else{
     header('Location: wrong.html');
}

?>	
