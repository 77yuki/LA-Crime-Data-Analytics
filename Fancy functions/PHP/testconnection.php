<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MySQL Data in HTML</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        table, th, td {
            border: 1px solid black;
        }
        th, td {
            padding: 8px;
            text-align: left;
        }
    </style>
</head>
<body>
    <h1>Users</h1>
    <table>
        <thead>
            <tr>
                <?php
                // Database configuration
                $servername = "localhost"; // Enter your servername name or IP "normally localhost"
                $username = "root"; // Enter your user name, defult name is root
                $password = ""; // Enter your password
                $dbname = ""; // Enter your database name

                // Create connection
                $conn = new mysqli($servername, $username, $password, $dbname);

                // Check connection
                if ($conn->connect_error) {
                    die("Connection failed: " . $conn->connect_error);
                }

                // Query to fetch data from the table
                $sql = "SELECT * from （replace with your table name）"; // Enter the table name
                $result = $conn->query($sql);

                if ($result->num_rows > 0) {
                    // Fetch the field names
                    $fields = $result->fetch_fields();
                    foreach ($fields as $field) {
                        echo "<th>" . htmlspecialchars($field->name) . "</th>";
                    }
                    echo "</tr></thead><tbody>";

                    // Output data of each row
                    while($row = $result->fetch_assoc()) {
                        echo "<tr>";
                        foreach ($row as $data) {
                            echo "<td>" . htmlspecialchars($data) . "</td>";
                        }
                        echo "</tr>";
                    }
                    echo "</tbody>";
                } else {
                    echo "<tr><td colspan='4'>No records found</td></tr>";
                }
                $conn->close();
                ?>
            </tr>
        </thead>
    </table>
</body>
</html>
