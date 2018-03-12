#!/usr/bin/env bash

echo
MW=$1 node $2 &
pid=$!

sleep 2

wrk 'http://localhost:3000' \
  -d 3 \
  -c 50 \
  -t 8 \
  | grep 'Requests/sec' \
  | awk '{ print "  " $2 }'

kill $pid