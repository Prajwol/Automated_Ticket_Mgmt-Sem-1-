<?php
	session_start();
	session_unset($_SESSION['user']);
	session_destroy();
    $_SESSION['message'] = "You've been log out of the system";
	// header("Location: http://192.168.64.2/ticket/");
	header("Location: http://localhost/ticket/");

?>
