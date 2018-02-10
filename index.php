<?php

$servername = "localhost";
$username = "root";
$password = ""; 
$dbname = "cr10_hadasa_geiger_biglibrary";

// Create connection
$conn = mysqli_connect($servername, $username, $password, $dbname);

// Check connection
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error() . "\n");
}

// Escape user inputs for security

$publisher_name ="";
//if (isset($publisher_name)) {
  //$publisher_name =mysqli_real_escape_string($conn,$_GET['publisher']);
//}

// attempt query execution

$sql = "select Media.pk_Book_id, Media.Title as Title, Media.picture_url as Image, Media.ISBN as ISBN, Genre.Description as Genre, concat(Author.First_Name, ' ', Author.Last_Name) as Author, Publisher.Publisher_name as Publisher from Media inner join Genre  on Media.fk_Genre_id = Genre.pk_Genre_id inner join Author on Media.fk_Author_id = Author.pk_Author_id inner join Publisher on Media.fk_Publisher_id = Publisher.pk_Publisher_id";

if (isset($_GET['publisher'])) {
    $sql .= " where Publisher.Publisher_name like '%" . $_GET['publisher'] . "%'";
} 

$results = $conn->query($sql);       

$data=array();
while($row=$results->fetch_assoc())
{
    $data[] = $row;
}
?>


<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>My Media Thek</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/css/bootstrap.min.css" integrity="sha384-Zug+QiDoJOrZ5t4lssLdxGhVrurbmBWopoEl+M6BdEfwnCJZtKxi1KgxUyJq13dy" crossorigin="anonymous"> 
  <meta content="width=device-width, initial-scale=1" name="viewport">
  <link href="css/style.css" rel="stylesheet">

  <script
  src="https://code.jquery.com/jquery-3.2.1.min.js"
  integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
  crossorigin="anonymous"></script>
 <script>
  <?php

echo "var media = " . json_encode($data) . ";";

mysqli_close($conn);

?>
</script>

   <script src="js/script.js"></script> 
</head>
<!-- when the HTML loads, writeMedia() is called.
This function will write HTML to the div with  id="firstPos" --> 
<body onload="writeMedia()">

  <nav class="navbar navbar-toggleable-md navbar-light bg-faded">
  <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="index.php">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="register.php">Sign up</a>
      </li>
      <li class="nav-item">
         <a class="nav-link" href="login.php">Log in</a>
      </li>
      <li class="nav-item">
         <a class="nav-link" href="logout.php">Log out</a>
      </li>
       <li class="nav-item">
         <a class="nav-link" href="publishers.php">Publishers</a>
      </li>
    </ul>
    
  </div>
</nav>
  


<!-- <nav class="navbar navbar-expand-lg navbar-light bg-light paleTurquoise"> -->
  <!-- <a class="navbar-brand" href="#">My Mediatheque</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="#needs-validation">Add new medium</a>
      </li>
    </ul>
  </div>
</nav>  -->

  <div class="container videos pb-4">
    <!-- The media go here -->
    <div class="container video-row" id="firstPos">
    </div>
    </div>  
  </div>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/js/bootstrap.min.js" integrity="sha384-a5N7Y/aK3qNeh15eJKGWxsqtnX/wWdSZSKp+81YjTmS15nvnvxKHuzaWwXHDli+4" crossorigin="anonymous"></script>
</body>
</html>