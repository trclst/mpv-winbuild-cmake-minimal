ExternalProject_Add(ffmpeg
    DEPENDS
        amf-headers
        nvcodec-headers
        bzip2
        lcms2
        openssl
        libsrt
        libass
        libpng
        libvpx
        libwebp
        libzimg
        fontconfig
        harfbuzz
        opus
        vorbis
        x264
        ${ffmpeg_x265}
        libxml2
        libvpl
        libjxl
        shaderc
        libplacebo
        rubberband
        libva
    GIT_REPOSITORY https://github.com/FFmpeg/FFmpeg.git
    SOURCE_DIR ${SOURCE_LOCATION}
    GIT_CLONE_FLAGS "--filter=tree:0"
    UPDATE_COMMAND ""
    CONFIGURE_COMMAND ${EXEC} CONF=1 <SOURCE_DIR>/configure
        --cross-prefix=${TARGET_ARCH}-
        --prefix=${MINGW_INSTALL_PREFIX}
        --arch=${TARGET_CPU}
        --target-os=mingw32
        --pkg-config-flags=--static
        --enable-cross-compile
        --enable-runtime-cpudetect
        ${ffmpeg_hardcoded_tables}
        --enable-gpl
        --enable-version3
        --enable-postproc
        --disable-vapoursynth
        --enable-libass
        --disable-libbluray
        --enable-libfreetype
        --enable-libfribidi
        --enable-libfontconfig
        --enable-libharfbuzz
        --disable-libmodplug
        --disable-libopenmpt
        --disable-libmp3lame
        --enable-lcms2
        --enable-libopus
        --disable-libsoxr
        --disable-libspeex
        --enable-libvorbis
        --disable-libbs2b
        --enable-librubberband
        --enable-libvpx
        --enable-libwebp
        --enable-libx264
        --enable-libx265
        --disable-libaom
        --disable-librav1e
        --disable-libdav1d
        --disable-libdavs2
        --disable-libuavs3d
        --disable-libxvid
        --enable-libzimg
        --enable-openssl
        --enable-libxml2
        --disable-libmysofa
        --disable-libssh
        --enable-libsrt
        --enable-libvpl
        --enable-libjxl
        --enable-libplacebo
        --enable-libshaderc
        --disable-libzvbi
        --disable-libaribcaption
        --enable-cuda-llvm
        --enable-cuvid
        --enable-nvdec
        --enable-nvenc
        --enable-amf
        --disable-openal
        --enable-opengl
        --disable-doc
        --disable-ffplay
        --disable-ffprobe
        --enable-vaapi
        --disable-vdpau
        --disable-videotoolbox
        --disable-decoder=libaom_av1
        ${ffmpeg_lto}
        --extra-cflags='-Wno-error=int-conversion'
        "--extra-libs='${ffmpeg_extra_libs}'" # -lstdc++ / -lc++ needs by libjxl and shaderc
    BUILD_COMMAND ${MAKE}
    INSTALL_COMMAND ${MAKE} install
    LOG_DOWNLOAD 1 LOG_UPDATE 1 LOG_CONFIGURE 1 LOG_BUILD 1 LOG_INSTALL 1
)

force_rebuild_git(ffmpeg)
cleanup(ffmpeg install)
