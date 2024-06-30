<?php

include "connect.php";



// Lấy dữ liệu từ POST request

$id = $_POST['id'];





// Chuẩn bị câu truy vấn

$query = 'DELETE FROM `sanphammoi` WHERE `id`='.$id;



// Thực thi câu truy vấn

$data = mysqli_query($conn, $query);



// Kiểm tra kết quả thực thi

if ($data) {

    $arr = [

        'success' => true,

        'message' => " Xóa thành công"

    

    ];

} else {

    $arr = [

        'success' => false,

        'message' => " Xóa không thành công"

    ];

}



// Trả về kết quả dưới dạng JSON

print_r(json_encode($arr));



?>