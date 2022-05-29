#— check the health status of the storage pool
if (get-storagepool | ? operationalstatus -eq degraded)
{
#— identify the physical disk(s) that is degraded
 $baddisk= (get-physicaldisk | ? operationalstatus -ne OK).serialnumber

 #— log error to file
 $info= “defective disk S/N: $baddisk”
 $info | Out-File -filepath “C:\StorageSpacesError_$(Get-Date -f MM-dd).log”

 #— send an email alert
 $PSEmailServer= “smtp.gmail.com”
 $mailto= “tosomeuser@somedomain.com”
 $mailfrom= “fromsomeuser@gmail.com”
 $spwfrom= ConvertTo-SecureString -string ‘mailfrompassword’ -AsPlainText -Force
 $credentials= New-Object Management.Automation.PSCredential ($mailfrom, $spwfrom)
 Send-MailMessage -to $mailto -Subject “$(hostname) Storage Pool: DEGRADED” -Body $info -from $mailfrom -UseSsl -port 587 -credential $credentials
}
