#!/usr/bin/env bash
let tries=10

if [ -z "$*" ] ; then
    echo "Need to specify ssh options"
    exit 1
fi

while [[ $tries -ne 0 ]] ; do
    ssh $*
    retcode=$?
    if [[ $retcode -eq 0 ]] ; then
        let tries=1
    else
        echo "Failed, retrying..."
        sleep 1
    fi
    let tries--
done

if [[ $retcode -ne 0 ]] ; then
    echo "Connection to $* failed, giving up"
fi
