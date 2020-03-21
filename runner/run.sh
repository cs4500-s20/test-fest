#!/bin/bash

TESTS_DIR=../tests

echo 'CS4500 TEST BASIC'
(make clean && make basic_example && ./timeout.sh -t 180 ./basic_example) 1>/dev/null 2>&1
br=$?
echo "$br"
if [ "$br" == "0" ]; then
    for t in $TESTS_DIR/* 
    do
      echo 'CS4500 TEST' $(basename ${t})
      cp "${t}" basic_example.cpp
      (make clean && make basic_example && ./timeout.sh -t 180 ./basic_example) 1>/dev/null 2>&1
      r=$?
      echo "$r"
    done
fi
