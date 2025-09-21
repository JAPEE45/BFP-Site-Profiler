<?php
 include 'db.php';
$data = json_decode(file_get_contents("php://input"),true);
if($data){
    $fullname = $data['fullname'];
    $role = $data['role'];
    $email = $data['email'];
    $address = $data['address'];
    $password = $data['password'];
    $status = $data['status'];

    $stmt = $conn->prepare("INSERT INTO user (fullname, email, address, role, password, status) VALUES (?,?,?,?,?,?)");
    $stmt->bind_param("ssssss",$fullname, $email,$address,$role,$password,$status);
    if($stmt->execute()){
        echo json_encode(["success"=>"user has been added"]);
    }else{
        echo json_encode(["error"=> $stmt->error]);
    
    }
    
    $stmt->close();
    $conn->close();
}
?>