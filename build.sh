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
    --without-libnettle
    ARIA2_STATIC=yes
make
strip -s src/aria2c
git checkout master
git branch patch -D
