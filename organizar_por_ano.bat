@echo off
setlocal enabledelayedexpansion

REM Diretório a ser analisado
set "dir=C:\Users\Administrador\Downloads\Documents"

REM Navega para o diretório especificado
cd /d "%dir%"

REM Loop através dos arquivos no diretório
for %%f in (*.*) do (
    REM Obtém a data de modificação do arquivo
    for /f "tokens=1,2 delims= " %%a in ('echo %%~tf') do set data=%%a

    REM Extrai o ano da data
    set ano=!data:~6,4!

    REM Verifica se é um arquivo e não uma pasta
    if not exist "!ano!\" (
        md "!ano!"
    )

    REM Move o arquivo para a pasta do ano correspondente
    move "%%f" "!ano!\"
)

endlocal
echo Script concluído.
pause

