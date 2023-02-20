$todaysdate = get-date

$windows = (Invoke-RestMethod -Method Get -uri "https://endoflife.date/api/windows.json")
$servers = (Invoke-RestMethod -Method Get -uri "https://endoflife.date/api/windowsserver.json")


$yearfromnow = $date.AddDays(365)



foreach($version in $windows){
    $EOL = get-date $($version.eol)
        if($EOL -gt $todaysdate -and $EOL -lt $yearfromnow){
            if($version.cycle -like "*(E)*"){
            Write-Host $version.cycle
            Write-Host $version.eol
            Write-Host $version.link
            Write-Host ""
            }
            
    }
}


foreach($version in $servers){
    $EOL = get-date $($version.eol)
        if($EOL -gt $todaysdate -and $EOL -lt $yearfromnow){
            Write-Host $version.cycle
            Write-Host $version.eol
            Write-Host $version.link
            Write-Host ""
            }
            
 }




#had to create an app password from within the google account (security page) - then use it here 



$EmailFrom = ""
$EmailTo = ""
$Subject = "Notification from XYZ"
$Body = "this is a notification from XYZ Notifications.."
$SMTPServer = "smtp.gmail.com"
$SMTPPort = 587

Send-MailMessage -From $EmailFrom -to $EmailTo -Subject $Subject -Body $Body -SmtpServer $SMTPServer -port $SMTPPort -UseSsl -Credential (Get-Credential)



#Test Change
 
