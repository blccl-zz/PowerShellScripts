cls
$file = Get-Item -Path c:\blade.txt #| select name, Exists
if ($file.exists -eq "True")
{$messagebody = "FTP on VSPWBFTPX01 is failed, Check console."
$messageParameters = @{                        
               Subject = "FTP on VSPWBFTPX01 is failed"                        
               Body = ConvertTo-Html -body $messagebody | out-string
			   From = "test@edftrading.com"                        
               To = "burne.claydon@edftrading.com"                        
                SmtpServer = "dcpwvxcas01"                        
            }                        
			Send-MailMessage @messageParameters -BodyAsHtml   }