#Region
#AutoIt3Wrapper_Res_Fileversion=0.1.0.1
#AutoIt3Wrapper_Res_Comment=composer update wrapper for windows
#AutoIt3Wrapper_Res_Description=desc
#AutoIt3Wrapper_Res_LegalCopyright=plosnaky.cz
#AutoIt3Wrapper_OutFile=..\build\cupdate.exe
#EndRegion


#include <File.au3>
#include <Array.au3>
#AutoIt3Wrapper_Change2CUI=y
Opt("WinTitleMatchMode", 2)


Func _UBound($a)

   local $i

   For $i=UBound($a) - 1 to 0 Step -1
      If StringLen($a[$i])>  0 Then ExitLoop
   Next
    Return $i

EndFunc




if _UBound($cmdline)==0 Then
	$file = 'composer.json'
Else
	$file = $cmdline[1]
EndIf

$aFileList = _FileListToArray(@ScriptDir, "*.json")

EnvSet ( "COMPOSER" , $file )

$CMD =  "composer update"
RunWait(@ComSpec & " /c " & $CMD, @ScriptDir)


ConsoleWrite("composer-update: the end " & @CRLF)

