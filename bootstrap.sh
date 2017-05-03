#!/bin/bash

/usr/jexus/jws start

function stop_svc {
  /usr/jexus/jws stop
  exit 0
}

trap 'stop_svc' SIGTERM

while true
do
	sleep 3
done
