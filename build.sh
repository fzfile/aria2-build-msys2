#!bash
cd aria2
git apply ../aria2-*.patch
autoreconf -i
./configure  --with-libssh2  ARIA2_STATIC=yes
make
strip -s src/aria2c