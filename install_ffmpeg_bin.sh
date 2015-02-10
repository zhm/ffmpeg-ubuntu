sudo apt-get update

sudo apt-get remove ffmpeg x264 libx264-dev libvpx

sudo apt-get -y install autoconf automake build-essential libass-dev libgpac-dev \
  libsdl1.2-dev libtheora-dev libtool libva-dev libvdpau-dev libvorbis-dev libx11-dev \
  libxext-dev libxfixes-dev pkg-config texi2html zlib1g-dev libmp3lame-dev \
  libopencore-amrnb-dev libopencore-amrwb-dev libvo-amrwbenc-dev

FFMPEG_PREFIX="$(echo $(pwd)/local)"
FFMPEG_BINDIR="$(echo $FFMPEG_PREFIX/bin)"

mkdir -p $FFMPEG_PREFIX
mkdir -p $FFMPEG_BINDIR

cd $FFMPEG_BINDIR
wget http://zhm.s3.amazonaws.com/ffmpeg/ffmpeg-ubuntu-trusty-amd64-bin.tar.gz -O ffmpeg.tar.gz
tar xzvf ffmpeg.tar.gz
