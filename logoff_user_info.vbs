On Error Resume Next
Set wshShell = CreateObject("WScript.Shell")
strComputerName = wshShell.ExpandEnvironmentStrings("%COMPUTERNAME%")
Set adsinfo = CreateObject("ADSystemInfo")
Set oUser = GetObject("LDAP://" & adsinfo.UserName)
strMonth = Month(Now())
If Len(strMonth) < 2 then
  strMonth = "0" & strMonth
End If
strDay = Day(Now())
If Len(strDay) < 2 then
  strDay = "0" & strDay
End If
strTime = FormatDateTime(Now(),vbLongTime)
If Len(strTime) < 8 then
  strTime = "0" & strTime
End If
strTimeStamp = Year(Now()) & "/" & strMonth & "/" & strDay & " " & strTime
oUser.put "info", strTimeStamp & " <logoff>" & " @ " & strComputerName
oUser.Setinfo