# WARNING
# Try on Virtual Machine (Ubuntu 16.04)
# https://lxadm.com/Static_compilation_of_cpuminer

# DEPENDS

## OPENSSL
wget https://www.openssl.org/source/openssl-1.0.2t.tar.gz
tar -xvzf openssl-1.0.2t.tar.gz
cd openssl-1.0.2t/
./config no-shared
make -j$(nproc)
sudo make install
cd ..

## CURL
wget https://github.com/curl/curl/archive/refs/tags/curl-7_79_1.tar.gz
tar -xvzf curl-7_79_1.tar.gz
cd curl-7_79_1/
./buildconf | grep "buildconf: OK"
./configure --disable-shared | grep "Static=yes"
make -j$(nproc)
sudo make install
cd ../..
