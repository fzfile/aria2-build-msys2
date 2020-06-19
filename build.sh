#!bash
cd aria2
git checkout -b patch
git am -3 ../aria2-*.patch

autoreconf -fi || autoreconf -fiv
./configure \
    --host=$HOST \
    --prefix=$PREFIX \
    --without-included-gettext \
    --disable-nls \
    --with-libcares \
    --without-gnutls \
    --without-openssl \
    --with-sqlite3 \
    --without-libxml2 \
    --with-libexpat \
    --with-libz \
    --with-libgmp \
    --with-libssh2 \
    --without-libgcrypt \
    --without-libnettle \
    --with-cppunit-prefix=$PREFIX \
    ARIA2_STATIC=yes \
    CPPFLAGS="-I$PREFIX/include" \
    LDFLAGS="-L$PREFIX/lib -Wl,--gc-sections,--build-id=none" \
    PKG_CONFIG_PATH="$PREFIX/lib/pkgconfig"
make -j$CPUCOUNT
strip -s src/aria2c.exe
git checkout master
git branch patch -D
