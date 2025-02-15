<?php

session_start();
$error = '';
if (!isset($_SESSION['user_data'])) {
    header("Location:index.php");
}
require_once "database/ChatUser.php";
$user_obj = new ChatUser;
$user_id = '';
foreach ($_SESSION['user_data'] as $key => $value) {
    $user_id = $value['id'];
}
$user_obj->setUserId($user_id);
$user_data = $user_obj->get_user_data_by_id();
$message = '';
if (isset($_POST['edit'])) {
    $user_profile = $_POST['hidden_user_profile'];
    if ($_FILES['user_profile']['name'] != '') {
        $user_profile = $user_obj->upload_image($_FILES['user_profile']);
        $_SESSION['user_data'][$user_id]['profile'] = $user_profile;
    }
    $user_obj->setUserName($_POST['user_name']);
    $user_obj->setUserEmail($_POST['user_email']);
    $user_obj->setUserPassword($_POST['user_password']);
    $user_obj->setUserProfile($user_profile);
    $user_obj->setUserId($user_id);

    if ($user_obj->update_data()) {
        $message = '<div class="alert alert-success">Profile Details Updated</div>';
    }
}
?>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title> Chat Applicationin php using Websocket programming</title>

    <!-- Bootstrap core CSS -->
    <link href="vendor-front/bootstrap/bootstrap.min.css" rel="stylesheet">

    <link href="vendor-front/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

    <link rel="stylesheet" type="text/css" href="vendor-front/parsley/parsley.css"/>

    <!-- Bootstrap core JavaScript -->
    <script src="vendor-front/jquery/jquery.min.js"></script>
    <script src="vendor-front/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor-front/jquery-easing/jquery.easing.min.js"></script>

    <script type="text/javascript" src="vendor-front/parsley/dist/parsley.min.js"></script>
</head>

<body>

    <div class="container">
        <br>
        <br>
        <h1 class="text-center">PHP Chat Application using Websocket</h1>
        <br>
        <br>
        <?= $message ?>
        <div class="card">
            <div class="card-header">
                <div class="row">
                    <div class="col-md-6">
                        Profile
                    </div>
                    <div class="col-md-6 text-end">
                        <a href="chatroom.php" class="btn btn-warning btn-sm">Goto Chat</a>
                    </div>
                </div>
            </div>
            <div class="card-body">
                <form action="" method="post" id="profile_form" enctype="multipart/form-data">
                    <div class="form-group">
                        <label for="">Enter Your Name</label>
                        <input type="text" name="user_name" id="user_name" value="<?= $user_data['user_name'] ?>" data-parsley-pattern="/^[a-zA-Z\s]+$/" class="form-control shadow-none" required>
                    </div>
                    <div class="form-group">
                        <label for="">Enter Your E-mail</label>
                        <input type="text" name="user_email" id="user_email" value="<?= $user_data['user_email'] ?>" data-parsley-type="email" class="form-control shadow-none" required readonly>
                    </div>
                    <div class="form-group">
                        <label for="">Enter Your Password</label>
                        <input type="password" name="user_password" id="user_password" value="<?= $user_data['user_password'] ?>" data-parsley-minlength="6" data-parsley-maxlength="12" data-parsley-pattern="^[a-zA-Z]+$" class="form-control shadow-none" required>
                    </div>
                    <div class="form-group">
                        <label for="">Profile</label>
                        <input type="file" name="user_profile" id="user_profile">
                        <br>
                        <img src="<?= $user_data['user_profile'] ?>" alt="" class="img-fluid img-thumbnail mt-3" width="
                        100">
                        <input type="hidden" name="hidden_user_profile" value="<?= $user_data['user_profile'] ?>">
                    </div>
                    <div class="form-group text-center">
                        <input type="submit" name="edit" class="btn btn-success" value="Edit">
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
<script>
    $(document).ready(function() {
        
    });
</script>   