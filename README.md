# storage_spaces_degraded_email_notification
Use a PowerShell script to send email notification alerts for Storage Spaces degraded disks on a server


So, you’ve implemented Storage Spaces on Windows Server or perhaps on Hyper-V Server.

Now you have to monitor the Storage Pool health; maybe by manually checking daily perhaps?

Well, let’s automate the process by using a simple PowerShell script.

The script requirements are:  detect the failed disks, identify the failed disks, log the failure to a file for reference, send an email alert notification of the failure and include the server name the failure occurred on.
