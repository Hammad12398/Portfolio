<?php

$servername = "	230216770.cs2410-web01pvm.aston.ac.uk";
$username = "	u-230216770";
$password = "/tVNIRvtEXRahG/R";
$database = "aproject"; 

// Create connection
$conn = new mysqli($servername, $username, $password, $database);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// SQL query to retrieve data from the projects table
$sql = "SELECT * FROM projects";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    // Output data of each row
    while ($row = $result->fetch_assoc()) {
        echo "Project ID: " . $row["pid"] . "<br>";
        echo "Title: " . $row["title"] . "<br>";
        echo "Start Date: " . $row["start_date"] . "<br>";
        echo "End Date: " . $row["end_date"] . "<br>";
        echo "Phase: " . $row["phase"] . "<br>";
        echo "Description: " . $row["description"] . "<br>";
        echo "User ID: " . $row["uid"] . "<br>";
        echo "<hr>";
    }
} else {
    echo "0 results";
}

// Close connection
$conn->close();
?>
