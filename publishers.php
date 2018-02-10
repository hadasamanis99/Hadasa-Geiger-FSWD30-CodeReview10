<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "cr10_hadasa_geiger_biglibrary";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$sql = "SELECT * FROM Publisher";
$result = $conn->query($sql);
if ($result->num_rows > 0) {
    echo "<table style='border: solid 1px black;'>";

    // output data of each row
    while($row = $result->fetch_assoc()) {
    	echo "<tr>";
        echo "<td> <a href=index.php?publisher=" . $row["Publisher_name"] . ">" . $row["Publisher_name"] . "</a></td><td>" . $row["Address"] . "</td>";
        echo "</tr>";
    }
    
} else {
    echo "0 results";
}
$conn->close();

?>

<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/css/bootstrap.min.css" integrity="sha384-Zug+QiDoJOrZ5t4lssLdxGhVrurbmBWopoEl+M6BdEfwnCJZtKxi1KgxUyJq13dy" crossorigin="anonymous"> 
</head>

	</html>

