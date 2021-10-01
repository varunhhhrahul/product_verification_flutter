<?php
	#Array - Variable that holds multiple values
	/*
		- Indexed
		- Associative
		- Multi-dimensional
	*/

	//!Indexed
	$people = array('Kevin', 'Jeremy', 'Sara');
	$ids = array(23, 55, 12);
	$ages=[1,5,2,4,3,9];
	$cars = ['Honda', 'Toyota', 'Ford'];
	$cars[3] = 'Chevy';
	$cars[] = 'BMW';

	// echo $ages[5];
	// echo count($cars);
	// print_r($cars); //without data type
	// var_dump($cars); //with data type
	

	//echo $people[3];
	//echo $ids[2];
	//echo $cars[4];

	//!Associative arrays
	$people = array('Brad' => 35, 'Jose' => 32, 'William' => 37);
	$ids = [22 => 'Brad', 44 => 'Jose', 63 => 'William'];

	// echo $people['Brad'];
	// echo $ids[22];
	$people['Jill'] = 42;
	// echo $people['Jill'];
	//print_r($people);
	// var_dump($people);

	//!Multi-Dimensional
	$cars = array(
		array('Honda', 20, 10),
		array('Toyota', 30, 20),
		array('Ford', 23, 12)
	);

	$users=[
		["Akshit",20],
		["Mahesh",35]
	];
	echo $users[0][0];
	// var_dump($users)
	// echo $cars[1][2];
?>