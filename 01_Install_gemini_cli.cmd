@echo off
setlocal

echo.
echo ===========================================
echo   Gemini CLI ��ġ ��ũ��Ʈ
echo ===========================================
echo.

echo ��ũ��Ʈ�� ���۵Ǿ����ϴ�. ����Ϸ��� �ƹ� Ű�� ��������...
pause >nul
echo.

rem ���� ��ũ��Ʈ ��ġ�� CLI ���� ��η� ����
set "GEMINI_CLI_PORTABLE_PATH=%~dp0"

echo CLI ���� ���: %GEMINI_CLI_PORTABLE_PATH%
echo.

timeout /t 2 /nobreak >nul

rem ���� ������ PATH�� CLI ��� �ӽ� �߰�
path %GEMINI_CLI_PORTABLE_PATH%;%path%

echo ���� ���� PATH ������Ʈ �Ϸ�.
echo.

rem PATH ������Ʈ Ȯ�� (��� ���)
timeout /t 2 /nobreak >nul

rem npm ��ġ ���� Ȯ��
echo npm ��ġ ���� Ȯ�� ��...
where npm >nul 2>nul
if %errorlevel% neq 0 (
    echo [���] npm�� ã�� �� �����ϴ�. Node.js�� ���� ��ġ���ּ���.
    goto :end_script
) else (
    echo npm�� �ý��ۿ� ��ġ�Ǿ� �ֽ��ϴ�.
)
echo.

timeout /t 2 /nobreak >nul

echo @google/gemini-cli ���� ��ġ ��...
echo �� ������ �ð��� �ɸ� �� �ֽ��ϴ�. ��� ��ٷ� �ּ���...
echo.

rem npm install ����
npm install -g @google/gemini-cli
if %errorlevel% neq 0 (
    echo.
    echo ===========================================
    echo [����] @google/gemini-cli ��ġ�� �����߽��ϴ�!
    echo NPM ��� �޽����� �ڼ��� Ȯ���ϼ���.
    echo ===========================================
    echo.
    goto :end_script
) else (
    echo.
    echo ===========================================
    echo @google/gemini-cli ��ġ�� ���������� �Ϸ�Ǿ����ϴ�!
    echo ===========================================
    echo.
)

timeout /t 3 /nobreak >nul

echo.
echo ===========================================
echo   ��� ��ġ �� ���� �Ϸ�!
echo   �� â���� 'gemini' ��ɾ �ٷ� ����� �� �ֽ��ϴ�.
echo   (�� â������ Node.js ���� ��ΰ� ������ �������� ���� �� �ֽ��ϴ�)
echo ===========================================
echo.

:end_script

echo ��ũ��Ʈ ������ �Ϸ�Ǿ����ϴ�. â�� �������� �ƹ� Ű�� �����ʽÿ�...
pause >nul
endlocal