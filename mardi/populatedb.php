<?php
require_once 'vendor/autoload.php';

$servername = "localhost";
$username = "sqlcourses";
$password = "sqlcourses";

// Create connection
$conn = new mysqli($servername, $username, $password);

// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}
echo "Connected successfully";

function populate ($conn, $amount) {
  $faker = Faker\Factory::create();
  $datas = [];
  $sql = "SELECT user_id from users GROUP BY user_id ASC LIMIT 1;";
  $queryLastId = $conn->query($sql);
  $startId = 0;
  for ($i = 0; $i < $amount; $i++) {
    if($i === 0) {
        $startId = $queryLastId + $i;
        $user_id = $startId;
    }
    $startId =+ $i;
    $numId = $startId;

    $user_id = $numId;
    $firstname = $faker->name;
    $lastname = $faker->lastName;
    $creation_date = date("Y-m-d H:i:s");
    $address = $faker->address;
    $phone = $faker->phoneNumber;
    $email = $faker->email;
    $age = date("Y") - rand(1920, date("Y"));

    $person = [];
    array_push($person, $firstname);
    array_push($person, $lastname);
    array_push($person, $email);

    array_push($data, $person);
  }
  return $data;
}

 var_dump( $populate = populate (100));
$sql = "
USE sql_courses;
INSERT INTO users (firstname, lastname, address)
VALUES ('John', 'Doe', 'john@example.com');";

if ($conn->query($sql) === TRUE) {
  echo "New record created successfully";
} else {
  echo "\n Error: " . $sql . "<br>" . $conn->error;
}

$conn->close();
?>