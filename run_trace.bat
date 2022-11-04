@echo off

if "%~1"=="" (
    echo usage: run_trace.bat movie_file
    pause
    exit /b
)

set VERSION=3.00.00

set INPUT_DIR=%~dp1
set INPUT_FILE=%~nx1
set INPUT_STEM=%~n1
set TM=%time: =0%
set TM2=%TM::=%
set DTTM=%date:/=%_%TM2:~0,6%

set COMMAND="cd /mmd-auto-trace-3/src && python3.9 executor.py --video-file '/input/%INPUT_FILE%' --parent-dir '/input/%INPUT_STEM%_%DTTM%' --process prepare,alphapose,multipose,posetriplet,mix,motion --verbose 20 --log-mode 0 --lang en"

docker run --gpus all --rm -ti -v "%INPUT_DIR%:/input" errnommd/mmd-auto-trace-3:%VERSION% bash -c %COMMAND%

set MOTION_DIR=%INPUT_DIR%%INPUT_STEM%_%DTTM%\06_motion
explorer "%MOTION_DIR%"

pause
