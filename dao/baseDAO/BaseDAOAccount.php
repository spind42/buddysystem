<?php

/** 
 * @author martijn
 * 
 * 
 */
class BaseDAOAccount {
	
	function __construct() {
	
	}
	
	function findByUsername($userName){
		$account = new Account();
		
		$query = "select id,vorname,nachname,email,username,PASSWORD from accounts WHERE username='".mysql_real_escape_string($userName)."'";
		
		$resultSelect = mysql_query($query,$_SESSION['link']);

		if($resultSelect == TRUE){
			//print "Fetching data was successful";
		}
		else{
			print "Fetching users database error";
			die;
//			die("Fetching users database error: ". mysql_error());
		}		

		$accountRow = mysql_fetch_array($resultSelect);
		
		$account->setId($accountRow['id']);
		$account->setFirstName($accountRow['vorname']);
		$account->setLastName($accountRow['nachname']);
		$account->setEmail($accountRow['email']);
		$account->setUserName($accountRow['username']);
		$account->setPassword($accountRow['PASSWORD']);
		
		
		return $account;
	}
	
}

?>