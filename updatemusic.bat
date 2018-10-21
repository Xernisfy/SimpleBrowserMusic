@echo off
rem change codepage to utf-8
chcp 65001

rem set temporary variables
set "startDir=%cd%"
set "tree=└─"

rem create an empty music.txt or empties it, if it already exists
break>"%startDir%\music.txt"

rem search through the current directory recursively
echo %startDir%
call :findMusic
pause
exit /b

:findMusic
  rem search for all sub-directories first
  for /d %%d in (*) do (
    rem show current directory in tree structure
    echo %tree%%%d
    chdir "%%d"
    set "tree=│ %tree%"
    rem switch to the sub-directory and continue search
    call :findMusic %*%%d\
    chdir ..
    set "tree=%tree:~2%"
  )
  rem no further sub-directories? search for all mp3 files and list them in the music.txt file
  for %%f in (*.mp3) do echo %*%%f>>"%startDir%\music.txt"
