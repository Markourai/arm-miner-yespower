#
# Dockerfile for yespower_arm 
# usage: docker run yespower_arm --url xxxx --user xxxx --pass xxxx
# ex: docker run yespower_arm --url stratum+tcp://ltc.pool.com:80 --user creack.worker1 --pass abcdef
#

FROM 		debian:bookworm
LABEL		org.opencontainers.image.authors="koumarben666"

RUN		apt-get update -qq

RUN		apt-get install -qqy automake libcurl4-openssl-dev git make wget libssl-dev build-essential libgmp-dev libjansson-dev zlib1g-dev

RUN 		git clone https://github.com/Markourai/arm-miner-yespower

RUN             cd arm-miner-yespower && \
                ./autogen.sh && \
                ./configure CFLAGS='-O2 -fomit-frame-pointer' && \
                make

COPY 		entrypoint.sh /

ENV 		POOL_USER="xxxx" \
    		POOL_PASS="c=CPU,mc=CPU,pl=500" \
    		POOL_URL="stratum+tcp://cpupower.eu.mine.zergpool.com:4250" \
    		ALGO="YespowerCpu" 

WORKDIR		/arm-miner-yespower
CMD 		["/entrypoint.sh"]