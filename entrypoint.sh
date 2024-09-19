#!/bin/sh

# Check for environment variable and set command accordingly
CPU="/arm-miner-yespower/sugarmaker"

if [ "${ALGO}" != "" ]; then
    ALGO_OPTS="--algo=${ALGO}"
fi

if [ "${POOL_PASS}" != "" ]; then
    PASS_OPTS="--pass=${POOL_PASS}"
fi

if [ "${POOL_USER}" != "" ]; then
    USER_OPTS="--user=${POOL_USER}"
fi

if [ "${POOL__URL}" != "" ]; then
    URL_OPTS="--pass=${POOL_URL}"
fi

echo $CPU

COMMAND="${CPU} --algo=${ALGO} --user=${POOL_USER} --url=${POOL_URL} --pass=${POOL_PASS}"    

echo $COMMAND
exec $COMMAND