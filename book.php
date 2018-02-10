<?php
$servername = "localhost";
$username = "root";
$password = "simanis";
$dbname = "cr10_hadasa_geiger_biglibrary";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
     die("Connection failed: " . $conn->connect_error);
}

$sql = "select Media.pk_Book_id, Media.Title as Title, Media.picture_url as Image, Genre.Description as Genre, " .
"Media.Language as Language, Media.ISBN as ISBN, Media.Pages as Pages, " .
"concat(Author.First_Name, ' ', Author.Last_Name) as Author, Publisher.Publisher_name as Publisher from Media " .
"inner join  Genre on Media.fk_Genre_id = Genre.pk_Genre_id " .
"inner join Author on Media.fk_Author_id = Author.pk_Author_id " .
"inner join Publisher on Media.fk_Publisher_id = Publisher.pk_Publisher_id " .
"where Media.pk_Book_id = " . $_GET['pk_Book_id'];

$result = $conn->query($sql);
if ($result->num_rows > 0) {
     echo "<table style='border: solid 1px black;'>";
     echo "<th>";
     echo 
"<td>Title</td><td>Genre</td><td>Language</td><td>Author</td><td>Publisher</td><td>ISBN</td><td>Pages</td>";
     echo "</th>";
     echo "<tr>";
     // output data of each row
     while($row = $result->fetch_assoc()) {
         echo "<td> " . $row["Title"] . "</td><td>" . $row["Genre"] . 
"</td><td>" . $row["Language"] . "</td><td>" . $row["Author"] .  
"</td><td>" . $row["Publisher"] . "</td><td>" . $row["ISBN"] . 
"</td><td>" . $row["Pages"] . "</td><br>";
     }
     echo "</tr>";
     echo "</table>";
     $sql2 = "select concat(Member.First_Name, ' ', Member.Last_Name) as User from Member " .
     "inner join  Member_book on Member_book.fk_Member_id = Member.pk_Member_id " .
     "inner join  Media on Member_book.fk_Book_id = Media.pk_Book_id where Media.pk_Book_id="  . $_GET['pk_Book_id'];
     $res = $conn->query($sql2);
     if ($res->num_rows > 0) {
         echo "<h3>Entlehnt von:</h3>";
         echo "<table style='border: solid 1px black;'>";
         echo "<th>";
         echo "<td>User</td>";
         echo "</th>";
         echo "<tr>";
         // output data of each row
         while($row = $res->fetch_assoc()) {
            echo "<td> " . $row["User"] . "</td><br>";
         }
         echo "</tr>";
         echo "</table>";
     }
} else {
     echo "0 results";
}
$conn->close();
?>
