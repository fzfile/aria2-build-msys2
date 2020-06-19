#!bash
cd aria2
git checkout -b patch
git am -3 ../aria2-*.patch

autoreconf -i
./configure \
    --without-included-gettext \
    --disable-nls \
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
strip -s src/aria2c
git checkout master
git branch patch -D
