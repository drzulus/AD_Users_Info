$OU = "OU=Address_Book,DC=DOMAIN,DC=LOCAL"
Get-ADUser -SearchBase $OU -Properties * -Filter * | Select-Object DisplayName, SamAccountName, info | Sort DisplayName | Out-GridView -Title "Информация по логонам" -Wait
