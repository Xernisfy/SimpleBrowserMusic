@echo off
setlocal enabledelayedexpansion
chcp 65001
cls

set "startDir=%cd%"
break>"%startDir%\music.txt"

call :findMusic
exit

:findMusic
  for /d %%d in (*) do (
    chdir "%%d"
    call :findMusic %*%%d\
    chdir ..
  )
  for %%f in (*.mp3) do echo %*%%f>>"%startDir%\music.txt"
