<?php

class BaseDAOnationality {

    function __construct() {
        
    }

    function findAll() {
        $pdo = $_SESSION['pdo'];
        $res = $pdo->query("select id,short_name from buddy_nationality order by short_name");

        //$resultSelect = mysql_query($query,$_SESSION['link']);

        if ($res == TRUE) {
            //print "Fetching data was successful";
        } else {
            die("Fetching groups database error: ");
        }

        $countries[0] = "select...";
        foreach( $res as $row ){
            $countries[$row->id] = $row->short_name;
        }

        return($countries);
    }

    function findById($id) {
        if ($id == NULL) {
            $id = 14;
        }

        $query = "select id,short_name from buddy_nationality WHERE id='" . mysql_real_escape_string($id) . "';";
        $resultSelect = mysql_query($query, $_SESSION['link']);
        if ($resultSelect == TRUE) {
            //print "Fetching data was successful";
        } else {
            die("Fetching nationality error");
        }

        $incomingRow = mysql_fetch_array($resultSelect);
        //var_export($incomingRow);
        $country = array();
        $country['id'] = $incomingRow['id'];
        $country['country'] = $incomingRow['short_name'];

        return($country);
    }

}

?>