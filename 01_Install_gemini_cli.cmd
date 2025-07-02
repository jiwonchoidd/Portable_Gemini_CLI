@echo off
setlocal

echo.
echo ===========================================
echo   Gemini CLI 설치 스크립트 (디버그 모드)
echo ===========================================
echo.

rem 스크립트 시작 확인 (강제 멈춤)
echo 스크립트가 시작되었습니다. 계속하려면 아무 키나 누르세요...
pause >nul
echo.

rem 현재 스크립트 위치를 CLI 실행 경로로 설정
set "GEMINI_CLI_PORTABLE_PATH=%~dp0"

echo CLI 실행 경로: %GEMINI_CLI_PORTABLE_PATH%
echo.

rem 경로 설정 확인 (잠시 대기)
timeout /t 2 /nobreak >nul

rem 현재 세션의 PATH에 CLI 경로 임시 추가
path %GEMINI_CLI_PORTABLE_PATH%;%path%

echo 현재 세션 PATH 업데이트 완료.
echo.

rem PATH 업데이트 확인 (잠시 대기)
timeout /t 2 /nobreak >nul

rem npm 설치 여부 확인
echo npm 설치 여부 확인 중...
where npm >nul 2>nul
if %errorlevel% neq 0 (
    echo [경고] npm을 찾을 수 없습니다. Node.js를 먼저 설치해주세요.
    goto :end_script
) else (
    echo npm이 시스템에 설치되어 있습니다.
)
echo.

rem npm 확인 후 (잠시 대기)
timeout /t 2 /nobreak >nul

echo @google/gemini-cli 전역 설치 중...
echo 이 과정은 시간이 걸릴 수 있습니다. 잠시 기다려 주세요...
echo.

rem npm install 실행
npm install -g @google/gemini-cli
if %errorlevel% neq 0 (
    echo.
    echo ===========================================
    echo [오류] @google/gemini-cli 설치에 실패했습니다!
    echo NPM 출력 메시지를 자세히 확인하세요.
    echo ===========================================
    echo.
    goto :end_script
) else (
    echo.
    echo ===========================================
    echo @google/gemini-cli 설치가 성공적으로 완료되었습니다!
    echo ===========================================
    echo.
)

rem 설치 결과 확인 후 (잠시 대기)
timeout /t 3 /nobreak >nul

echo.
echo ===========================================
echo   모든 설치 및 설정 완료!
echo   이 창에서 'gemini' 명령어를 바로 사용할 수 있습니다.
echo   (새 창에서는 Node.js 전역 경로가 없으면 동작하지 않을 수 있습니다)
echo ===========================================
echo.

:end_script
rem 최종 멈춤!
echo 스크립트 실행이 완료되었습니다. 창을 닫으려면 아무 키나 누르십시오...
pause >nul
endlocal