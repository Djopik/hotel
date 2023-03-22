<?php
    require "dbconnect.php";
    $result = $conn->query("SELECT *  FROM guests") ;
    echo "<h2>Гости</h2>";
    while ($row = $result->fetch()) {
        echo $row['full_name']."<br>";

    }
