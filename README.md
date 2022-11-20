# mmd-auto-trace-3-docker
Tool to run MMD auto trace v3 on Docker

See [README.en.md](README.en.md) if you are not familier with Japanese.

## 概要

[MMD自動トレースv3](https://qiita.com/miu200521358/items/fb0a7bcf2764d7797e26)を(Dockerを用いて)ローカルPCで動かすためのツールです。

## 動作に必要なもの

- Windows 11 または、バージョン21H2以降のWindows 10
- 4GB以上のVRAMを搭載したNVIDIA GPU
- WSL (Windows Subsystem for Linux)
- [Docker Desktop](https://www.docker.com/)
- 10GB程度のデータをダウンロードできるインターネット回線

## 動作環境の準備

1. WSLのインストール

PowerShell上で下記のコマンドを実行するとWSLがインストールされます。
```
wsl --install -d Ubuntu
```

2. [Docker Desktop](https://www.docker.com/) をダウンロードしてインストール

## 実行方法

0. Docker Desktop を起動しておく  
   Windows起動後に一度実行すればOKです。
   なお初回起動時には利用規約を承諾(Accept)する必要があります。

1. 動画ファイルを run_trace.bat にドラッグ＆ドロップ

以上です。処理が完了したらVMDファイルが入った新しいフォルダが開きます。
例えば動画ファイルが "c:\data\test.mp4" の場合、フォルダは "c:\data\test_20221103_210358\06_motion" のような名前になります。(日付と時刻によってフォルダ名が変わります)

まずは[サンプル動画](https://drive.google.com/open?id=1ccBzmONGNDbvmKa7SSqwMRPKQ3q-_6LG)で試し、正常にVMDファイルが作られるのを確認することをお勧めします。

## ライセンス
MIT License です。詳しくは [LICENSE](LICENSE) 参照。

このプログラムは mmd-auto-trace-3 コンテナを走らせますが、そのコンテナには下記のプログラムが含まれます。実行前に各プログラムのライセンスを確認し同意する必要があります。

- [mmd-auto-trace-3 (MIT License)](https://github.com/miu200521358/mmd-auto-trace-3/blob/main/LICENSE)
- [AlphaPose](https://github.com/MVIG-SJTU/AlphaPose#license)
- [3D-Multi-Person-Pose (MIT License)](https://github.com/miu200521358/3D-Multi-Person-Pose/blob/main/LICENSE)
- [PoseTriplet (MIT License)](https://github.com/Garfield-kh/PoseTriplet/blob/main/LICENSE)

## FAQ

Q. 「docker: error during connect: This error may indicate that the docker daemon is not running.」というエラーが出る。

A. Docker Desktopが動いていないと思われるので、Docker Desktopを起動してから再実行してください。

Q. 動かない / NVIDIA GPUが無い

A. [Colab版](https://colab.research.google.com/github/miu200521358/motion_trace_colab/blob/master/MMDAutoTrace3.ipynb)をお勧めします。

## 連絡先

バグ報告は下記のいずれかにどうぞ。
表示されたメッセージと、本プログラムのバージョンを併せてご連絡ください。
エラーメッセージはコピー＆ペーストでそのままの内容を貼り付けてください。
Twitterの場合は文字数が限られるのでスクリーンショットでも構いません。
（必要な情報が書かれていなかったり、FAQにある内容だったり、あるいは単に忙しかったりすると放置するかもしれませんがご了承ください）

- GitHub の issues
  https://github.com/errno-mmd/mmd-auto-trace-3-docker/issues
- Twitter で @errno_mmd にメンションを送る
  https://twitter.com/errno_mmd
