@echo off
setlocal

echo.
echo ===========================================
echo   Gemini CLI Installation Script
echo ===========================================
echo.

echo Press any key to continue...
pause >nul
echo.

:: Set current script directory as CLI path
set "GEMINI_CLI_PORTABLE_PATH=%~dp0"

echo CLI Path: %GEMINI_CLI_PORTABLE_PATH%
echo.

timeout /t 2 /nobreak >nul

:: Temporarily add CLI path to the current session PATH
set "PATH=%GEMINI_CLI_PORTABLE_PATH%;%PATH%"

echo PATH updated for this session.
echo.

timeout /t 2 /nobreak >nul

:: Check if npm is installed
echo Checking for npm...
where npm >nul 2>nul
if %errorlevel% neq 0 (
    echo [WARNING] npm not found. Please install Node.js first.
    goto :end_script
) else (
    echo npm is installed.
)
echo.

timeout /t 2 /nobreak >nul

echo Installing @google/gemini-cli globally...
echo This may take a few moments. Please wait...
echo.

:: Install gemini CLI
npm install -g @google/gemini-cli
if %errorlevel% neq 0 (
    echo.
    echo ===========================================
    echo [ERROR] Failed to install @google/gemini-cli!
    echo Please review the npm output for details.
    echo ===========================================
    echo.
    goto :end_script
) else (
    echo.
    echo ===========================================
    echo @google/gemini-cli installed successfully!
    echo ===========================================
    echo.
)

timeout /t 3 /nobreak >nul

echo.
echo ===========================================
echo   Installation and configuration complete!
echo   You can now use the 'gemini' command.
echo   (Note: It may not work in new terminals if PATH isn't set globally)
echo ===========================================
echo.

:end_script

echo Script finished. Press any key to exit...
pause >nul
endlocal