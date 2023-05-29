@echo OFF
if not exist "%~dp0\AME-Firefox-Injection" (
	echo. & echo No supplied AME-Firefox-Injection folder detected.
	exit /b 4