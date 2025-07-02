@echo off
SETLOCAL ENABLEDELAYEDEXPANSION

REM 현재 배치 파일 경로 (마지막 백슬래시 제거)
SET "NODE_PATH=%~dp0"
IF "%NODE_PATH:~-1%"=="\" SET "NODE_PATH=%NODE_PATH:~0,-1%"

REM 기존 사용자 PATH 읽기
FOR /F "tokens=2*" %%A IN ('reg query "HKCU\Environment" /v PATH 2^>nul') DO (
    SET "USER_PATH=%%B"
)

REM 중복 여부 확인
ECHO !USER_PATH! | FINDSTR /C:"%NODE_PATH%" >nul
IF %ERRORLEVEL%==0 (
    ECHO [INFO] 이미 PATH에 포함되어 있습니다: %NODE_PATH%
    GOTO END
)

REM PATH에 추가
SET "NEW_PATH=%USER_PATH%;%NODE_PATH%"
REG ADD "HKCU\Environment" /v PATH /t REG_EXPAND_SZ /d "%NEW_PATH%" /f

ECHO [SUCCESS] PATH에 추가 완료: %NODE_PATH%
ECHO [INFO] 적용을 위해 로그아웃 또는 새 콘솔이 필요할 수 있습니다.

:END
ENDLOCAL
PAUSE
