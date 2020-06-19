cd aria2
pip install sphinx
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
make
strip -s src/aria2c
7z a aria2c.7z src/aria2c
appveyor PushArtifact aria2c.7z
