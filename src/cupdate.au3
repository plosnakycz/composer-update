#Region
#AutoIt3Wrapper_Res_Fileversion=0.1.1.2
#AutoIt3Wrapper_Res_Comment=composer update wrapper for windows
#AutoIt3Wrapper_Res_Description=composer update wrapper for windows
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
	if StringRight($file,5)<>'.json' Then
		$file = $file & '.json'
	EndIf
EndIf

$aFileList = _FileListToArray(@WorkingDir, "*.json")

EnvSet ( "COMPOSER" , $file )

$CMD =  "composer update"
RunWait(@ComSpec & " /c " & $CMD, @WorkingDir)


ConsoleWrite("composer-update: the end " & @CRLF)

