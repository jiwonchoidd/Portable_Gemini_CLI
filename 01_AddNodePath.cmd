@echo off
SETLOCAL ENABLEDELAYEDEXPANSION

REM ���� ��ġ ���� ��� (������ �齽���� ����)
SET "NODE_PATH=%~dp0"
IF "%NODE_PATH:~-1%"=="\" SET "NODE_PATH=%NODE_PATH:~0,-1%"

REM ���� ����� PATH �б�
FOR /F "tokens=2*" %%A IN ('reg query "HKCU\Environment" /v PATH 2^>nul') DO (
    SET "USER_PATH=%%B"
)

REM �ߺ� ���� Ȯ��
ECHO !USER_PATH! | FINDSTR /C:"%NODE_PATH%" >nul
IF %ERRORLEVEL%==0 (
    ECHO [INFO] �̹� PATH�� ���ԵǾ� �ֽ��ϴ�: %NODE_PATH%
    GOTO END
)

REM PATH�� �߰�
SET "NEW_PATH=%USER_PATH%;%NODE_PATH%"
REG ADD "HKCU\Environment" /v PATH /t REG_EXPAND_SZ /d "%NEW_PATH%" /f

ECHO [SUCCESS] PATH�� �߰� �Ϸ�: %NODE_PATH%
ECHO [INFO] ������ ���� �α׾ƿ� �Ǵ� �� �ܼ��� �ʿ��� �� �ֽ��ϴ�.

:END
ENDLOCAL
PAUSE
