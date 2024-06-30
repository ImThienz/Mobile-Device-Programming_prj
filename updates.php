<?php
include "connect.php";

// Lấy dữ liệu từ POST request
$tensp = $_POST['tensp'];
$gia = $_POST['gia'];
$hinhanh = $_POST['hinhanh'];
$mota = $_POST['mota'];
$loai = $_POST['loai'];
$id=$_POST['id'];

// Chuẩn bị câu truy vấn
$query = 'UPDATE `sanphammoi` SET,`tensp`="'.$tensp.'",`giasp`="'.$gia.'",`hinhanh`="'.$hinhanh.'",`mota`="'.$mota.'",`loai`="'.$loai.'" WHERE `id`='.$id;

// Thực thi câu truy vấn
$data = mysqli_query($conn, $query);

// Kiểm tra kết quả thực thi
if ($data) {
    $arr = [
        'success' => true,
        'message' => "Thành công"
    
    ];
} else {
    $arr = [
        'success' => false,
        'message' => "Không thành công"
    ];
}

// Trả về kết quả dưới dạng JSON
print_r(json_encode($arr));

?>
