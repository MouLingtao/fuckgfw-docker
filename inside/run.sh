#!/bin/bash

echo "=> Build Done!"

/sbin/service sshd start
/sbin/service qtunnel start
/sbin/service crond start

echo "=> Service started!"

while true; do
    sleep 1;
done;