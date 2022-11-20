# mmd-auto-trace-3-docker
Tool to run [MMD auto trace v3](https://qiita.com/miu200521358/items/fb0a7bcf2764d7797e26) on Docker

## System requirements
- Windows 11 or Windows 10 (version 21H2 or later)
- NVIDIA GPU with at least 4GB VRAM
- WSL (Windows Subsystem for Linux)
- [Docker Desktop](https://www.docker.com/)
- Broadband Internet access for downloading about 10GB data

## Installation
1. Install WSL

You can install WSL by following command on PowerShell
```
wsl --install -d Ubuntu
```
2. Download & Install [Docker Desktop](https://www.docker.com/)

## Run

0. Start Docker Desktop  
   For the first time, you need to accept the service agreement.

1. Drag & drop a movie file to run_trace.bat

That's all. You will find a new folder containing generated VMD files when the process finished.  
For example, if the input movie file is "c:\data\test.mp4", the VMD files may be generated in a folder such as "c:\data\test_20221103_210358\06_motion" (the folder name varies based on date & time)

## License
MIT License. Please see [LICENSE](LICENSE) for details.

This program runs the mmd-auto-trace-3 container that contains following programs. Please read and agree to their licenses before using this program.

- [mmd-auto-trace-3 (MIT License)](https://github.com/miu200521358/mmd-auto-trace-3/blob/main/LICENSE)
- [AlphaPose](https://github.com/MVIG-SJTU/AlphaPose#license)
- [3D-Multi-Person-Pose (MIT License)](https://github.com/miu200521358/3D-Multi-Person-Pose/blob/main/LICENSE)
- [PoseTriplet (MIT License)](https://github.com/Garfield-kh/PoseTriplet/blob/main/LICENSE)

## Bug report

If you find a bug, please contact me.

- Create an "issue" on GitHub
  https://github.com/errno-mmd/mmd-auto-trace-3-docker/issues
- Mention to @errno_mmd on Twitter
  https://twitter.com/errno_mmd
