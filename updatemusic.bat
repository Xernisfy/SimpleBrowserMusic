@echo off
chcp 65001
cls

set "startDir=%cd%"
break>"%startDir%\music.txt"

call :findMusic
exit

:findMusic
  for /d %%d in (*) do (
    chdir "%%d"
    call :findMusic
    chdir ..
  )
  for %%f in (*.mp3) do echo %cd%\%%f>>"%startDir%\music.txt"
