## Install FFmpeg 2.x on Ubuntu

This install script puts together the pieces described [here](https://trac.ffmpeg.org/wiki/UbuntuCompilationGuide).

This will give you FFmpeg binaries with the following optional codecs:

- x264
- AAC
- MP3
- VP8/VP9

You can customize the installation paths by changing the `FFMPEG_PREFIX` and `FFMPEG_BINDIR` in the script.

## Installation

```sh
$ wget https://raw.githubusercontent.com/zhm/ffmpeg-ubuntu/master/install_ffmpeg.sh
$ chmod +x install_ffmpeg.sh
$ ./install_ffmpeg.sh
```
