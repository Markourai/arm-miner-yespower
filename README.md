# Yenten ARM miner (yespowerr16 algo)

cmd for test Yenten mining:
```
sugarmaker.exe -a yespowerr16 -o stratum+tcp://cpu-pool.com:63368 -u wallet_address
```

![GitHub All Releases](https://img.shields.io/github/downloads/yentencoin/yenten-arm-miner-yespowerr16/total)

This is a multi-threaded CPU miner for ***Yenten Coin***, fork of sugarmaker, fork of solardiz's (Resistance) fork of pooler's (Litecoin) fork of Jeff Garzik's (Bitcoin) reference cpuminer. This fork is supporting only Yespower variant algorithms.

License:  [GPLv2](https://www.gnu.org/licenses/old-licenses/gpl-2.0.en.html).  See COPYING for details.

Git tree:  https://github.com/yentencoin/yenten-arm-miner-yespowerr16

### Build dependencies:
```
autoconf
automake
GNU make
gcc
libcurl	https://curl.haxx.se/libcurl/
```

- On recent Debian and Ubuntu, these can be installed with:
```
sudo apt-get install build-essential libcurl4-openssl-dev autotools-dev automake libtool
```

### Basic Unix build instructions:
```
./autogen.sh
./configure CFLAGS="-Wall -O2 -fomit-frame-pointer" CXXFLAGS="$CFLAGS -std=gnu++11"
make
```

Notes for AIX users:
- To build a 64-bit binary, export `OBJECT_MODE=64`
- GNU-style long options are not supported, but are accessible via configuration file

### Basic Windows build instructions, using MinGW:
- Install MinGW and the MSYS Developer Tool Kit (http://www.mingw.org/)
	* Make sure you have `mstcpip.h` in `MinGW\include`
- If using MinGW-w64, install `pthreads-w64`
- Install `libcurl devel` (https://curl.haxx.se/download.html)
	* Make sure you have `libcurl.m4` in `MinGW\share\aclocal`
	* Make sure you have `curl-config` in `MinGW\bin`
- In the MSYS shell, run:
	```
	./autogen.sh
	LIBCURL='-lcurldll' ./configure
	make
	```

### Usage instructions:
Run `sugarmaker --help` to see options. You can solo-mine using these options:

- Mainnet (Solo)
```
./sugarmaker -a yespowerr16 -o http://127.0.0.1:9982 -u user -p pass --coinbase-addr=wallet_address -t1
```
- Mainnet (Stratum Pool)
```
./sugarmaker -a yespowerr16 -o stratum+tcp://cpu-pool.com:63368 -u wallet_address -t1
```

(Omit the leading `./` if you're on Windows.)  For the above to work, for solo mining you need
a *fully-synced node* running locally and with RPC username/password configured,

- e.g. with the below in your `.yenten/yenten.conf`:
```
rpcbind=127.0.0.1
rpcallowip=127.0.0.0/8
rpcuser=user
rpcpassword=pass
```

- Connecting through a proxy:
	* Use the `--proxy` option.
	* To use a SOCKS proxy, add a `socks4://` or `socks5://` prefix to the proxy host.
	* Protocols `socks4a` and `socks5h`, allowing remote name resolving, are also available since libcurl 7.18.0.
	* If no protocol is specified, the proxy is assumed to be a HTTP proxy.
	* When the `--proxy` option is not used, the program honors the `http_proxy` and `all_proxy` environment variables.

### Author
- Jeff Garzik <jeff@garzik.org>
- Pooler <pooler@litecoinpool.org>
- Alexander Peslyak <solar@openwall.com>
- Kanon <60179867+decryp2kanon@users.noreply.github.com>
- Yentencoin
