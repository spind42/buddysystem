<?php

/** 
 * @author martijn
 * 
 * 
 */
class BaseDAOincoming {
	
	function __construct() {
	
	}

	function delete($authHash){
		$query = "DELETE from `buddy_incoming` WHERE authHash='".mysql_real_escape_string($authHash)."'";
		
		$resultInsert = mysql_query($query,$_SESSION['link']);
		$_SESSION['session_id'] = mysql_insert_id($_SESSION['link']);
		
		if($resultInsert == TRUE){
//			print "Inserting data was successful";
		}
		else{
			print("database error while deleting buddy");
//			die("database error while deleting buddy: ". mysql_error());
			return "false";
		}	
		
		return "true";		
		
	}	
	
	
	/**
	 * @Param $type = buddy or incoming 
	 * @Param $mail = email address
	 * @return true = not in db    false = alreadz in db
	 */
	function checkEmail($type, $email) {
		if($type == 'incoming'){
			$query = "SELECT * from `buddy_incoming` where email='".mysql_real_escape_string($email)."'";
		}		
		
		$resultSelect = mysql_query($query,$_SESSION['link']);
		
		if(mysql_num_rows($resultSelect) != 0){
			return FALSE;
		}
		
		return TRUE;
	}	
	
	function save($incoming) {
		$query = "INSERT INTO `buddy_incoming` (firstName,lastName,email,idNationality,idStudy,authHash,locked,dateArrival,dateAdded) 
		VALUES(
		'".mysql_real_escape_string($incoming->getFirstName())."',
		'".mysql_real_escape_string($incoming->getLastName())."',
		'".mysql_real_escape_string($incoming->getEmail())."',
		'".mysql_real_escape_string($incoming->getIdNationality())."',
		'".mysql_real_escape_string($incoming->getIdStudy())."',
		'".mysql_real_escape_string($incoming->getAuthHash())."',
		'".mysql_real_escape_string($incoming->getLocked())."',
		'".mysql_real_escape_string($incoming->getDateArrival())."',		
		now()		
		)";
		
		$resultInsert = mysql_query($query,$_SESSION['link']);
		$_SESSION['session_id'] = mysql_insert_id($_SESSION['link']);
		
		if($resultInsert == TRUE){
//			print "Inserting data was successful";
		}
		else{
			print("database error while inserting incoming");
//			die("database error while inserting buddy: ". mysql_error());
		}	
		
		return true;
	}	

	function update($incoming) {
		$val = array();
		$val[0] = mysql_real_escape_string($incoming->getFirstName());
		$val[1] = mysql_real_escape_string($incoming->getLastName());
		$val[2] = mysql_real_escape_string($incoming->getEmail());
		$val[3] = mysql_real_escape_string($incoming->getIdNationality());
		$val[4] = mysql_real_escape_string($incoming->getPreferredLanguage());
		$val[6] = mysql_real_escape_string($incoming->getIdStudy());
		$val[10] = mysql_real_escape_string($incoming->getDateArrival());
		
		$query = "UPDATE `buddy_incoming` SET firstName='".$val[0]."',lastName='".$val[1]."',email='".$val[2]."',preferredLanguage='".$val[4]."',idStudy='".$val[6]."',idNationality='".$val[3]."',dateArrival='".$val[10]."',dateLogin=now() WHERE authHash='".mysql_real_escape_string($incoming->getAuthHash())."'";
		
		$resultInsert = mysql_query($query,$_SESSION['link']);
		$_SESSION['session_id'] = mysql_insert_id($_SESSION['link']);
		
		if($resultInsert == TRUE){
//			print "Updating data was successful";
		}
		else{
			//print("database error while updating group: ". mysql_error());
			print("database error while updating incoming");
			return FALSE;
		}	
		
		return true;
	}		

	function updateGroupById($id,$idGroup){
		$val = array();
		$val[0] = mysql_real_escape_string($id);
		$val[1] = mysql_real_escape_string($idGroup);	

		$query = "UPDATE `buddy_incoming` SET idGroup='".$val[1]."' WHERE id='".$val[0]."'";
		$resultInsert = mysql_query($query,$_SESSION['link']);
		
		if($resultInsert == TRUE){
//			print "Updating data was successful";
		}
		else{
			//print("database error while updating group: ". mysql_error());
			print("database error while updating incoming");
			return FALSE;
		}	
		return true;	
	}

	function findById($id){
		$query = "select id,firstName,lastName,email,idNationality,idStudy,preferredLanguage,dateArrival,authHash,idGroup from buddy_incoming WHERE id='".mysql_real_escape_string($id)."'";
		
		$resultSelect = mysql_query($query,$_SESSION['link']);

		if($resultSelect == TRUE){
			//print "Fetching data was successful";
		}
		else{
			die("Fetching users database error: ". mysql_error());
		}		

		$incomingRow = mysql_fetch_array($resultSelect);
		
		$incoming = new Incoming();
		$incoming->setId($incomingRow['id']);
		$incoming->setFirstName($incomingRow['firstName']);
		$incoming->setLastName($incomingRow['lastName']);
		$incoming->setEmail($incomingRow['email']);
		$incoming->setIdNationality($incomingRow['idNationality']);
		$incoming->setIdStudy($incomingRow['idStudy']);
		$incoming->setPreferredLanguage($incomingRow['preferredLanguage']);
		$incoming->setAuthHash($incomingRow['authHash']);
		$incoming->setDateArrival($incomingRow['dateArrival']);
		$incoming->setDateLogin(date("Y-m-d H:i:s", time()));
		$incoming->setIdGroup($incomingRow['idGroup']);
		
		if(empty($incomingRow['firstName']) && empty($incomingRow['lastName'])){
			return false;
		}
		
		return($incoming);
	}	
	
	function findByAuthHash($authHash){
		$query = "select id,firstName,lastName,email,idNationality,idStudy,preferredLanguage,dateArrival,authHash,idGroup from buddy_incoming WHERE authHash='".mysql_real_escape_string($authHash)."'";
		
		$resultSelect = mysql_query($query,$_SESSION['link']);

		if($resultSelect == TRUE){
			//print "Fetching data was successful";
		}
		else{
			die("Fetching users database error: ". mysql_error());
		}		

		$incomingRow = mysql_fetch_array($resultSelect);
		
		$incoming = new Incoming();
		$incoming->setId($incomingRow['id']);
		$incoming->setFirstName($incomingRow['firstName']);
		$incoming->setLastName($incomingRow['lastName']);
		$incoming->setEmail($incomingRow['email']);
		$incoming->setIdNationality($incomingRow['idNationality']);
		$incoming->setIdStudy($incomingRow['idStudy']);
		$incoming->setPreferredLanguage($incomingRow['preferredLanguage']);
		$incoming->setAuthHash($incomingRow['authHash']);
		$incoming->setDateArrival($incomingRow['dateArrival']);
		$incoming->setDateLogin(date("Y-m-d H:i:s", time()));
		$incoming->setIdGroup($incomingRow['idGroup']);
		
		if(empty($incomingRow['firstName']) && empty($incomingRow['lastName'])){
			return false;
		}
		
		return($incoming);
	}
		
	function findByIdGroup($idGroup,$emailNot){
		if($emailNot == NULL){
			$emailNot = 29347982374892374832;
		}
		$emailNot=0;
		$query = "select id,firstName,lastName,email,idNationality,idStudy,preferredLanguage,dateArrival,authHash,idGroup from buddy_incoming WHERE idGroup='".mysql_real_escape_string($idGroup)."' and email != '".mysql_real_escape_string($emailNot)."'";
		
		$resultSelect = mysql_query($query,$_SESSION['link']);

		if($resultSelect == TRUE){
			//print "Fetching data was successful";
		}
		else{
			die("Fetching users database error: ". mysql_error());
		}		

		$nationalityDAO = new BaseDAOnationality();
		$studyDAO = new BaseDAOstudy();
//		$country = $nationalityDAO->findById($idNationality);
		
		while ($incomingRow = mysql_fetch_array($resultSelect, MYSQL_NUM)) {
			$incoming = array();
			$incoming['id'] = $incomingRow[0];
			$incoming['firstName'] = $incomingRow[1];
			$incoming['lastName'] = $incomingRow[2];
			$incoming['email'] = $incomingRow[3];
			$temp = $nationalityDAO->findById($incomingRow[4]);
			$incoming['country'] = $temp['country'];
			$temp = $studyDAO->findById($incomingRow[5]);
			$incoming['study'] = $temp['study'];			
			$incomings[] = $incoming;
		}
			
		if(empty($incomings[0]['firstName']) && empty($incomings[0]['lastName'])){
			return false;
		}

//		var_export($incomings);
		return $incomings;
	}
	
	function updateMailedById($id) {		
		$query = "UPDATE `buddy_incoming` SET mailed='1' WHERE id='".mysql_real_escape_string($id)."'";
		
		$resultInsert = mysql_query($query,$_SESSION['link']);
		$_SESSION['session_id'] = mysql_insert_id($_SESSION['link']);
		
		if($resultInsert == TRUE){
			//print "Updating data was successful";
		}
		else{
			//print("database error while updating group: ". mysql_error());
			print("database error while updating group");
			return FALSE;
		}	
		
		return true;
	}	
	
	function findByDateArrival($dateArrival){
		$query = "select id,firstName,lastName,email,idNationality,idStudy,preferredLanguage,dateArrival,authHash,idGroup from buddy_incoming WHERE dateArrival<='".mysql_real_escape_string($dateArrival)."' and locked=0 and idGroup=0 and mailed=0";
		
		$resultSelect = mysql_query($query,$_SESSION['link']);

		if($resultSelect == TRUE){
			//print "Fetching data was successful";
		}
		else{
			die("Fetching users database error: ". mysql_error());
		}		

		$nationalityDAO = new BaseDAOnationality();
		$studyDAO = new BaseDAOstudy();
//		$country = $nationalityDAO->findById($idNationality);
		
		while ($incomingRow = mysql_fetch_array($resultSelect, MYSQL_NUM)) {
			$incoming = array();
			$incoming['id'] = (integer) $incomingRow[0];
			$incoming['firstName'] = $incomingRow[1];
			$incoming['lastName'] = $incomingRow[2];
			$incoming['email'] = $incomingRow[3];
			$incoming['country'] = (integer) $incomingRow[4];
			$incoming['idStudy'] = (integer) $incomingRow[5];
			$incoming['preferredLanguage'] = (integer) $incomingRow[6];
			$incoming['dateArrival'] = $incomingRow[7];
			$incoming['authHash'] = $incomingRow[8];
			$incoming['idGroup'] = (integer)$incomingRow[9];
			$incoming['type'] = "incoming";		
			$incomings[] = $incoming;
		}

		if(isset($incomings)){
			return $incomings;
		}
		else{
			$incomings = array();
		}
		//var_export($incomings);
		return $incomings;
	}

	function getAll(){
		$query = "select id,firstName,lastName,email,idNationality,idStudy,preferredLanguage,dateArrival,authHash,idGroup from buddy_incoming";
		
		$resultSelect = mysql_query($query,$_SESSION['link']);

		if($resultSelect == TRUE){
			//print "Fetching data was successful";
		}
		else{
			die("Fetching users database error: ". mysql_error());
		}		

		$nationalityDAO = new BaseDAOnationality();
		$studyDAO = new BaseDAOstudy();
//		$country = $nationalityDAO->findById($idNationality);
		
		while ($incomingRow = mysql_fetch_array($resultSelect, MYSQL_NUM)) {
			$incoming = array();
			$incoming['id'] = (integer) $incomingRow[0];
			$incoming['firstName'] = $incomingRow[1];
			$incoming['lastName'] = $incomingRow[2];
			$incoming['email'] = $incomingRow[3];

			$temp = $nationalityDAO->findById($incomingRow[4]);
			$incoming['country'] = $temp['country']; // (integer) $incomingRow[4];
			$temp = $studyDAO->findById($incomingRow[5]);
			$incoming['idStudy'] = $temp['study']; //(integer) $incomingRow[5];

			$incoming['preferredLanguage'] = (integer) $incomingRow[6];
			$incoming['dateArrival'] = $incomingRow[7];
			$incoming['authHash'] = $incomingRow[8];
			$incoming['idGroup'] = (integer)$incomingRow[9];
			$incoming['type'] = "incoming";

			$incomings[] = $incoming;
		}

		return isset($incomings) ? $incomings : array();
	}
		
}

?>
