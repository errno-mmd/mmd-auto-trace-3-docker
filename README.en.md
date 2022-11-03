# mmd-auto-trace-3-docker
Tool to run MMD auto trace v3 on Docker

## System requirements
- Windows 11
- NVIDIA GPU with at least 4GB VRAM
- WSL (Windows Subsystem for Linux)
- [Docker Desktop](https://www.docker.com/)

## Installation
1. Install WSL

You can install WSL by following command on PowerShell
```
wsl --install
```
2. Download & Install [Docker Desktop](https://www.docker.com/)

## Run
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
