@echo OFF

for /f "usebackq tokens=2 delims=\" %%A in (`reg query "HKEY_USERS" ^| findstr /r /x /c:"HKEY_USERS\\S-.*" /c:"HKEY_USERS\\AME_UserHive_[^_]*"`) do (
    REM If the "Volatile Environment" key exists, that means it is a proper user. Built in accounts/SIDs don't have this key.
    reg query "HKU\%%A" | findstr /c:"Volatile Environment" /c:"AME_UserHive_" > NUL 2>&1
        if not errorlevel 1 call :OPENSHELLREG "%%A"
)

@echo ON

OpenShellSetup_4_4_189.exe /qn /quiet ADDLOCAL=StartMenu

copy /y Fluent-Metro.skin "%PROGRAMFILES%\Open-Shell\Skins"
copy /y Fluent-AME.skin7 "%PROGRAMFILES%\Open-Shell\Skins"

::PowerShell -NoP -C "Invoke-WMIMethod -Class Win32_Process -Name Create -ArgumentList '%~dp0\silent_installers\OldCalculatorforWindows10Cfg.exe' | Wait-Process"
::OldClassicCalc-2.0-setup.exe /VERYSILENT /SUPPRESSMSGBOXES /NORESTART

::del /q /f "%SYSTEMDRIVE%\Users\Public\Desktop\Calculator (classic).lnk"

::for /f "usebackq delims=" %%E in (`reg query "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall" ^| findstr /r /c:"Old[ ].*Calculator"`) do reg add "%%E" /v "DisplayName" /t REG_SZ /d "Calculator" /f

@exit /b 0

:OPENSHELLREG

@echo ON
reg add "HKU\%~1\SOFTWARE\OpenShell" /t REG_SZ /f
reg add "HKU\%~1\SOFTWARE\OpenShell\OpenShell" /t REG_SZ /f
reg add "HKU\%~1\SOFTWARE\OpenShell\OpenShell\Settings" /t REG_SZ /f
reg add "HKU\%~1\SOFTWARE\OpenShell\ClassicExplorer" /t REG_SZ /f
reg add "HKU\%~1\SOFTWARE\OpenShell\ClassicExplorer\Settings" /t REG_SZ /f
reg add "HKU\%~1\SOFTWARE\OpenShell\ClassicExplorer" /v "CSettingsDlg" /t REG_BINARY /d a8030000d00100000000000000000000aa0f00000100010100000000 /f
reg add "HKU\%~1\SOFTWARE\OpenShell\ClassicExplorer" /v "ShowedToolbar" /t REG_DWORD /d 1 /f
reg add "HKU\%~1\SOFTWARE\OpenShell\ClassicExplorer" /v "NewLine" /t REG_DWORD /d 0 /f
reg add "HKU\%~1\SOFTWARE\OpenShell\ClassicExplorer\Settings" /v "ShowStatusBar" /t REG_DWORD /d 0 /f
reg add "HKU\%~1\SOFTWARE\OpenShell\StartMenu\Settings" /v "EnableGlass" /t REG_DWORD /d 0 /f
reg add "HKU\%~1\SOFTWARE\OpenShell\StartMenu\Settings" /v "MenuShadow" /t REG_DWORD /d 0 /f

::reg add "HKU\%~1\SOFTWARE\OpenShell\StartMenu\Settings" /v "MainMenuAnimationSpeed" /t REG_DWORD /d 150 /f

@echo OFF
::if "%~1"=="AME_UserHive_Default" (
em18.Settings=TRACK_RECENT|ITEM_DISABLED\0Item19.Command=devices\0Item19.Settings=ITEM_DISABLED\0Item20.Command=defaults\0Item20.Settings=ITEM_DISABLED\0Item21.Command=help\0Item21.Settings=ITEM_DISABLED\0Item22.Command=run\0Item23.Command=apps\0Item23.Settings=ITEM_DISABLED\0Item24.Command=windows_security\0Item24.Settings=ITEM_DISABLED\0" /f
ettings=TRACK_RECENT|ITEM_DISABLED\0Item19.Command=devices\0Item19.Settings=ITEM_DISABLED\0Item20.Command=defaults\0Item20.Settings=ITEM_DISABLED\0Item21.Command=help\0Item21.Settings=ITEM_DISABLED\0Item22.Command=run\0Item23.Command=apps\0Item23.Settings=ITEM_DISABLED\0Item24.Command=windows_security\0Item24.Settings=ITEM_DISABLED\0" /f
::  reg add "HKU\%~1\SOFTWARE\EarTrumpet" /v "IsTelemetryEnabled" /t REG_SZ /d "<?xml version=""""1.0"""" encoding=""""utf-16""""?><boolean>false</boolean>" /f
::)

exit /b 0