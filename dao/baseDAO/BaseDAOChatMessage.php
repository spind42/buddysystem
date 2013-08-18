<?php

/** 
 * @author martijn
 * 
 * 
 */
class BaseDAOChatMessage {
	
	function __construct() {
	
	}
	
	function saveMessage($message,$idGroup,$type,$idUser){
		$val = array();
		$val[0] = mysql_real_escape_string($message);
		$val[1] = mysql_real_escape_string($idGroup);
		$val[2] = mysql_real_escape_string($type);
		$val[3] = mysql_real_escape_string($idUser);
		
//		var_export($val);
		
		if($val[2] == "buddy"){
			$query = "INSERT INTO `buddy_chatMessages` (idGroup,message,idBuddy,dateSend,idIncoming) VALUES('".$val[1]."','".$val[0]."','".$val[3]."',now(),'0')";
		}
		elseif($val[2] == "incoming"){
			$query = "INSERT INTO `buddy_chatMessages` (idGroup,message,idIncoming,dateSend,idBuddy) VALUES('".$val[1]."','".$val[0]."','".$val[3]."',now(),'0')";
		}
		else{
			print "no buddy or incoming error. I die.";
			die;
		}
		
		$resultInsert = mysql_query($query,$_SESSION['link']);
		$_SESSION['session_id'] = mysql_insert_id($_SESSION['link']);
		
		if($resultInsert == TRUE){
//			print "Inserting data was successful";
		}
		else{
			print("database error while inserting buddy");
//			die("database error while inserting buddy: ". mysql_error());
		}	
		
		return true;		
	}
	
	function findByIdGroup($idGroup){
		$query = "select idBuddy,idIncoming,message,dateSend from buddy_chatMessages WHERE idGroup='".mysql_real_escape_string($idGroup)."' ORDER BY id DESC";
		
		$resultSelect = mysql_query($query,$_SESSION['link']);

		if($resultSelect == TRUE){
			//print "Fetching data was successful";
		}
		else{
			die("Fetching users database error: ". mysql_error());
		}		
		
		$buddyDAO = new BaseDAObuddy();
		$incomingDAO = new BaseDAOincoming();
		
		while ($messageRow = mysql_fetch_array($resultSelect, MYSQL_NUM)) {
			$message = array();
			$message['message'] = $messageRow[2];
			if($messageRow[0] == 0){
				$temp = $incomingDAO->findById($messageRow[1]);
			}
			elseif($messageRow[1] == 0){
				$temp = $buddyDAO->findById($messageRow[0]);
			}
			else{
				print "messages corrupt, mail web-master";
				die;
			}
			
			if($temp != false){
				$name = $temp->getFirstName()." ".$temp->getLastName();
			}
			else{
				$name="";
			}
			$message['sender'] = $name;
			$message['date'] = $messageRow[3];
			
			$messages[] = $message;
		}		
		
		if(!isset($messages)){
			$messages = array();
		}
		
		return $messages;
	}
	
}

?>
