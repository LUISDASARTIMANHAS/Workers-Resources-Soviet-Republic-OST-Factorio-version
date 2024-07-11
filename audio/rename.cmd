@echo off
setlocal enabledelayedexpansion

echo Iniciando a renomeação de arquivos...
echo.

rem Itera sobre todos os arquivos com o padrão especificado na pasta atual
for %%f in ("*.ogg") do (
    rem Obtém o nome do arquivo atual
    set "nome_arquivo=%%~nf%%~xf"

    echo Renomeando arquivo: %%f

    rem Substitui espaços por "_" no nome do arquivo
    set "novo_nome=!nome_arquivo: =_!"

    rem Substitui "&" por "and" no nome do arquivo
    set "novo_nome=!novo_nome:&=and!"

    rem Remove hifens do nome do arquivo
    set "novo_nome=!novo_nome:-=!"

    rem Remove múltiplos underscores consecutivos
    set "novo_nome=!novo_nome:__=_!"

    echo Novo nome: !novo_nome!

    rem Renomeia o arquivo com o novo nome
    ren "%%f" "!novo_nome!"
)

echo.
echo Renomeação concluída.
pause
