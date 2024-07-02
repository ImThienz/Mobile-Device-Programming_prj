<?php
include "connect.php";

// Kiểm tra kết nối
if ($conn->connect_error) {
    $arr = [
        'success' => false,
        'message' => "Kết nối cơ sở dữ liệu thất bại: " . $conn->connect_error
    ];
    echo json_encode($arr);
    exit();
}

// Lấy dữ liệu từ POST request và tránh SQL Injection
$tensp = mysqli_real_escape_string($conn, $_POST['tensp']);
$gia = mysqli_real_escape_string($conn, $_POST['gia']);
$hinhanh = mysqli_real_escape_string($conn, $_POST['hinhanh']);
$mota = mysqli_real_escape_string($conn, $_POST['mota']);
$loai = mysqli_real_escape_string($conn, $_POST['loai']);
$id = mysqli_real_escape_string($conn, $_POST['id']);

// Chuẩn bị câu truy vấn
$query = 'UPDATE `sanphammoi` SET `tensp`="'.$tensp.'", `giasp`="'.$gia.'", `hinhanh`="'.$hinhanh.'", `mota`="'.$mota.'", `loai`="'.$loai.'" WHERE `id`='.$id;

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
        'message' => "Không thành công: " . mysqli_error($conn)
    ];
}

// Trả về kết quả dưới dạng JSON
header('Content-Type: application/json');
echo json_encode($arr);

// Đóng kết nối
mysqli_close($conn);
?>
