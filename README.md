## 概要
声質変換モデル StarGANv2-VC を用いたリアルタイム声質変換器です

## WSL2 実行への対応について
WSL2 ではホスト PC の音声デバイスを認識していないので、PulseAudio を使ってホスト PC 側の音声デバイスを認識（通信？）してやることで解決  
WSL2 側では WSLg に PulseAudio がプリインストール？されているため、環境変数 PULSE_SERVER へ通信先を設定するだけ  
が、WSL2 を使った上で Docker からホスト PC の音声デバイスを認識したいのであれば
- WSLg のマウント
- PULSE_SERVER に通信先の設定
- pulseaudio の明示的なインストール（プリインストール？されていないため）  
  ```bash
  apt-get install -y pulseaudio
  ```
の 3 つを行う必要がある  

### 参考URL
- [Playing sound in Docker container on WSL in Windows 11](https://stackoverflow.com/questions/68310978/playing-sound-in-docker-container-on-wsl-in-windows-11)
- [WSL2+Ubuntu 20.04環境から音声を出力する](https://astherier.com/blog/2020/08/wsl2-ubuntu-sound-setting/)
