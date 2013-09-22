<?php

class BaseDAOstudy {

                
	function __construct() {

            
	}
	
	function findAll(){
		$pdo = $_SESSION['pdo'];
                $res=$pdo->query("select id,study from buddy_study order by study");
                //$result = $stmt->execute();
                               

		if($res == TRUE){
			//print "Fetching data was successful";
		}
		else{
			//die("Fetching groups database error: ". mysql_error());
		}		

		$studies[0] = "select...";
		
		foreach( $res as $row ) {

		    $studies[$row->id] = $row->study;
		}
		return($studies);		
	}
	
	function findById($id){	
		$query = "select id,study from buddy_study WHERE id='".mysql_real_escape_string($id)."';";
		$resultSelect = mysql_query($query,$_SESSION['link']);
		if($resultSelect == TRUE){
			//print "Fetching data was successful";
		}
		else{
			die("Fetching nationality error");
		}		

		$incomingRow = mysql_fetch_array($resultSelect);
		//var_export($incomingRow);
		$study = array();
		$study['id'] = $incomingRow['id'];
		$study['study'] = $incomingRow['study'];
		
		return($study);		
	}		
	
}

?>