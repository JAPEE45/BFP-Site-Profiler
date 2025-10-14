<?php
include_once 'db.php';
session_start();

$inspector_id = $_GET['user_id']; // change this depending on your session variable
$currentDate = date('Y-m-d');

// Query join between inspection and establishment
$sql = "
SELECT 
    i.id,
    e.name AS establishment,
    e.type,
    e.address,
    i.inspection_date AS inspectionDate,
    i.priority_level AS riskLevel,
    e.x_coordinate AS lat,
    e.y_coordinate AS lng,
    CASE
        WHEN STR_TO_DATE(i.inspection_date, '%Y-%m-%d') < '$currentDate' 
             AND i.status != 'completed' THEN 'overdue'
        ELSE i.status
    END AS status
FROM inspection i
JOIN establishment e ON i.establishment_id = e.id
WHERE i.inspector = '$inspector_id'
ORDER BY STR_TO_DATE(i.inspection_date, '%Y-%m-%d') ASC
";

$result = mysqli_query($conn, $sql);
$data = [];

if ($result && mysqli_num_rows($result) > 0) {
    while ($row = mysqli_fetch_assoc($result)) {
        $row['lat'] = (float)$row['lat'];
        $row['lng'] = (float)$row['lng'];
        $data[] = $row;
    }
}

echo json_encode($data);
