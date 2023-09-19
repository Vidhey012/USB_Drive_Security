@echo off
set "scriptPath=%~dp0SendMail.ps1"
powershell.exe -ExecutionPolicy Bypass -File "%scriptPath%"