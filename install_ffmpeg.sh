sudo apt-get update

sudo apt-get remove ffmpeg x264 libx264-dev libvpx

sudo apt-get -y install autoconf automake build-essential libass-dev libgpac-dev \
  libsdl1.2-dev libtheora-dev libtool libva-dev libvdpau-dev libvorbis-dev libx11-dev \
  libxext-dev libxfixes-dev pkg-config texi2html zlib1g-dev libmp3lame-dev

FFMPEG_PREFIX="$(echo $HOME/local)"
FFMPEG_SOURCES="$(echo $HOME/ffmpeg_sources)"
FFMPEG_BINDIR="$(echo $FFMPEG_PREFIX/bin)"
PATH=$FFMPEG_BINDIR:$PATH

mkdir -p $FFMPEG_PREFIX
mkdir -p $FFMPEG_SOURCES

cd $FFMPEG_SOURCES
wget http://www.tortall.net/projects/yasm/releases/yasm-1.2.0.tar.gz
tar xzvf yasm-1.2.0.tar.gz
cd yasm-1.2.0
./configure --prefix="$FFMPEG_PREFIX" --bindir="$FFMPEG_BINDIR"
make
make install
make distclean



cd $FFMPEG_SOURCES
wget http://download.videolan.org/pub/x264/snapshots/last_x264.tar.bz2
tar xjvf last_x264.tar.bz2
cd x264-snapshot*
./configure --prefix="$FFMPEG_PREFIX" --bindir="$FFMPEG_BINDIR" --enable-static
make
make install
make distclean



cd $FFMPEG_SOURCES
wget -O fdk-aac.tar.gz https://github.com/mstorsjo/fdk-aac/tarball/master
tar xzvf fdk-aac.tar.gz
cd mstorsjo-fdk-aac*
autoreconf -fiv
./configure --prefix="$FFMPEG_PREFIX" --disable-shared
make
make install
make distclean



cd $FFMPEG_SOURCES
wget http://webm.googlecode.com/files/libvpx-v1.3.0.tar.bz2
tar xjvf libvpx-v1.3.0.tar.bz2
cd libvpx-v1.3.0
./configure --prefix="$FFMPEG_PREFIX" --disable-examples
make
make install
make clean



cd $FFMPEG_SOURCES
wget http://ffmpeg.org/releases/ffmpeg-snapshot.tar.bz2
tar xjvf ffmpeg-snapshot.tar.bz2
cd ffmpeg
PKG_CONFIG_PATH="$FFMPEG_PREFIX/lib/pkgconfig"
export PKG_CONFIG_PATH
./configure --prefix="$FFMPEG_PREFIX" --extra-cflags="-I$FFMPEG_PREFIX/include" \
   --extra-ldflags="-L$FFMPEG_PREFIX/lib" --bindir="$FFMPEG_BINDIR" --extra-libs="-ldl" --enable-gpl \
   --enable-libass --enable-libfdk-aac --enable-libmp3lame --enable-libtheora \
   --enable-libvorbis --enable-libvpx --enable-libx264 --enable-nonfree
make
make install
make distclean
hash -r
