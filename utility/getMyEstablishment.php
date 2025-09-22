<?php
    include_once 'db.php';
    $data = json_decode(file_get_contents("php://input"),true);
    if($data){
        $business_name = $data['business_name'];
        $business_name = $data['business_name'];
        $business_name = $data['business_name'];
        $business_name = $data['business_name'];
    }else{
        echo json_encode(['error'=> "no data"]);
    }


?>