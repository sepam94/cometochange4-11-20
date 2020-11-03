<?php
header("content-type:text/javascript;charset=utf-8");
error_reporting(0);
error_reporting(E_ERROR | E_PARSE);
$link = mysqli_connect('localhost', 'root', '', "Cometochange");

if (!$link) {
    echo "Error: Unable to connect to MySQL." . PHP_EOL;
    echo "Debugging errno: " . mysqli_connect_errno() . PHP_EOL;
    echo "Debugging error: " . mysqli_connect_error() . PHP_EOL;
    
    exit;
}

if (!$link->set_charset("utf8")) {
    printf("Error loading character set utf8: %s\n", $link->error);
    exit();
	}

if (isset($_GET)) {
	if ($_GET['isAdd'] == 'true') {
				
		$Name = $_GET['Name'];
		$Gender = $_GET['Gender'];
		$Faculty = $_GET['Faculty'];
		$Major = $_GET['Major'];
		$Email = $_GET['Email'];
		$Password = $_GET['Password'];
							
		$sql = "INSERT INTO `User`(`id`, `Name`, `Gender`,  `Gender`, `Faculty`, `Major`,`Email`, `Password`) VALUES (Null,'$Name','$Gender','$Faculty','$Major','$Email','$Password')";

		$result = mysqli_query($link, $sql);

		if ($result) {
			echo "true";
		} else {
			echo "false";
		}

	} else echo "Welcome Master CTC";
   
}
	mysqli_close($link);
?>