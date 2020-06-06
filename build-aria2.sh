#!bash
sudo apt install libxml2-dev libcppunit-dev autoconf automake autotools-dev autopoint libtool -y
if [[ -d aria2 ]]; then
    cd aria2
    git checkout master
    git reset --hard origin || git reset --hard
    git pull
else
    git clone https://github.com/aria2/aria2 --depth=1 --config http.sslVerify=false
    cd aria2
fi
git am -3 ../aria2-*.patch
autoreconf -i
./configure \
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
    ARIA2_STATIC=yes
make
strip -s src/aria2c
