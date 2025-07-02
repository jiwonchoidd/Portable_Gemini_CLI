@echo off
setlocal

echo.
echo ===========================================
echo   Gemini CLI ��ġ ��ũ��Ʈ
echo ===========================================
echo.

rem ���� ��ũ��Ʈ ��ġ�� CLI ���� ��η� ����
set "GEMINI_CLI_PORTABLE_PATH=%~dp0"

echo CLI ���� ���: %GEMINI_CLI_PORTABLE_PATH%
echo.

rem ���� ������ PATH�� CLI ��� �ӽ� �߰�
path %GEMINI_CLI_PORTABLE_PATH%;%path%

echo ���� ���� PATH ������Ʈ �Ϸ�.
echo.

rem npm ��ġ ���� Ȯ��
where npm >nul 2>nul
if %errorlevel% neq 0 (
    echo [���] npm�� ã�� �� �����ϴ�. Node.js�� ���� ��ġ���ּ���.
    goto :end
)

echo @google/gemini-cli ���� ��ġ ��...
npm install -g @google/gemini-cli
if %errorlevel% neq 0 (
    echo [����] @google/gemini-cli ��ġ�� �����߽��ϴ�.
    goto :end
)

echo.
echo ===========================================
echo   ��ġ �� ���� �Ϸ�!
echo   �� â���� 'gemini' ��ɾ �ٷ� ����� �� �ֽ��ϴ�.
echo   (�� â������ Node.js ���� ��ΰ� ������ �������� ���� �� �ֽ��ϴ�)
echo ===========================================
echo.

:end
pause
endlocal