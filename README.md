# mmd-auto-trace-3-docker
Tool to run MMD auto trace v3 on Docker

See [README.en.md](README.en.md) if you are not familier with Japanese.

## 動作に必要なもの

- Windows 11
- 4GB以上のVRAMを搭載したNVIDIA GPU
- WSL (Windows Subsystem for Linux)
- [Docker Desktop](https://www.docker.com/)

## 動作環境の準備

1. WSLのインストール

PowerShell上で下記のコマンドを実行するとWSLがインストールされます。
```
wsl --install
```

2. [Docker Desktop](https://www.docker.com/) をダウンロードしてインストール

## 実行方法

1. 動画ファイルを run_trace.bat にドラッグ＆ドロップ

以上です。処理が完了したらVMDファイルが入った新しいフォルダが開きます。
例えば動画ファイルが "c:\data\test.mp4" の場合、フォルダは "c:\data\test_20221103_210358\06_motion" のような名前になります。(日付と時刻によってフォルダ名が変わります)

## ライセンス
MIT License です。詳しくは [LICENSE](LICENSE) 参照。

このプログラムは mmd-auto-trace-3 コンテナを走らせますが、そのコンテナには下記のプログラムが含まれます。実行前に各プログラムのライセンスを確認し同意する必要があります。

- [mmd-auto-trace-3 (MIT License)](https://github.com/miu200521358/mmd-auto-trace-3/blob/main/LICENSE)
- [AlphaPose](https://github.com/MVIG-SJTU/AlphaPose#license)
- [3D-Multi-Person-Pose (MIT License)](https://github.com/miu200521358/3D-Multi-Person-Pose/blob/main/LICENSE)
- [PoseTriplet (MIT License)](https://github.com/Garfield-kh/PoseTriplet/blob/main/LICENSE)
