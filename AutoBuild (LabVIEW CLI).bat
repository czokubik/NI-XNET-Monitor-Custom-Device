@echo off&setlocal

set "BuildProject=Source\NI-XNET Monitor Custom Device.lvproj"
set "BuildProjectTargetsList="My Computer" "RT PXI Target" "RT CompactRIO Target" "RT CompactRIO Target - Linux ARM" "RT CompactRIO Target - Linux x64""

set LabVIEWCLI=C:\Program Files (x86)\National Instruments\Shared\LabVIEW CLI\LabVIEWCLI.exe
set LabVIEWPath="C:\Program Files (x86)\National Instruments\LabVIEW 2017\LabVIEW.exe"

@echo off

    for %%a in (%BuildProjectTargetsList%) do (
		echo Building . . . && echo %%a in "%BuildProject%" project ...
        call LabVIEWCLI.exe -LabVIEWPath %LabVIEWPath% -OperationName ExecuteBuildSpec -ProjectPath "%~dp0%BuildProject%" -TargetName %%a -BuildSpecName ""
    )

timeout /t 10