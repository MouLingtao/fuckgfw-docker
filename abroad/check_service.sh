#!/bin/bash

( /bin/ps -ef | /bin/grep "qtunnel" | /bin/grep -v "grep" > /dev/null) || ( /sbin/service qtunnel restart )

( /bin/ps -ef | /bin/grep "polipo" | /bin/grep -v "grep" > /dev/null ) || ( /sbin/service polipo restart )