<?php

//upload.php
$base_url = 'http://localhost/marasielsy/public';
$abs_path='C:\xampp\htdocs\marasielsy\public';
if (isset($_POST["image"])) {
    $data = $_POST["image"];

    $image_array_1 = explode(";", $data);

    $image_array_2 = explode(",", $image_array_1[1]);

    $data = base64_decode($image_array_2[1]);

    $imageName = ((isset($_GET['title'])) ? $_GET['title'] : time()) . '.jpg';

    file_put_contents($abs_path.'/modules/drivers/uploads/drivers/' . $imageName, $data);

    echo "<img src='" . $base_url . "/modules/drivers/uploads/drivers/" . $imageName . "' class='img-thumbnail' />";
}
