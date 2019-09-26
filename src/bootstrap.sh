#!/bin/bash

function start_jws {
  /usr/jexus/jws start
}

function stop_jws {
  /usr/jexus/jws stop
}

function wait_for_exit {
  while pgrep -f "/usr/jexus" > /dev/null; do
    /bin/sleep 1
  done
  echo "All jexus process have stopped."
}

function signal_trap {
  echo "A SIGTERM or SIGINT signal was caught; trying to shut down."
  stop_jws
}

trap signal_trap SIGTERM SIGINT

start_jws

echo "wait 3 seconds for jexus startup"
/bin/sleep 3

echo "Listening for termination signals..."

wait_for_exit
