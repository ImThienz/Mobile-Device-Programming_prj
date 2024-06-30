<?php  

include "connect.php";

$target_dir = "uploads/";  

// name

$query = "select max(id) as id from sanphammoi";

$data = mysqli_query($conn, $query);

$result = array();

while ($row = mysqli_fetch_assoc($data)) {

    $result[] = ($row);

}

print_r($result);



if ($result[0]['id']==null){

    $name = 1;

}else{

    $name = ++$result[0]['id'];

}

$name = $name.".jpg";

$target_file_name = $target_dir .$name;  

if (isset($_FILES["file1"]))  

   {  

   if (move_uploaded_file($_FILES["file1"]["tmp_name"], $target_file_name)  )

      {  

        $arr = [

            'success' => true,

            'message' => "Thành công",

            "name" =>$name

        ];  

      }  

   else  

      {  

        $arr = [

            'success' => true,

            'message' => " Không thành công"

        ]; 

      }  

   }  

else  

   {  

    $arr = [

        'success' => false,

        'message' => "không được"

    ];  

   }  

   $response["success"] = $success;  

   $response["message"] = $message;  

   echo json_encode($response);  

?>  