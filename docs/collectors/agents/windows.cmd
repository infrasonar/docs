@echo off
set version=v1.0.12
:: This script deploys the InfraSonar Microsoft Windows agent

:: Check if we have elevated rights
net.exe session 1>NUL 2>NUL || (Echo This script requires elevated rights. & Exit /b 1)

:: Greeting
echo InfraSonar agent version %version% (re)deployment.

:: Download the InfraSonar Windows agent
echo Downloading the InfraSonar Windows agent.
curl -sJL https://github.com/infrasonar/windows-agent/releases/download/%version%/WindowsAgentSetup.msi -o %temp%\WindowsAgentSetup.msi
:: Check for token and ask if we don't have any
reg query HKLM\SOFTWARE\Wow6432Node\Cesbit\InfraSonarAgent >nul 2>&1
if %errorlevel% equ 0 (echo Local InfraSonar configuration found.) else (CALL :configFunction)
::misexec
echo (re)installing the InfraSonar Windows agent.
net stop InfraSonarAgent >nul 2>&1
msiexec /i "%temp%\WindowsAgentSetup.msi" /qn
net start InfraSonarAgent >nul 2>&1
goto :eof

:configFunction
SETLOCAL
set token=
set assetid=
echo Configuring the InfraSonar Windows agent.
echo.
:: Ask for InfraSonar agent token
set /p "token=Enter the InfraSonar agent token: "
reg add "HKLM\SOFTWARE\Wow6432Node\Cesbit\InfraSonarAgent" /v Token /d %token% /t REG_SZ /f
:: Ask for InfraSonar assetID (optional)
echo you can set an optional asset ID, this connects the agent to an existing asset
set /p "assetid=Enter the assetID (leave black if unsure): "
if not "%assetid%" == "" echo Do not forget to add the windows collector to this asset, the agent will not perform this action.
if not "%assetid%" == "" REG ADD "HKLM\SOFTWARE\Wow6432Node\Cesbit\InfraSonarAgent" /V "AssetID" /T REG_QWORD /F /D %assetid%
ENDLOCAL