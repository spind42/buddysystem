<?php

/** 
 * @author martijn
 * @author Stephan Spindler <stephan@spindler.priv.at>
 * 
 */
require_once "class.phpmailer.php";
require_once "class.smtp.php";


class Mailer {

	private $serverDir;

	function __construct() {
		$this->caller = "http://".$_SERVER["SERVER_NAME"].$_SERVER['REQUEST_URI'];
		$this->caller = substr($this->caller, 0, strpos($this->caller, '?'));
		$this->mailFrom = ' My Buddysystem <noreply@example.com>';
                

	}
        
        function getMail(){
                $mail = new PHPMailer();
                
                $mail->IsSMTP();
                $mail->SMTPDebug = 1; // debugging: 1 = errors and messages, 2 = messages only
                $mail->SMTPAuth = true;
                $mail->SMTPSecure = 'ssl';
                $mail->Host = $GLOBALS['MAIL_SERVER'];
                $mail->Port = $GLOBALS['MAIL_PORT'];
                $mail->IsHTML( false );
                $mail->Username = $GLOBALS['MAIL_USERNAME'];
                $mail->Password = $GLOBALS['MAIL_PASSWORD'];
                

                return $mail;
        }
        
        function sendMail( $address, $subject, $body ){
            
            $mail = $this->getMail();
            $mail->SetFrom($GLOBALS['MAIL_FROM'] );
            $mail->Subject = $subject ;
            $mail->Body =  $body;
            $mail->AddAddress( $address );
            if( !$mail->Send() ){
                echo "Mailer Error: " . $mail->ErrorInfo;
                return false;
            }else{
                echo "Message has been sent";
                return true;
            }
        }
        
	
	function composeConfirmationBuddy($buddy, $smarty, $new)
	{
		$toSmarty['linkChangeData'] = $this->caller."?action=buddyLogin&auth=".$buddy->getAuthHash();
		$toSmarty['firstName'] = $buddy->getFirstName();
		$smarty->assign($toSmarty);

		$message = $smarty->fetch('mail_registered_buddy_'.($new ? 'new' : 'old').'.tpl');
		
		return $this->sendMail($buddy->getEmail(),'Buddysystem registration',$message);
	}
	
	function composeConfirmationNewIncoming($incoming, $smarty)
	{
		$toSmarty['linkChangeData'] = $this->caller."?action=incomingLogin&authIncoming=".$incoming->getAuthHash();
		$toSmarty['firstName'] = $incoming->getFirstName();
		$smarty->assign($toSmarty);

		$message = $smarty->fetch('mail_registered_incoming.tpl');

		return $this->sendMail($incoming->getEmail(),'Buddysystem registration',$message);
	}	

	function composeConfirmationNewGroup($person, $smarty)
	{
		$toSmarty['linkToChat'] = $this->caller."?action=groupChat&auth=".$person['authHash'];
		$toSmarty['firstName'] = $person['firstName'];
		$smarty->assign($toSmarty);

		$message = $smarty->fetch('mail_matched_'.($person['type']=='incoming' ? 'incoming' : 'buddy').'.tpl');

		return $this->sendMail($person['email'],'Buddysystem group confirmation',$message);
	}


	
}

?>
